package com;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.http.HttpResponse;

import com.api.run.RunForLargeFilesHR;

public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// location to store file uploaded
	private static String UPLOAD_DIRECTORY = "/tmp/";

	public static String getUploadDirectory() {
		return UPLOAD_DIRECTORY;
	}

	public static void setUploadDirectory(String dir) {
		UPLOAD_DIRECTORY = dir;
	}

	// upload settings
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	/**
	 * Upon receiving file upload submission, parses the request to read upload
	 * data and saves the file on disk.
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// checks if the request actually contains upload file
		if (!ServletFileUpload.isMultipartContent(request)) {
			// if not, we stop here
			PrintWriter writer = response.getWriter();
			writer.println("Error: Form must has enctype=multipart/form-data.");
			writer.flush();
			return;
		}

		// configures upload settings
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// sets memory threshold - beyond which files are stored in disk
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		// sets temporary location to store files
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);

		// sets maximum size of upload file
		upload.setFileSizeMax(MAX_FILE_SIZE);

		// sets maximum size of request (include file + form data)
		upload.setSizeMax(MAX_REQUEST_SIZE);

		// constructs the directory path to store upload file
		// this path is relative to application's directory
		String uploadPath = getServletContext().getInitParameter("file-upload");

		String configPath = getServletContext().getInitParameter("config-path");
		// String uploadPath = getServletContext().getRealPath("") +
		// File.separator + UPLOAD_DIRECTORY;
		// String uploadPath = UPLOAD_DIRECTORY;

		// creates the directory if it does not exist
		// String workingDir = System.getProperty("user.dir");

		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		HashMap<String, String> keyValues = new HashMap<>();

		String inputfilePath = null;

		try {
			// parses the request's content to extract file data
			@SuppressWarnings("unchecked")
			List<FileItem> formItems = upload.parseRequest(request);

			if (formItems != null && formItems.size() > 0) {
				// iterates over form's fields
				for (FileItem item : formItems) {
					// processes only fields that are not form fields
					if (!item.isFormField()) {
						String fileName = new File(item.getName()).getName();
						inputfilePath = uploadPath + File.separator + fileName;
						File storeFile = new File(inputfilePath);
						request.setAttribute("path",
								storeFile.getAbsolutePath());
						System.out.println("path->"
								+ storeFile.getAbsolutePath());
						// saves the file on disk
						item.write(storeFile);
						// request.setAttribute("message",
						// "Email Sent");
					} else {

						String name = item.getFieldName();// text1
						String value = item.getString();
						System.out
								.println("name->" + name + " value->" + value);
						if (!keyValues.containsKey(name)) {
							keyValues.put(name, value);
						}

					}
				}
			}
			System.out.println(keyValues.keySet());
			LongProcess lp = new LongProcess(keyValues, uploadPath,
					inputfilePath, configPath, request, response);
			lp.start();
			String sendEmailVal = keyValues.get("sendEmail");
			if (!sendEmailVal.equals("email")) {
				while (lp.getProgress() != 100) {
					request.setAttribute("progress", lp.getProgress());
				}
			}
			try {
				request.setAttribute("email", keyValues.get("email"));
				getServletContext().getRequestDispatcher("/message.jsp")
						.forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} catch (Exception ex) {
			request.setAttribute("message",
					"There was an error: " + ex.getMessage());
		}
		// redirects client to message page
		// / getServletContext().getRequestDispatcher("/message.jsp").forward(
		// request, response);
	}

	private static void process(HashMap<String, String> keyValues,
			String uploadPath, String inputfilePath, String configPath,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		if (keyValues.keySet().size() > 0) {
			if (keyValues.get("type").equals("HumanResource")
					&& inputfilePath != null) {
				String outputPath = uploadPath + File.separator + "test_"+System.currentTimeMillis()+".csv";
				outputPath = RunAPI.runHR(outputPath, inputfilePath,
						configPath, keyValues);
				for (String key : keyValues.keySet()) {
					request.setAttribute(key, keyValues.get(key));
				}

				if (!keyValues.get("sendEmail").equals("email")) {
					writeToResponse(outputPath, response,
							keyValues.get("sendEmail"));
				}
			} else if (keyValues.get("type").equals("InternetArchive")
					&& inputfilePath != null) {

				String outputPath = uploadPath + File.separator + "test_"+System.currentTimeMillis()+".csv";
				outputPath = RunAPI.runIA(outputPath, inputfilePath,
						configPath, keyValues);
				for (String key : keyValues.keySet()) {
					request.setAttribute(key, keyValues.get(key));
				}

				if (!keyValues.get("sendEmail").equals("email")) {
					writeToResponse(outputPath, response,
							keyValues.get("sendEmail"));
				}
			} else if (keyValues.get("type").equals("GeoCode")
					&& inputfilePath != null) {
				String outputPath = uploadPath + File.separator + "test_"+System.currentTimeMillis()+".csv";
				outputPath = RunAPI.runGeo(inputfilePath, outputPath,
						configPath, keyValues);

				for (String key : keyValues.keySet()) {
					request.setAttribute(key, keyValues.get(key));
				}

				if (!keyValues.get("sendEmail").equals("email")) {
					writeToResponse(outputPath, response,
							keyValues.get("sendEmail"));
				}
			} else if (keyValues.get("type").equals("General")
					&& inputfilePath != null) {
				String outputPath = uploadPath + File.separator + "test_"+System.currentTimeMillis()+".csv";
				outputPath = RunAPI.runGeneral(inputfilePath, outputPath,
						keyValues);
				System.out.println(outputPath);
				if (!keyValues.get("sendEmail").equals("email")) {
					for (String key : keyValues.keySet()) {
						request.setAttribute(key, keyValues.get(key));
					}
					writeToResponse(outputPath, response,
							keyValues.get("sendEmail"));
				}
			}
		}
	}

	private static void writeToResponse(String outputPath,
			HttpServletResponse response, String email) throws IOException {
		response.setHeader("Content-type", "application/csv");
		response.setHeader("Content-disposition", "inline; filename=result.csv");
		PrintWriter out = response.getWriter();
		BufferedReader br = new BufferedReader(new FileReader(new File(
				outputPath)));
		String line;
		while ((line = br.readLine()) != null) {
			out.println(line);
		}
		out.flush();
		out.close();
		br.close();
	}

	class LongProcess extends Thread {

		private int progress;
		HashMap<String, String> keyValues;
		String uploadPath;
		String inputfilePath;
		String configPath;
		HttpServletRequest request;
		HttpServletResponse response;

		public LongProcess(HashMap<String, String> keyValues,
				String uploadPath, String inputfilePath, String configPath,
				HttpServletRequest request, HttpServletResponse response) {
			this.keyValues = keyValues;
			this.uploadPath = uploadPath;
			this.inputfilePath = inputfilePath;
			this.configPath = configPath;
			this.request = request;
			this.response = response;
			progress = 0;
		}

		public void run() {

			try {
				process(keyValues, uploadPath, inputfilePath, configPath,
						request, response);
				progress = 100;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		public int getProgress() {
			return progress;
		}

	}

}
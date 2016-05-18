package com;

import java.util.HashMap;

import com.api.run.RunForLargeFileGeneral;
import com.api.run.RunForLargeFileGeo;
import com.api.run.RunForLargeFilesHR;
import com.api.run.RunForLargeFilesIA;

public class RunAPI {

	public static String runHR(String outputPath, String inputfilePath,
			String configPath, HashMap<String, String> keyValues) {
		String[] keys = new String[2];
		keys[0] = "date_of_capture_yyyymmdd";
		keys[1] = "archived_url";
		String sendEmailVal = keyValues.get("sendEmail");
		boolean sendEmail = false;
		if (sendEmailVal.equals("email")) {
			sendEmail = true;
		}
		RunForLargeFilesHR hr = new RunForLargeFilesHR(configPath,
				"HumanResource");
		outputPath = hr.runHRWithFile(inputfilePath, outputPath,
				keyValues.get("timeStamp"),
				Integer.parseInt(keyValues.get("url")), keys, sendEmail,
				keyValues.get("email"));

		return outputPath;
	}

	public static String runIA(String outputPath, String inputfilePath,
			String configPath, HashMap<String, String> keyValues) {
		String[] keys = new String[3];
		keys[0] = "url";
		keys[1] = "available";
		keys[2] = "timestamp";
		String sendEmailVal = keyValues.get("sendEmail");
		boolean sendEmail = false;
		if (sendEmailVal.equals("email")) {
			sendEmail = true;
		}
		RunForLargeFilesIA ia = new RunForLargeFilesIA(configPath,
				"InternetArchive");
		outputPath = ia.runIAWithFile(inputfilePath, outputPath,
				keyValues.get("timeStamp"),
				Integer.parseInt(keyValues.get("url")), keys, sendEmail,
				keyValues.get("email"));

		return outputPath;
	}

	public static String runGeo(String inputFile, String outputFile,
			String configPath, HashMap<String, String> keyValues) {
		RunForLargeFileGeo check = new RunForLargeFileGeo(configPath,
				"NycGeoCode");
		String[] keys = new String[6];
		keys[0] = "xCoordinate";
		keys[1] = "yCoordinate";
		keys[2] = "fromXCoordinate";
		keys[3] = "toXCoordinate";
		keys[4] = "fromYCoordinate";
		keys[5] = "toYCoordinate";
		// 97, 112, 98, 95, 96
		String sendEmailVal = keyValues.get("sendEmail");
		boolean sendEmail = false;
		if (sendEmailVal.equals("email")) {
	//		System.out.println("Yes Sending email");
			sendEmail = true;
		}
		if (Integer.parseInt(keyValues.get("inStreet")) == -1) {
			keyValues.put("inStreet", keyValues.get("street"));
		}
		if (Integer.parseInt(keyValues.get("crStreet")) == -1) {
			keyValues.put("crStreet", keyValues.get("street"));
		}
	//	System.out.println("Running Geo");
		outputFile = check.runGeoWithFile(inputFile, outputFile, keys,
				Integer.parseInt(keyValues.get("inStreet")),
				Integer.parseInt(keyValues.get("borough")),
				Integer.parseInt(keyValues.get("crStreet")),
				Integer.parseInt(keyValues.get("houseNum")),
				Integer.parseInt(keyValues.get("street")), sendEmail,
				keyValues.get("email"));
		return outputFile;
	}

	public static String runGeneral(String inputFile, String outputFile,
			HashMap<String, String> keyValues) {
		System.out.println(keyValues.keySet());
		String url = keyValues.get("url");
		RunForLargeFileGeneral check = new RunForLargeFileGeneral(url);
		String sendEmailVal = keyValues.get("sendEmail");
		boolean sendEmail = false;
		if (sendEmailVal.equals("email")) {
		//	System.out.println("Yes Sending email");
			sendEmail = true;
		}
		String keysS = keyValues.get("keys");
		String[] keys = keysS.split(",");
		//System.out.println(keysS);
		HashMap<String, Integer> keyValuesData = new HashMap<String, Integer>();
		String inputKeysS = keyValues.get("inputKeys");
		String[] inputKeys = inputKeysS.split(",");
		for (String key : inputKeys) {
			if (key.trim().length() > 0) {
			//	System.out.println(key);
				keyValuesData.put(key, Integer.parseInt(keyValues.get(key)));
			}
		}
//		System.out.println("Here!");
		outputFile = check.runGeneralWithFile(inputFile, outputFile, keys,
				keyValuesData, sendEmail, keyValues.get("email"));
		return outputFile;
	}

}

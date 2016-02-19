package com;

import java.util.HashMap;

import com.api.run.RunForLargeFileGeo;
import com.api.run.RunForLargeFilesHR;
import com.api.run.RunForLargeFilesIA;

public class RunAPI {

	public static String runHR(String outputPath, String inputfilePath,
			String configPath, HashMap<String, String> keyValues) {
		String[] keys = new String[2];
		keys[0] = "date_of_capture_yyyymmdd";
		keys[1] = "archived_url";
		RunForLargeFilesHR hr = new RunForLargeFilesHR(configPath, "HumanResource");
		outputPath = hr.runHRWithFile(inputfilePath, outputPath,
				keyValues.get("timeStamp"),  
				Integer.parseInt(keyValues.get("url")),keys, false);

		return outputPath;
	}
	
	public static String runIA(String outputPath, String inputfilePath,
			String configPath, HashMap<String, String> keyValues) {
		String[] keys = new String[3];
		keys[0] = "url";
		keys[1] = "available";
		keys[2] = "timestamp";
		
		RunForLargeFilesIA ia = new RunForLargeFilesIA(configPath, "InternetArchive");
		outputPath = ia.runIAWithFile(inputfilePath, outputPath,
				keyValues.get("timeStamp"), 
							Integer.parseInt(keyValues.get("url")),keys,false);

		return outputPath;
	}
	
	public static String runGeo(String inputFile, String outputFile, String configPath, HashMap<String, String> keyValues){
		RunForLargeFileGeo check = new RunForLargeFileGeo(configPath, "NycGeoCode");
		String[] keys = new String[6];
		keys[0] = "xCoordinate";
		keys[1] = "yCoordinate";
		keys[2] = "fromXCoordinate";
		keys[3] = "toXCoordinate";
		keys[4] = "fromYCoordinate";
		keys[5] = "toYCoordinate";
		// 97, 112, 98, 95, 96
		if (Integer.parseInt(keyValues.get("inStreet")) == -1){
			keyValues.put("inStreet", keyValues.get("street"));
		}
		if (Integer.parseInt(keyValues.get("crStreet")) == -1){
			keyValues.put("inStreet", keyValues.get("street"));
		}
		outputFile = check.runGeoWithFile(inputFile, outputFile, keys, 
				Integer.parseInt(keyValues.get("inStreet")),
				Integer.parseInt(keyValues.get("borough")),
				Integer.parseInt(keyValues.get("crStreet")),
				Integer.parseInt(keyValues.get("houseNum")),
				Integer.parseInt(keyValues.get("street")), false);
		return outputFile;
	}

}

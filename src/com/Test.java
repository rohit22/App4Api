package com;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

import com.api.run.RunForLargeFilesHR;

public class Test {

	
	public static void test() throws IOException{
		String file = "/config/config.xml";
		String workingDir = System.getProperty("user.dir");
		BufferedReader br = new BufferedReader(new FileReader(new File(workingDir+file)));
		String line;
		while((line = br.readLine())!=null){
			System.out.println(line);
		}
		br.close();
	}
	public static void main(String[] args) throws IOException {
		
		String configPath = "/Users/Admin/Documents/DigitalIntern2015/workspace/GeoCodeAPI/etc/config.xml";
		String config = "HumanResource";
		String timeStamp = "2008";
		String inputFile = "/Users/Admin/Documents/DigitalIntern2015/workspace/GeoCodeAPI/test/HRW1.csv";
		String outputFile = "/Users/Admin/Documents/DigitalIntern2015/workspace/GeoCodeAPI/test/result_HR1.csv";	
		String[] keys = new String[2];
		keys[0] = "date_of_capture_yyyymmdd";
		keys[1] = "archived_url";
		RunForLargeFilesHR check = new RunForLargeFilesHR(configPath, config);		
		check.runHRWithFile(inputFile, outputFile, timeStamp,  1, keys, false);
	}
	
}

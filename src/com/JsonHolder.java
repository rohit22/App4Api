package com;

import java.util.ArrayList;
import java.util.HashMap;

import com.api.utils.JsonParseRecursive;

public class JsonHolder {

	private String jSon = "";
	private HashMap<String, Object> parsedJson;

	public ArrayList<String> getKeys() {
		if (parsedJson == null) {
			parsedJson = JsonParseRecursive.getMap(this.jSon);
		}

		ArrayList<String> keySet = new ArrayList<String>();
		for (String key : parsedJson.keySet()) {
			keySet.add(key);
		}
		return keySet;
	}

	public JsonHolder(String jSon) {
		super();
		this.jSon = jSon;
	}

	public HashMap<String, Object> getKeyValues() {
		if (parsedJson == null) {
			parsedJson = JsonParseRecursive.getMap(this.jSon);
		}
		return parsedJson;
	}

}

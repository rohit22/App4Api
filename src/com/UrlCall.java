package com;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.api.utils.ServiceCall;

public class UrlCall {

	private URL url;
	private Map<String, String> queryParams;

	public UrlCall(String url) {
		super();
		try {
			this.url = getEncodedURL(url);
		} catch (MalformedURLException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getUrlResult(String url, Map<String, String> params) {
		String result = null;
		try {
			URL eUrl = getEncodedURL(url, params);
			result = ServiceCall.get(eUrl);
		} catch (MalformedURLException | UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public String getUrlResult() {

		String result = null;
		result = ServiceCall.get(this.url);
		return result;
	}

	public Map<String, String> getInputKeysValues() {
		if (this.queryParams != null) {
			return this.queryParams;
		}
		return null;
	}

	private URL getEncodedURL(String url) throws MalformedURLException,
			UnsupportedEncodingException {
		URL aURL = new URL(url);
		String query = aURL.getQuery();
		String restUrl = url.replace(query, "");
		this.queryParams = splitQuery(query);
		//System.out.println(this.queryParams);
		return constructURL(restUrl, this.queryParams);
	}

	private URL getEncodedURL(String url, Map<String, String> params) throws MalformedURLException,
			UnsupportedEncodingException {
		URL aURL = new URL(url);
		String query = aURL.getQuery();
		String restUrl = url.replace(query, "");
		return constructURL(restUrl, params);
	}

	private URL constructURL(String url, Map<String, String> params) throws MalformedURLException {
		StringBuffer sb = new StringBuffer();
		sb.append(url);
		for (String key : params.keySet()) {
			sb.append("&" + key + "=" + params.get(key));
		}
		return new URL(sb.toString());
	}

	private Map<String, String> splitQuery(String query)
			throws UnsupportedEncodingException {
		final Map<String, String> query_pairs = new HashMap<String, String>();
		final String[] pairs = query.split("&");
		for (String pair : pairs) {
			final int idx = pair.indexOf("=");
			final String key = idx > 0 ? URLDecoder.decode(
					pair.substring(0, idx), "UTF-8") : pair;
			final String value = idx > 0 && pair.length() > idx + 1 ? URLDecoder
					.decode(pair.substring(idx + 1), "UTF-8") : null;
			query_pairs.put(key, URLEncoder.encode(value, "UTF-8"));
		}
		return query_pairs;
	}

	private Map<String, ArrayList<String>> splitQueryMultiple(String query)
			throws UnsupportedEncodingException {
		final Map<String, ArrayList<String>> query_pairs = new HashMap<String, ArrayList<String>>();
		final String[] pairs = query.split("&");
		for (String pair : pairs) {
			final int idx = pair.indexOf("=");
			final String key = idx > 0 ? URLDecoder.decode(
					pair.substring(0, idx), "UTF-8") : pair;
			if (!query_pairs.containsKey(key)) {
				query_pairs.put(key, new ArrayList<String>());
			}
			final String value = idx > 0 && pair.length() > idx + 1 ? URLDecoder
					.decode(pair.substring(idx + 1), "UTF-8") : null;
			query_pairs.get(key).add(URLEncoder.encode(value, "UTF-8"));
		}
		return query_pairs;
	}

}

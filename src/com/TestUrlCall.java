package com;


public class TestUrlCall {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String url = "https://api.cityofnewyork.us/geoclient/v1/address.json?houseNumber=346&street=Broadway&zip=10013&app_id=7a4e791c&app_key=2015DigitalIntern";
		System.out.println(returnTemp(url));
	}
	
	public static String returnTemp(){
		String url = "https://api.cityofnewyork.us/geoclient/v1/address.json?houseNumber=314&street=west 100 st&borough=manhattan&app_id=7a4e791c&app_key=2015DigitalIntern";
		UrlCall call = new UrlCall(url);
		return call.getUrlResult();
	}
	public static String returnTemp(String url){
		UrlCall call = new UrlCall(url);
		return call.getUrlResult();
	}
}

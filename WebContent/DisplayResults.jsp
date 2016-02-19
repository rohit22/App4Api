<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page import="java.io.*,java.util.*"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/JFCore.js"></script>
<title>Reading Checkbox Data</title>
</head>
<body>
<div class="wrap">
		<!-- tab style-1 -->
		<div class="row">
			<div class="grid_12 columns">
	<%
		String url = session.getAttribute("url").toString();
		
		@SuppressWarnings("unchecked")
		HashMap<String, String> input = (HashMap<String, String>)session.getAttribute("input");
		
		for(String key : input.keySet()){
			out.print(key+"<-->"+input.get(key)+"<br>");
		}
		
		@SuppressWarnings("unchecked")
		HashMap<String, String> output = (HashMap<String, String>)session.getAttribute("output");
		
		out.print(output.keySet()+"<br>");
		out.print(output.values()+"<br>");
		
		for(String key : output.keySet()){
			out.print(key+"<-->"+output.get(key)+"<br>");
		}
		
	/*	Enumeration<String> paramNames = request.getParameterNames();
		HashMap<String, String> keyValues = new HashMap<String, String>();
		while(paramNames.hasMoreElements()) {
			String paramName = (String)paramNames.nextElement();
			out.print("<b>" + paramName + ":</b>\n");
			String paramValue = request.getParameter(paramName);
			out.println(URLDecoder.decode(paramValue,"UTF-8")+"<>"+paramValue.length()+"<p>\n");
			keyValues.put(paramName, paramValue);
		}*/
		
		/*	String name = keyValues.get("fileName");
			String path = "C:\\Users\\Admin\\Documents\\DigitalIntern2015\\workspace\\Test\\tmp\\";
			String fileName = path +name+".xml";
			CreateXML cx = new CreateXML(fileName);
			
			BufferedWriter bw = new BufferedWriter(new FileWriter(new File(fileName)));
			for (String key: keyValues.keySet()){
		bw.write(key);
			}
			bw.flush();
			bw.close();*/
	%>
</div>
</div>
</div>

</body>
</html>
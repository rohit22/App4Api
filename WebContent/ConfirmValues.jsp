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
</head>
<body>
	<div class="wrap">
		<!-- tab style-1 -->
		<div class="row">
			<div class="grid_12 columns">
				<div align="left">
				<%
					String url = session.getAttribute("url").toString();
				%>
					"Sample URL : "<%=url %>
					
					
					<br> <br> <br>
					<%
								//	out.print("Sample input-><br>");
									
									@SuppressWarnings("unchecked")
									HashMap<String, String> input = (HashMap<String, String>)session.getAttribute("input");
									
									//for(String key : input.keySet()){
									//	out.print(key+"<-->"+input.get(key)+"<br>");
									//}
									%>
									"Selected output fields : "
									<%
									Enumeration<String> paramNames = request.getParameterNames();
									HashMap<String, String> keyValues = new HashMap<String, String>();
									StringBuffer sb = new StringBuffer();
									while(paramNames.hasMoreElements()) {
										String paramName = (String)paramNames.nextElement();
										System.out.println(request.getParameter(paramName));
										String paramValue = URLDecoder.decode(request.getParameter(paramName),"UTF-8");
										keyValues.put(paramName, paramValue);
										paramName = paramName.replaceAll("([A-Z])", " $1").replace(Character.toString(paramName.charAt(0)), Character.toString(paramName.charAt(0)).toUpperCase());
										sb.append(paramName+", ");
									
								//		out.println(URLDecoder.decode(paramValue,"UTF-8")+"<>"+paramValue.length()+"<p>\n");
										
									}
									String fields = sb.toString().replaceAll(",[ ]$", "."); 
									%>
									<b><%= fields %></b>
									<%
									session.setAttribute("output", keyValues);
								
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
					<div class="form">
					<form action="DisplayResults.jsp" method="POST">
						<input type="submit" value="Confirm" />
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
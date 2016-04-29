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
					"Sample URL : "<%=url%>


					<br> <br> <br>
					<%
						//	out.print("Sample input-><br>");
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
				//		out.println(URLDecoder.decode(paramValue,"UTF-8")+"<>"+paramValue.length()+"<p>\n");
					}
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
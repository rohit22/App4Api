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
					<br> <br> <br>
					<%
						String url = session.getAttribute("url").toString();
						String email = session.getAttribute("email").toString();
						Enumeration<String> paramNames = request.getParameterNames();
						HashMap<String, String> keyValues = new HashMap<String, String>();
						StringBuffer sb = new StringBuffer();
						int inputKeys = 0;
						int outputKeys = 0;
						while(paramNames.hasMoreElements()) {
							String paramName = (String)paramNames.nextElement();
							System.out.println(request.getParameter(paramName));
							String paramValue = URLDecoder.decode(request.getParameter(paramName),"UTF-8");
							keyValues.put(paramName, paramValue);
							sb.append(paramName+", ");
							if (paramName.contains("input_")){
								inputKeys++;
							}
							if (paramName.contains("output_")){
								outputKeys++;
							}
						}
						String fields = sb.toString().replaceAll(",[ ]$", "."); 
						fields=fields.replace("input_","");
						fields=fields.replace("output_","");
					%>	
					<%="Given URL: "+url%>
					<br><br>
					<%="Given E-MAIL ID: "+email%>
					<br><br>
					<%="Selected Fields: "+ fields%>
					<br><br>
					<%
					session.setAttribute("output", keyValues);
					if (inputKeys!=0 && outputKeys!=0){ %>			
					<div class="form">
						<form action="UserInput.jsp" method="POST">
							<input type="submit" value="Confirm" />
						</form>
					</div>
					<%} else{%>
					<div class="form">
						Please select at least 1 input and 1 output fields. 
						<a href="javascript:history.back()"><input type="submit" value="Back" /></a>
					</div>
					<%}%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
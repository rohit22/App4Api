<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page import="java.io.*,java.util.*"%>
<!-- A file that is used to display the user selection for confirmation. -->
<html>
<head>
<title>Confirm Selection</title>
<!--  
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<script type="text/javascript" src="js/JFCore.js"></script>
-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/style.css" />

</head>

<body>
<div class="topcorner"><a href="index.html"><img src="images/home.png" alt="Home" border=0></a></div>
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
							//System.out.println(request.getParameter(paramName));
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
					<b>URL: </b> <%=url%>
					<br><br>
					<b>E-mail ID: </b><%=email%>
					<br><br>
					<b>Selected Fields: </b><%=fields%>
					<br><br>
					<%
					session.setAttribute("output", keyValues);
					if (inputKeys!=0 && outputKeys!=0){ %>	
					<div class="check">
						<a href="UserInput.jsp">Confirm</a>
						<a href="javascript:history.back()">Back</a>
					</div>	
					<%} else{%>
					<div class="check">
						<a href="javascript:history.back()">Back</a>
					</div>	
					<%}%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
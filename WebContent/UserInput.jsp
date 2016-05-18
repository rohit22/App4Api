<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page import="java.io.*,java.util.*"%>
<!-- This file has a form in which the user enters the column numbers from the input file the user uploads.
The fields of the form are from the previous page. -->
<html>
<head>
<!--  
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<script type="text/javascript" src="js/JFCore.js"></script>
-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/style.css" />

<script type="text/javascript"> 
 function showHide() {
   var div = document.getElementById("hidden_div");
   if (div.style.display == 'none') {
     div.style.display = '';
   }
   else {
     div.style.display = 'none';
   }
 }
</script>

<title>User Input</title>
</head>
<body>
<div class="topcorner"><a href="index.html"><img src="images/home.png" alt="Home" border=0></a></div>
	<div class="wrap">
		<!-- tab style-1 -->
		<div class="row">
			<div class="grid_12 columns">
				<%
					String url = session.getAttribute("url").toString();
					if (url.endsWith("/")) {
						url = url.substring(0, url.length() - 1);
					}
					String email = session.getAttribute("email").toString();
					
					@SuppressWarnings("unchecked")
					HashMap<String, String> output = (HashMap<String, String>) session
							.getAttribute("output");
					StringBuffer sb = new StringBuffer();
					StringBuffer sbIn = new StringBuffer();
					ArrayList<String> inputKeys = new ArrayList<>();
					for (String key : output.keySet()) {
						if (key.contains("output_")) {
							key = key.replace("output_", "");
							sb.append(key + ",");
						}
						if (key.contains("input_")) {
							key = key.replace("input_", "");
							inputKeys.add(key);
							sbIn.append(key + ",");
						}
					}
					String keys = sb.toString();
				%>

				<div class="form">
					<form id="form1" method="post" action="uploadFile"
						enctype="multipart/form-data" onsubmit="showHide(); return true;">

						<input type="hidden" name="type" value="General" /> <input
							type="hidden" name="url" value=<%=url%> /> <input type="hidden"
							name="keys" value=<%=keys%> /> <input type="hidden"
							name="inputKeys" value=<%=sbIn.toString()%> /> <input
							type="hidden" name="email" value=<%=email%> />
						<%
							int check = 0;
							for (String key : inputKeys) {
								String label = key;
						%>
						<input type="text" class="active textbox" name=<%=label%>
							placeholder=<%=label + " (Column Number)"%>
							onfocus="this.value = '';"
							onblur="if (this.placeholder == '') {this.placeholder = '<%=label + " (Column Number)"%>';}"
							required>
						<%
							}
						%>
						<input type="radio" class="active textbox" name="sendEmail"
							value="email" required> Email <input type="radio"
							class="active textbox" name="sendEmail" value="download" required>Download
						<br> <input type="file" name="uploadFile" required /> <input
							type="submit" value="upload" />

					</form>
				</div>
				<div id="hidden_div" style="display: none">
					<p>Work on progress... Please don't refresh. Output is being generated</p>
				</div>
				
			</div>
		</div>
	</div>

	
</body>
</html>
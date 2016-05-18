<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
   <!-- Simple file to display the message if the user has asked us to email the results instead of downloading. -->
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
<div class="topcorner"><a href="index.html"><img src="images/home.png" alt="Home" border=0></a></div>
<div class="bottomcorner">
		<a href="mailto:rbg2134@columbia.edu?Subject=[Reg]%20Website"><img src="images/Contacts.png" alt="Contact"
			border=0></a>
	</div>
	<div class="wrap">
		<!-- tab style-1 -->
		<div class="row">
		<a href="index.html"> Home </a><br><br>
			<div class="grid_12 columns">
				<div class="tab.style-1">
					<dl>
						<%
							out.print("<b>" + "Email will be sent to email-id: "
									+ request.getAttribute("email") + "</b>");
						%>
					</dl>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
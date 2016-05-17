<%@page import="java.net.URLEncoder"%>
<%@page import="com.JsonHolder"%>
<%@page import="com.api.utils.JsonParseRecursive"%>
<%@page import="java.io.*,java.util.*"%>
<%@page import="com.UrlCall"%>
<!DOCTYPE HTML>
<html>
<head>
<title>New Main</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/JFCore.js"></script>

<!-- Set here the key for your domain in order to hide the watermark on the web server -->
<script type="text/javascript">
	(function() {
		JC.init({
			domainKey : ''
		});
	})();
</script>
</head>
<body>
	<div align="center">
		<!-- tab style-1 -->
		
			<div class="grid_12 columns">

				
				<%
					String email = request.getParameter("email");
					String url = request.getParameter("url");
					session.setAttribute("url", url);
					session.setAttribute("email", email);
					UrlCall call = new UrlCall(url);
					String json= call.getUrlResult();
					JsonHolder holder = new JsonHolder(json);
					Map<String, Object> keyValues = holder.getKeyValues();
					ArrayList<String> keys = new ArrayList<String>();
					for(String key : keyValues.keySet()){
						keys.add(key);
					}
					Collections.sort(keys);
					Map<String, String> inputValues = call.getInputKeysValues();
					session.setAttribute("input", inputValues);
					ArrayList<String> inputKeys = new ArrayList<>();
					inputKeys.addAll(inputValues.keySet());
					String iKeyTotal;
					System.out.println(json);
				%>
				<div class="form">
				<div class="squaredFour">
					<form action="ConfirmSelection.jsp" method="POST">
						Please select the input fields <br><br>
						<table align="center">
						
							<tr>
								<%
									int check= 0;
									for(String key : inputKeys) {
										String label = key;
										
										check++;
										
								%>
								<td align="left">
									<input type="checkbox" id=<%=key%> name=<%="input_"+label%> value=<%=inputValues.get(key)%>>
									<label for=<%=key.replaceAll("([A-Z])", " $1")%>> <span></span>
									<%=key.replaceAll("([A-Z])", " $1").replace(Character.toString(key.charAt(0)), Character.toString(key.charAt(0)).toUpperCase())%>
									</label>
									
								</td>
								<%
									if (check==3){
										check=0;
								%>
							</tr>
							<tr>
								<%
									}
								}
								%>
							</tr>
						</table>
						<br><br>
						Please select the output fields <br><br>
						<table align="center">
						
							<tr>
								<%
									check= 0;
									for(String key : keys) {
										String label = key;
										
										check++;
										
								%>
								<td align="left">
									<input type="checkbox" id=<%=key%> name=<%="output_"+label%> value=<%=keyValues.get(key)%>>
									<label for=<%=key.replaceAll("([A-Z])", " $1")%>> <span></span>
									<%=key.replaceAll("([A-Z])", " $1").replace(Character.toString(key.charAt(0)), Character.toString(key.charAt(0)).toUpperCase())%>
									</label>
									
								</td>
								<%
									if (check==3){
										check=0;
								%>
							</tr>
							<tr>
								<%
									}
								}
								%>
							</tr>
						</table>
						<br> <br> 
						<input type="submit" value="Select Fields" />
					</form>
				</div>
				</div>
			</div>
			</div>


	
</body>
</html>
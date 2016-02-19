<%@page import="java.net.URLEncoder"%>
<%@page import="com.JsonHolder"%>
<%@page import="com.api.utils.JsonParseRecursive"%>
<%@page import="java.io.*,java.util.*"%>
<%@page import="com.UrlCall"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Selecting the output fields and input values</title>
</head>
<body>
	<br>
	<br>
	<center> Please select the output values </center>
	<br>
	<br>
	<%

		String name = request.getParameter("name");
		String url = request.getParameter("url");
		session.setAttribute("url", url);
		
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
		
		String iKeyTotal;
		System.out.println(json);
		
	%>
	<center>
	<form action="ConfirmValues.jsp" method="POST" target="_blank">
		<table>
			<tr>
				<%
					int check= 0;
					for(String key : keys) {
						check++;
										%>
				<td><input type="checkbox" name=<%=key%>
					value=<%=keyValues.get(key)%>> <%=key%></td>
					<label for=<%=key.replaceAll("([A-Z])", " $1")%>>
									<%=key.replaceAll("([A-Z])", " $1").replace(Character.toString(key.charAt(0)), Character.toString(key.charAt(0)).toUpperCase())%>
									</label>
				<%
					if (check==4){
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
		<input type="submit" value="Select Output Fields" />
	</form>
	</center>



</body>
</html>
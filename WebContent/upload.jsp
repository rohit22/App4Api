<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Upload Demo</title>
</head>
<body>
	<center>
		<form method="post" action="uploadFile" enctype="multipart/form-data">

			<input type="radio" name="type" value="InternetArchive" />Internet
			Archive <input type="radio" name="type" value="HumanResource" />Human
			Resource<br>
			<p></p>

			<table border="0">
			<tr><td width="100"></td></tr>
				<tr>
					<td>TimeStamp</td>
					<td><input type="text" name="timeStamp" value="2008" required>
						<br /></td>
				</tr>
				<tr>
					<td>RowId</td>
					<td><input type="text" name="rowId" required /> (Column
						Number) <br /></td>
				</tr>
				<tr>
					<td>Journal</td>
					<td><input type="text" name="journal" required /> (Column
						Number) <br /></td>
				</tr>
				<tr>
					<td>Article </td>
					<td><input type="text" name="article" required /> (Column
						Number) <br /></td>
				</tr>
				<tr>
					<td>Citations</td>
					<td><input type="text" name="citations" required /> (Column
						Number) <br /></td>
				</tr>
				<tr>
					<td>URL</td>
					<td><input type="text" name="url" required /> (Column Number)
						<br /></td>
				</tr>

			</table>
			<br>
			<p></p>
			Select file to upload: <input type="file" name="uploadFile" /> <br />
			<br /> <input type="submit" value="Upload" />
		</form>
	</center>
</body>
</html>
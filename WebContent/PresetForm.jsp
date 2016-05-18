<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!-- This contains 3 tabbed forms for the preset APIs. The input fields are taken from the existing 
and most used fields and the information is given by DSSC.  -->
<html>
<head>
<title>Preset APIs</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- 
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
-->	

<link rel="stylesheet" href="css/style.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/JFCore.js"></script>

<!-- 
<script type="text/javascript">
	(function() {
		JC.init({
			domainKey : ''
		});
	})();
</script>
 -->
</head>
<body>
	<div class="topcorner">
		<a href="index.html"><img src="images/home.png" alt="Home"
			border=0></a>
	</div>
	<div class="wrap">

		<!-- tab style-1 -->
		<div class="row">
			<div class="grid_12 columns">
				<div class="tab style-1">
					<dl>
						<dd>
							<a class="user active" href="#GeoCode"> Geocode </a>
						</dd>
						<dd>
							<a class="user" href="#HR"> HumanResource</a>
						</dd>
						<dd>
							<a class="user" href="#IA"> InternetArchive </a>
						</dd>
					</dl>
					<ul>

						<li class="active">
							<div class="form">
								<form id="check" name="check" method="post" action="uploadFile"
									enctype="multipart/form-data">
									<input type="hidden" name="type" value="GeoCode" /> <input
										type="text" class="active textbox" name="street"
										placeholder="Street (Column Number)"
										onfocus="this.value = '';"
										onblur="if (this.placeholder == '') {this.placeholder = 'Street (Column Number)';}"
										required> <input type="text" class="active textbox"
										name="inStreet"
										placeholder="Intersection Street (Column Number, -1 if absent)"
										onfocus="this.value = '';"
										onblur="if (this.placeholder == '') {this.placeholder = 'Intersection Street (Column Number, -1 if absent)';}"
										required> <input type="text" class="active textbox"
										name="crStreet"
										placeholder="Cross Section Street (Column Number, -1 if absent)"
										onfocus="this.value = '';"
										onblur="if (this.placeholder == '') {this.placeholder = 'Cross Section Street (Column Number, -1 if absent)';}"
										required> <input type="text" class="active textbox"
										name="borough"
										placeholder="Borough (Column Number, -1 if absent)"
										onfocus="this.value = '';"
										onblur="if (this.placeholder == '') {this.placeholder = 'borough (Column Number, -1 if absent)';}"
										required> <input type="text" class="active textbox"
										name="houseNum" placeholder="House Number (Column Number)"
										onfocus="this.value = '';"
										onblur="if (this.placeholder == '') {this.placeholder = 'House Number (Column Number)';}"
										required> <input type="text" class="active textbox"
										name="email" placeholder="Email" onfocus="this.value = '';"
										onblur="if (this.placeholder == '') {this.placeholder = '';}"
										required> <input type="radio" class="active textbox"
										name="sendEmail" value="email" required> Email <input
										type="radio" class="active textbox" name="sendEmail"
										value="download" required> Download <br> <input
										type="file" name="uploadFile" /> <input type="submit"
										value="upload">
								</form>
							</div>
						<li>
							<div class="form">
								<form method="post" action="uploadFile"
									enctype="multipart/form-data">
									<input type="hidden" name="type" value="HumanResource" /> <input
										type="text" class="active textbox" name="timeStamp"
										placeholder="Time Stamp (defalt: 2008)"
										onfocus="this.value = '';"
										onblur="if (this.placeholder == '') {this.placeholder = 'Time Stamp (defalt: 2008)';}"
										required> <input type="text" class="active textbox"
										name="url" placeholder="URL (Column Number)"
										onfocus="this.value = '';"
										onblur="if (this.placeholder == '') {this.placeholder = 'URL (Column Number)';}"
										required> <input type="text" class="active textbox"
										name="email" placeholder="Email" onfocus="this.value = '';"
										onblur="if (this.placeholder == '') {this.placeholder = '';}"
										required> <input type="radio" class="active textbox"
										name="sendEmail" value="email" required> Email <input
										type="radio" class="active textbox" name="sendEmail"
										value="download" required> Download <br> <input
										type="file" name="uploadFile" /> <input type="submit"
										value="upload">
								</form>
							</div>
						</li>
						<li>
							<div class="form">
								<form method="post" action="uploadFile"
									enctype="multipart/form-data">
									<input type="hidden" name="type" value="InternetArchive" /> <input
										type="text" class="active textbox" name="timeStamp"
										placeholder="Time Stamp (defalt: 2008)"
										onfocus="this.value = '';"
										onblur="if (this.placeholder == '') {this.placeholder = 'Time Stamp (defalt: 2008)';}"
										required> <input type="text" class="active textbox"
										name="url" placeholder="URL (Column Number)"
										onfocus="this.value = '';"
										onblur="if (this.placeholder == '') {this.placeholder = 'URL (Column Number)';}"
										required> <input type="text" class="active textbox"
										name="email" placeholder="Email" onfocus="this.value = '';"
										onblur="if (this.placeholder == '') {this.placeholder = '';}"
										required> <input type="radio" class="active textbox"
										name="sendEmail" value="email" required> Email <input
										type="radio" class="active textbox" name="sendEmail"
										value="download" required> Download <br> <input
										type="file" name="uploadFile" /> <input type="submit"
										value="upload">
								</form>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="wrap">
		<!--footer-->
		<div class="footer"><p>Template Inspired by <a href="#single.html">w3layouts</a></p></div>
		<div class="clear"></div>
	</div>
	<script type="text/javascript">
		aff_div("ssconj");
	</script>
</body>
</html>
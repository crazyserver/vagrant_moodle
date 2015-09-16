<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Vagrant</title>
	<style type="text/css">
		body {  font-family: sans-serif;}
		fieldset { border:1px solid #ddd; width:45%; float:left; margin:10px;
                   border-radius: 4px; }
		legend { color:#888; font-weight:bold; padding-left:5px; padding-right:5px; }
		a { text-decoration:none; }
		h2 { text-align:center; color:#888; }
		img {vertical-align: middle;}
	</style>
</head>

<body>
	<fieldset>
		<a href="/moodle/">Moodle</a>
	</fieldset>

	<fieldset>
		<legend> Manage </legend>
		<a href="<?php print "http://".$_SERVER["SERVER_NAME"].":8080/apex"?>">[Oracle admin]</a>
		<a href="/phpmyadmin/">[MySQL admin]</a>
		<a href="/opcache.php">[OpCache]</a>
		<a href="/phpinfo.php">[PHPInfo]</a>
	</fieldset>

</body>
</html>

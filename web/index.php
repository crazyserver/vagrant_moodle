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
		<legend> Apps </legend>
		<a href="http://moodle.test/moodle/">Moodle</a><br>
		<a href="http://moodle.test:8100">Moodle Mobile 2</a>
	</fieldset>

	<fieldset>
		<legend> Manage </legend>
		<a href="/phpmyadmin/">[MySQL admin]</a><br>
		<a href="/phppgadmin/">[PostgreSQL admin]</a><br>
		<a href="<?php print "http://".$_SERVER["SERVER_NAME"].":8080/apex/f?p=4950"?>">[Oracle admin]</a><br>
		<a href="/opcache.php">[OpCache]</a><br>
		<a href="/phpinfo.php">[PHPInfo]</a><br>
	</fieldset>

</body>
</html>

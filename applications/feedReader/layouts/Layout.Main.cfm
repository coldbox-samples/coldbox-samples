<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head profile="http://a9.com/-/spec/opensearch/1.1/">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>ColdBox Feed Reader</title>
	<link rel="shortcut icon" href="includes/images/favicon.ico" type="image/vnd.microsoft.icon"/>
	<link rel="icon" href="includes/images/favicon.ico" type="image/vnd.microsoft.icon"/> 
	<link href="includes/styles/Layout.Main.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="10">
		<tr style="border-bottom:1px solid #eaeaea">
			<td bgcolor="#0066CC"><h1>ColdBox Feed Reader</h1><cfoutput>#renderView('menu')#</cfoutput></td>
		</tr>
	</table>
	<br/>
	<!--- Render the View Here --->
	<cfoutput>#renderView()#</cfoutput>
	<p>&nbsp;</p>
	<p align="center">
		<a href="http://www.luismajano.com/projects/coldbox"><img src="../../includes/images/poweredby.png" border="0"></a>
	</p>
</body>
</html>
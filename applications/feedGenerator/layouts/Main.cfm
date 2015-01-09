<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head profile="http://a9.com/-/spec/opensearch/1.1/">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>ColdBox Feed Generator</title>
	<link rel="shortcut icon" href="includes/images/favicon.ico" type="image/vnd.microsoft.icon"/>
	<link rel="icon" href="includes/images/favicon.ico" type="image/vnd.microsoft.icon"/> 
	<link href="includes/styles/Layout.Main.css" rel="stylesheet" type="text/css"/>
	<!------------- Autodiscovery HTML code using HTML Link tags -------------->
	<cfoutput>
	<link rel="alternate" type="application/rss+xml" title="Beginner feed" href="#event.buildLink('ehGeneral.displayFeedBeginner')#"/>
	<link rel="alternate" type="application/rss+xml" title="RSS Playground" href="#event.buildLink('ehGeneral.displayFeedPlayground')#"/>
	<link rel="alternate" type="application/rss+xml" title="Simple Art" href="#event.buildLink('ehGeneral.displayFeedSimpleArt')#"/>
	<link rel="alternate" type="application/rss+xml" title="Complete Art" href="#event.buildLink('ehGeneral.displayFeedCompleteArt')#"/>
	<link rel="alternate" type="application/rss+xml" title="iTunes" href="#event.buildLink('ehGeneral.displayFeediTunes')#"/>
	<link rel="alternate" type="application/rss+xml" title="OpenSearch" href="#event.buildLink('ehGeneral.displayFeedOpenSearch')#"/>
	<link rel="alternate" type="application/rss+xml" title="Dublin Core" href="#event.buildLink('ehGeneral.displayFeedDublinCore')#"/>
	<link rel="alternate" type="application/rss+xml" title="Slash" href="#event.buildLink('ehGeneral.displayFeedSlash')#"/>
	<link rel="alternate" type="application/rss+xml" title="Combination extensions" href="#event.buildLink('ehGeneral.displayFeedComboEx')#"/>
	<link rel="alternate" type="application/rss+xml" title="Internationalization" href="#event.buildLink('ehGeneral.displayFeedInternational')#"/>
	<link rel="alternate" type="application/rss+xml" title="Bandwidth saver" href="#event.buildLink('ehGeneral.displayFeedBandwidth')#"/>  
	</cfoutput>
	<!------------------------------------------------------------------------->
</head>

<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="10">
		<tr style="border-bottom:1px solid #eaeaea">
			<td bgcolor="#0066CC"><h1>ColdBox Feed Generator</h1></td>
		</tr>
	</table>
	<br/>
	<!--- Render the View Here --->
	<cfoutput>#renderView()#</cfoutput>
	<p>&nbsp;</p>
	<p align="center">
	<a href="http://www.coldbox.org"><img src="../../includes/images/poweredby.png" border="0"></a>
	</p>
</body>
</html>

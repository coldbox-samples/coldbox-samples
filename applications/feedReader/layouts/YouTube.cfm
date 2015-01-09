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
	<!--- YouTube Search Box --->
	<form id="youtubesearch" name="youtubesearch" method="post" action="<cfoutput>#event.buildLink('youtube.search')#</cfoutput>">
	<fieldset>
		<legend>YouTube</legend>
		<label>Search
			<input type="text" name="search_query" id="search_query" value="<cfoutput>#rc.search_query#</cfoutput>" />
		</label>
		<label>
			<select name="max_results" id="max_results">
				<option value="5"<cfif rc.max_results is 5> selected="selected"</cfif>>5</option>
				<option value="10"<cfif rc.max_results is 10> selected="selected"</cfif>>10</option>
				<option value="25"<cfif rc.max_results is 25> selected="selected"</cfif>>25</option>
			</select>
		</label>
		<label>
			<input type="submit" name="submit" id="submit" value="Submit" />
		</label>
	</fieldset>
	<div style="text-align:center;">
	<cfif rc.start_index gt rc.max_results>
	<label><input type="submit" name="submit" id="submit" value="Previous" /></label>
	</cfif>
	<cfif rc.start_index lt (rc.total_results-rc.max_results)>
	<label><input type="submit" name="submit" id="submit" value="Next" /></label>
	</cfif>
	</div>
	<input type="hidden" name="start_index" id="start_index" value="<cfoutput>#rc.start_index#</cfoutput>" />
	</form>
	<br />
	<!--- Render the View Here --->
	<cfoutput>#renderView()#</cfoutput>
	<p>&nbsp;</p>
	<p align="center">
		<a href="http://www.coldbox.org"><img src="../../includes/images/poweredby.png" border="0"></a>
	</p>
</body>
</html>

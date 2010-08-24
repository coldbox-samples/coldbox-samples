<div class="framing">
	<cfif len(rc.compileFeed)>
	<!--- If the Request Collection compileFeed variable is true display this message --->
	<h2>Congratulations the feed was successfully updated</h2>
	<cfelse>
	<!--- Otherwise display this message --->
	<h2>There was a problem updating the feed</h2>
	Maybe there is an issue with the database or its datasource?
	</cfif>
</div>
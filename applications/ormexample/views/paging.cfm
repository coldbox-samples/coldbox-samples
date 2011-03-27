<h3>Paging</h3>
<p>Find all authors whose firstName starts with a letter "M" or greater. Implement paging with no more than 3 records per page. The total found count is obtained by passing the same criteria to the criteriaCount method.</p>
<p>code:</p>
<p>
	<code>
	<pre>
	event.paramValue("page",1);
	prc.boundaries = getMyPlugin("Paging").getBoundaries();
		
	var criteria = ArrayNew(1);
	ArrayAppend(criteria, Restrictions.ge("firstName","M"));
	
	prc.example1 = authorService.criteriaQuery(
		criteria=criteria, 
		offset=(prc.boundaries.STARTROW-1), 
		max=getSetting("PagingMaxRows"), 
		sortOrder="firstName ASC");
	prc.foundcount = authorService.criteriaCount(criteria=criteria);
	</pre>
	</code>
</p>
<p>results:</p>
<p><cfdump var="#prc.example1#"></p>
<cfoutput>#getMyPlugin("Paging").renderit(foundrows=prc.foundcount,link=event.buildLink(linkto="general.paging", queryString="page=@page@"))#</cfoutput>

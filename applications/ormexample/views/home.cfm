<cfoutput>
<h3>Intro</h3>
<p>In order to do complex queries using the full range of functions such as AND, OR, LIKE or IN, we looked towards the hibernate <i>criteriaQuery</i> and the <i>org.hibernate.criterion.Restrictions</i> class.</p>
<p>These classes make it easy to build an array of restrictions for our criteria. Once built, we can also pass the same array of restrictions to a count method to obtain the full count of records that would be returned even when paging is being used. This is done though the use of the Hibernate <i>org.hibernate.criterion.Projections</i> class.</p>
<p>Finally, the <i>coldbox.system.orm.hibernate.criterion.Restrictions</i> was created in the model as a wrapper for the native Hibernate <i>org.hibernate.criterion.Restrictions</i> class. This simplifies the creation of the criteria as can be seen in the examples.</p>
<p>The examples all use the default cfbookclub datasource defined in the CF Administrator.</p>
<h3>BaseORMService & VirtualEntityService</h3>
<p>The following two methods make usage of the hibernate criteria queries. If you are
using the VirtualEntityService you do not need to pass in the entity name</p>
<p>
	<code>
	<pre>
	public any function criteriaQuery(
	    any entityName,
		array criteria=ArrayNew(1),
		string sortOrder="",
		numeric offset=0,
		numeric max=0,
		numeric timeout=0,
		boolean ignoreCase=false,
		boolean asQuery=true) output="false" {
		...
		...				 
	}
	
	public numeric function criteriaCount(any entityName, array criteria=ArrayNew(1)) output="false" {
		...
		...
	}
	</pre>
	</code>
</p>
<p>The <i>criteriaQuery</i> function supports the same arguments and functionality as the <i>list</i> function of the base class. The only difference is the criteria argument is an array of Restriction objects. The <i>criteriaCount</i> function accepts the same array of Restrictions and returns the actual record count that would be returned if paging was not used. This is done through the use of the Hibernate Projections class.</p>
</cfoutput>
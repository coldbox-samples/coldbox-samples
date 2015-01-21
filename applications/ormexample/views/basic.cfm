<h3>Dependencies</h3>
<p>The following dependency is injected into the handler for these samples.</p>
<p>
 <code>
 <pre>
 property name="authorService" inject="entityService:Author";
 </pre>
 </code>
</p>

<h3>eq</h3>
<p>Find all authors whose firstName is "Michael".</p>
<p>code:</p>
<p>
 <code>
 <pre>
 var c = authorService.newCriteria();
 prc.example1 = c.eq( "firstName", "Michael" )
	.list( asQuery=true );
 </pre>
 </code>
</p>
<p>results:</p>
<p><cfdump var="#prc.example1#"></p>

<h3>ne</h3>
<p>Find all authors whose firstName is not "Michael".</p>
<p>code:</p>
<p>
 <code>
 <pre>
 var c = authorService.newCriteria();
 prc.example2 = c.ne( "firstName", "Michael" )
	.list( asQuery=true );
 </pre>
 </code>
</p>
<p>results:</p>
<p><cfdump var="#prc.example2#"></p>

<h3>in</h3>
<p>Find all authors whose firstName is either "Ian", "Emily" or "Paul". This is done simply by passing an array of values to the IN restriction.</p>
<p>code:</p>
<p>
 <code>
 <pre>
 var c = authorService.newCriteria();
 prc.example3a = c.in( "firstName", ["Ian","Emily","Paul"] )
	.list( asQuery=true );
 </pre> 
 </code>
</p>
<p>results:</p>
<p><cfdump var="#prc.example3a#"></p>

<p>Find all authors whose ID is either 2, 5, 9. This is done simply by passing an array of values to the IN restriction. Integers need to be cast to an java.lang.Integer[].</p>
<p>code:</p>
<p>
 <code>
 <pre>
 var c = authorService.newCriteria();
 prc.example3b = c.in( "id", JavaCast("java.lang.Integer[]",[2,5,9]) )
	.list( asQuery=true );
 </pre> 
 </code>
</p>
<p>results:</p>
<p><cfdump var="#prc.example3b#"></p>

<h3>like</h3>
<p>A <strong>case-sensitive</strong> like search. Find all authors whose lastName begins with the letter "M".</p>
<p>code:</p>
<p>
 <code>
 <pre>
 var c = authorService.newCriteria();
 prc.example4 = c.like("lastName","M%")
	.list( asQuery=true );
 </pre> 
 </code>
</p>
<p>results:</p>
<p><cfdump var="#prc.example4#"></p>

<h3>ilike</h3>
<p>A <strong>case-insensitive</strong> like search. Find all authors whose lastName begins with the letter "s".</p>
<p>code:</p>
<p>
 <code>
 <pre>
 var c = authorService.newCriteria();
 prc.example5 = c.ilike("lastName","s%")
	.list( asQuery=true );
 </pre> 
 </code>
</p>
<p>results:</p>
<p><cfdump var="#prc.example5#"></p>

<h3>isEmpty</h3>
<p>Find all authors whose numbers of books is zero. This methods works on collections only.</p>
<p>code:</p>
<p>
 <code>
 <pre>
 var c = authorService.newCriteria();
 prc.example6 = c.isEmpty("books")
	.list( asQuery=true );
 </pre> 
 </code>
</p>
<p>results:</p>
<p><cfdump var="#prc.example6#"></p>

<h3>isNotEmpty</h3>
<p>Find all authors whose numbers of books is greater than zero. This methods works on collections only.</p>
<p>code:</p>
<p>
 <code>
 <pre>
 var c = authorService.newCriteria();
 prc.example7 = c.isNotEmpty("books")
	.list( asQuery=true );
 </pre> 
 </code>
</p>
<p>results:</p>
<p><cfdump var="#prc.example7#"></p>

<h3>isNull</h3>
<p>Find all authors whose bio is null.</p>
<p>code:</p>
<p>
 <code>
 <pre>
 var c = authorService.newCriteria();
 prc.example8 = c.isNull("bio")
	.list( asQuery=true );
 </pre> 
 </code>
</p>
<p>results:</p>
<p><cfdump var="#prc.example8#"></p>

<h3>isNotNull</h3>
<p>Find all authors whose bio is not null.</p>
<p>code:</p>
<p>
 <code>
 <pre>
 var c = authorService.newCriteria();
 prc.example9 = c.isNotNull("bio")
	.list( asQuery=true );
 </pre> 
 </code>
</p>
<p>results:</p>
<p><cfdump var="#prc.example9#"></p>

<h3>Between</h3>
<p>Find all authors whose lastName is between "A" and "M".</p>
<p>code:</p>
<p>
 <code>
 <pre>
 var c = authorService.newCriteria();
 prc.example10a = c.between( "lastName", "A", "M" )
	.list( asQuery=true );
 </pre> 
 </code>
</p>
<p>results:</p>
<p><cfdump var="#prc.example10a#"></p>

<p>Find all authors whose id is between 3 and 7. JavaCast to criteria value to int</p>
<p>code:</p>
<p>
 <code>
 <pre>
 var c = authorService.newCriteria();
 prc.example10b = c.between( "id", JavaCast( "int", 3 ), JavaCast( "int", 7 ) )
	.list( asQuery=true );
 </pre> 
 </code>
</p>
<p>results:</p>
<p><cfdump var="#prc.example10b#"></p>

<h3>gt</h3>
<p>Find all authors whose id is greater than 8.</p>
<p>code:</p>
<p>
 <code>
 <pre>
 var c = authorService.newCriteria();
 prc.example11 = c.gt( "id", JavaCast( "int", 8 ) )
	.list( asQuery=true );
 </pre> 
 </code>
</p>
<p>results:</p>
<p><cfdump var="#prc.example11#"></p>

<h3>ge</h3>
<p>Find all authors whose id is greater or equal to 13.</p>
<p>code:</p>
<p>
 <code>
 <pre>
 var c = authorService.newCriteria();
 prc.example12 = c.ge( "id", JavaCast( "int", 13 ) )
	.list( asQuery=true );
 </pre> 
 </code>
</p>
<p>results:</p>
<p><cfdump var="#prc.example12#"></p>
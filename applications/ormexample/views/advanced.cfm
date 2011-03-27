<h3>Dependencies</h3>
<p>The following dependencies are injected into the handler for these samples.</p>
<p>
 <code>
 <pre>
 property name="restrictions" inject="model:Restrictions";
 property name="authorService" inject="entityService:Author";
 </pre>
 </code>
</p>

<h3>Example 1</h3>
<p>Find all authors whose firstName is "Emily", "Paul" or "Amy".</p>
<p>code:</p>
<p>
 <code>
 <pre>
 var criteria = ArrayNew(1);
 ArrayAppend(criteria, Restrictions.eq("firstName","Emily"));
 ArrayAppend(criteria, Restrictions.eq("firstName","Paul"));
 ArrayAppend(criteria, Restrictions.eq("firstName","Amy"));
 prc.example1 = authorService.criteriaQuery([Restrictions.disjunction(criteria)]);
 </pre>
 </code>
</p>
<p>results:</p>
<p><cfdump var="#prc.example1#"></p>

<h3>Example 2</h3>
<p>Find all authors whose firstName is "Emily", "Paul" or "Amy" and whose id is greater than 7.</p>
<p>code:</p>
<p>
 <code>
 <pre>
 var disjunction = ArrayNew(1);
 ArrayAppend(disjunction, Restrictions.eq("firstName","Emily"));
 ArrayAppend(disjunction, Restrictions.eq("firstName","Paul"));
 ArrayAppend(disjunction, Restrictions.eq("firstName","Amy"));

 var criteria = ArrayNew(1);
 ArrayAppend(criteria, Restrictions.gt("id",JavaCast("int",7)));
 ArrayAppend(criteria, Restrictions.disjunction(disjunction));
 prc.example2 = authorService.criteriaQuery(criteria);
 </pre>
 </code>
</p>
<p>results:</p>
<p><cfdump var="#prc.example2#"></p>
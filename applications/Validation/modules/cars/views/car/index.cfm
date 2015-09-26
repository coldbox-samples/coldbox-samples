<h3>Cars</h3>

<cfoutput>
	
	#getInstance('MessageBox@cbMessageBox').renderit()#
	
	<table class="zebra-striped">
		<thead>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Sort</th>
				<th>Product Count</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<cfloop array="#rc.cars#" index="car">
			<tr>
				<td>#car.getId()#</td>	
				<td>#car.getName()#</td>	
				<td>#car.getSort()#</td>	
				<td>#arrayLen(car.getProducts())#</td>	
				<td><a href="#event.buildLink('car/edit')#?car_id=#car.getId()#">Edit</a></td>
			</tr>
			</cfloop>
		</tbody>
	</table>
	
	<p align="right"><a href="#event.buildLink('cars/home/edit')#"><button class="btn primary">Add New Car</button></a></p>
	
	<!--- table sorter --->
	<script type="text/javascript">
	$(function() {
		/* 
		 * sortList:
		 * An array of instructions for per-column sorting and direction in the format: [[columnIndex, sortDirection], ... ] 
		 * where columnIndex is a zero-based index for your columns left-to-right and sortDirection is 0 for Ascending and 1 
		 * for Descending. A valid argument that sorts ascending first by column 1 and then column 2 looks like: [[0,0],[1,0]]
		 */
		$(".zebra-striped").tablesorter({ sortList: [[1,0]] });
	});
	</script>


</cfoutput>
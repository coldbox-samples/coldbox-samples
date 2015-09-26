<cfparam name="url.car_id" default="">
	
<h2>Car Editor</h2>

<cfoutput>
	
	#getInstance('MessageBox@cbMessageBox').renderit()#
	
	<form method="post" action="#event.buildLink('cars/home/save')#">
		<input type="hidden" name="car_id" value="#url.car_id#">
		<div class="clearfix">
			<label for="name">Brand</label>
			<div class="input">
				<input class="xlarge" id="name" name="name" size="30" type="text" value="#rc.car.getBrand()#" tabindex="1">
			</div>
		</div>
		<div class="clearfix">
			<label for="sort">Model</label>
			<div class="input">
				<input class="xlarge" id="sort" name="sort" size="30" type="text" value="#rc.car.getModel()#" tabindex="2">
			</div>
		</div>		
		<div class="actions">
			<a href="#event.buildLink('cars/home/list')#"><button type="reset" class="btn" tabindex="4">Cancel</button></a>&nbsp;
			<input type="submit" class="btn primary" value="Save Changes" tabindex="3">
		</div>
	</form>
</cfoutput>


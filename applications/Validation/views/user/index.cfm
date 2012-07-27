<h2>User Form</h2>

<cfoutput>

	#getPlugin('MessageBox').renderit()#

	<form method="post" action="#event.buildLink('user/save')#">
		<div class="clearfix">
			<label for="name">Username (Required, Length: 6-20)</label>
			<div class="input">
				#html.passwordField(name="username", value=event.getValue("username",""), size="30")#
			</div>
		</div>
		<div class="clearfix">
			<label for="description">Password (Required, Length: 6-20)</label>
			<div class="input">
				#html.passwordField(name="password", value=event.getValue("password",""), size="30")#
			</div>
		</div>
		<div class="actions">
			<input type="submit" class="btn primary" value="Save" tabindex="4">
		</div>
	</form>

</cfoutput>
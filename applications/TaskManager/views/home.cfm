<cfoutput>
<h2>#rc.welcomeMessage#</h2>

<div id="infobox">
<p>
    You are now running <strong>#getSetting("codename",1)# #getSetting("version",1)# (#getsetting("suffix",1)#)</strong>.
	Welcome to the next generation of ColdFusion applications.  You can now start building your application with ease, we already did the hard work
	for you.
</p>
</div>

<table cellpadding="5" width="98%" align="center">
    <tr>
        <td valign="top">
            <h3>API REST</h3>
			<p>Here are some REST URLs for getting your Task data.</p>
			<p>
				<ul>
					<li><a href="#event.buildLink('api/xml/tasks')#">Active Tasks as XML = /api/xml/tasks</a></li>
					<li><a href="#event.buildLink('api/json/tasks')#">Active Tasks as JSON = /api/json/tasks</a></li>
					<li><a href="#event.buildLink('api/xml/tasks/completed')#">Completed Tasks as XML =  /api/xml/tasks/completed</a></li>
					<li><a href="#event.buildLink('api/json/tasks/completed')#">Completed Tasks as JSON =  /api/json/tasks/completed</a></li>
				</ul>
			</p>
			<h3>The Task Manager App</h3>
			<p>Click here to manage your tasks and generate RSS feeds for them.</p>
			<ul>
				<li><a href="#event.buildLink( 'tasks' )#">Task Manager</a></li>
			</ul>
            <br />
           <h4>ColdBox URL Actions</h4>
			<p>ColdBox can use some very important URL actions to interact with your application. You can try them out below:</p>
				<ul>
                    <li>
						<a href="index.cfm?fwreinit=true">Reinitialize the framework</a> (fwreinit=1)
					</li>
				</ul>
				<sub>* <a href="http://wiki.coldbox.org/wiki/URLActions.cfm">URL Actions Guide</a></sub>
            <br />
			<h4>Customizing your Application</h4>
            <p>
                You can now start editing your application and building great ColdBox enabled apps. Important files & locations:
            </p>   
			 <ol>
                    <li>
                        <b>/config/coldbox.cfc</b>: Your application configuration file
                    </li>
					 <li>
                        <b>/config/routes.cfm</b>: Your SES routing table
                    </li>
                    <li>
                        <b>/handlers</b>: Your Application controllers
                    </li>
					<li>
                        <b>/includes</b>: Assets, Helpers, i18n, templates and more.
                    </li>
					<li>
                        <b>/includes/helpers</b>: Place all your application and specific helpers here
                    </li>
					<li>
                        <b>/layouts</b>: Where you place all your application layouts
                    </li>
					<li>
                        <b>/logs</b>: The ColdBox Logs directory
                    </li>
					<li>
                        <b>/models</b>: The meat of your app, your business logic objects
                    </li>
					<li>
                        <b>/tests</b>: Your unit testing folder (Just DO IT!!)
                    </li>
					<li>
                        <b>/views</b>: Where you create all your views and viewlets
                    </li>
                </ol>
        </td>
		<td valign="top" id="sidebar">
	    <ul class="links">
	        <li>
	            <h3>Community Links</h3>
	            <ul class="links">
	                <li>
	                    <a href="http://www.coldbox.org">ColdBox Site</a>
	                </li>
	                <li>
	                    <a href="http://blog.coldbox.org">Blog</a>
	                </li>
	                <li>
	                    <a href="https://ortussolutions.atlassian.net/browse/COLDBOX">Bug Tracker/Wiki</a>
	                </li>
					<li>
	                    <a href="https://groups.google.com/forum/?hl=en##!forum/coldbox">Mailing List</a>
	                </li>
					<li>
						<a href="http://www.coldbox.org/download">Downloads</a>
					</li>
					<li>
						<a href="http://www.coldbox.org/api">ColdBox API</a>
					</li>
					<li>
						<a href="https://github.com/coldbox/coldbox-platform">Code</a>
					</li>
					<li>
						<a href="http://www.coldbox.org/media">ColdBox Videos</a>
					</li>
					<li>
						<a href="http://www.coldbox.org/training">Community Support</a>
					</li>
					<li>
						<a href="http://www.coldbox.org/training/onsite">Training & Courses</a>
					</li>
	            </ul>
	        </li>
			</ul>
		
		<div style="margin:auto;text-align:center">
			<img src="http://www.coldbox.org/includes/images/logos/poweredby.gif" alt="ColdBox" />
		</div>
    </td>
    </tr>
</table>
</cfoutput>
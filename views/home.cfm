<cfoutput>

<div id="content">
 	<h2>#getResource("welcometitle")#</h2>
	<p>#getResource("welcomemessage")#</p>

	<div class="splitcontentright">
		<h2>#getresource("aboutauthortitle")# </h2>
		<p>#getresource("aboutauthormessage")# </p>
	</div>

	<div class="splitcontentleft">
		<h2>#getresource("about")# ColdBox </h2>
		<p>#getResource("aboutcoldbox")# </p>

		<div class="box">
			<strong>#getResource("Tip")#</strong>: #getResource("TipMessage")# :<br>
			<div align="center">
				<input type="button" name="reinitbutton" value="#getResource("ReinitButton")#" onClick="window.location='index.cfm?fwreinit=true'">
			</div>
		</div>
	</div>

	<div class="splitcontentright">
	<p>&nbsp;</p>
		<h2>#getresource("contributetitle")# </h2>
		<p>#getresource("contributemessage")#</p>
	</div>

	<div class="clear"><p>&nbsp;</p></div>

	<div >
		<h2>#getResource("includedexamples")#:</h2>

		<div id="mytabs" style="margin:0px">

			<ul class="anchors" style="margin:0px">
                <li><a href="##section-1">#getResource("tab_noinstall")#</a></li>
                <li><a href="##section-2">#getResource("tab_install")#</a></li>
            </ul>


			<div id="section-1" >
				<div class="boxscrolling">
				
				<!--- Hello World --->
				<h3>Hello World</h3>
				<p> #getresource("by")# Luis Majano
				  <br />
				  #getresource("nosetup")# <br />
				  <a href="applications/helloworld/index.cfm" target="_blank">#getresource("opensample")#</a><br />
				</p>

				<!--- Java Loader --->
				<h3>JavaLoader</h3>
				<p> #getresource("by")# Luis Majano
				  <br />#getresource("javaloadermessage")#<br>
				  #getresource("nosetup")# <br />
				  <a href="applications/javaloader/index.cfm" target="_blank">#getresource("opensample")#</a><br />
				</p>
				
				<!--- Web Services --->
				<h3>News Web Service</h3>
				<p> #getresource("by")# Luis Majano
				  <br />
				  <a href="applications/NewsWebservice/index.cfm" target="_blank">#getresource("opensample")#</a><br />
				</p>
				
				<!--- Feed Reader --->
				<h3>Feed Reader Samples</h3>
				<p> #getresource("by")# Ben Garrett
				  <br />
				  <a href="applications/feedReader/index.cfm" target="_blank">#getresource("opensample")#</a><br />
				</p>
				
				<!--- Feed Generator --->
				<h3>Feed Generator Samples</h3>
				<p> #getresource("by")# Ben Garrett
				  <br />
				  <a href="applications/feedGenerator/index.cfm" target="_blank">#getresource("opensample")#</a><br />
				</p>

				<!--- Sample Login App --->
				<h3>Sample Login App</h3>
				<p> #getresource("by")# Luis Majano
				  <br />
				  #getresource("nosetup")# <br />
				  <a href="applications/sampleloginapp/index.cfm" target="_blank">#getresource("opensample")#</a><br />
				</p>
				
				<!--- UDF --->
				<h3>UDF Library Usage</h3>
				<p> #getresource("by")# Luis Majano
				  <br />
				  #getresource("nosetup")# <br />
				  <a href="applications/udf_library_usage/index.cfm" target="_blank">#getresource("opensample")#</a><br />
				</p>
				
				<!--- i18n --->
				<h3>i18N Sample Gallery</h3>
				<p> #getresource("by")# Paul Hastings & Luis Majano
				  <br />
				  #getresource("nosetup")# <br />
				  <a href="applications/i18NSample/index.cfm" target="_blank">#getresource("opensample")#</a><br />
				</p>
				
				<!--- SES --->
				<h3>Coldbox SES</h3>
				<p> #getresource("by")# Sana Ullah & Luis Majano
				  <br />
				  #getresource("nosetup")# <br />
				  <a href="applications/ColdBoxSES/index.cfm" target="_blank">#getresource("opensample")#</a><br />
				</p>
				
				</div>
			</div>

			<div id="section-2" >
				<div class="boxscrolling">
				
				<!--- Simple Blog --->
				<h3>Simple Blog</h3>
				<p> #getresource("by")# Henrik Joreteg & Luis Majano<bR>
				#getresource("needssetup")#
				<br />
				  <a href="applications/SimpleBlog/install/readme.txt?TB_iframe=true&height=550&width=800" class="thickbox" title="Readme.txt">Install.txt</a><br />
				</p>
				
				<!--- Ajax Reader --->
				<h3>Ajax ColdBoxReader</h3>
				<p> #getresource("by")# Oscar Arevalo<br />#getresource("coldboxreadermessage")#<bR>
				#getresource("needssetup")#
				<br />
				  <a href="#getSetting("ColdboxReaderApp")#/install/install.txt?TB_iframe=true&height=550&width=800" class="thickbox" title="Install.txt">Install.txt</a><br />
				  <a href="#getSetting("ColdboxReaderApp")#/install?TB_iframe=true&height=550&width=800" class="thickbox" title="Install Folder">#getresource("openinstall")#</a><br />
				  <a href="#getSetting("ColdboxReaderApp")#/index.cfm" target="_blank">#getresource("opensample")#</a><br />
				</p>
								
				</div>
			</div>
		</div>

	</div>

</div>

</cfoutput>
<cfsetting enablecfoutputonly="no">
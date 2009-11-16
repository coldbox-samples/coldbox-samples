<?xml version="1.0" encoding="UTF-8"?>
<Config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xsi:noNamespaceSchemaLocation="http://www.coldboxframework.com/schema/config_3.0.0.xsd">
	<Settings>
		<Setting name="AppName"						value="Illudium PU-36 Code Generator"/>
		<Setting name="DebugMode" 					value="false" />
		<Setting name="DebugPassword" 				value=""/>
		<Setting name="EventName" 					value="event"/>
		<Setting name="DefaultEvent" 				value="generator.dspHome"/>
		<Setting name="RequestStartHandler" 		value=""/>
		<Setting name="RequestEndHandler" 			value=""/>
		<Setting name="ApplicationStartHandler" 	value=""/>
		<Setting name="UDFLibraryFile" 				value="" />
		<Setting name="ExceptionHandler"			value="" />
		<Setting name="CustomErrorTemplate"			value="" />
		<Setting name="HandlersIndexAutoReload"   	value="false" />
		<Setting name="ConfigAutoReload"          	value="false" />
		<Setting name="PluginsExternalLocation"   		value="" />
		<Setting name="HandlerCaching" 				value="true"/>
	</Settings>

	<YourSettings>
		<Setting name="adminPass" 	value="coldfusion"/>
		<Setting name="xslBasePath" value="./model/xsl/" />
	</YourSettings>
	
	<!-- 
		ColdBox Logging via LogBox
		Levels: -1=OFF,0=FATAL,1=ERROR,2=WARN,3=INFO,4=DEBUG,5=TRACE
	-->
	<LogBox>
		<!-- Log to console -->
		<Appender name="console" class="coldbox.system.logging.appenders.ConsoleAppender" />
		<!-- Log to ColdBox Files -->
		<Appender name="coldboxfile" class="coldbox.system.logging.appenders.AsyncRollingFileAppender">
			<Property name="filePath">logs</Property>
			<Property name="fileName">${AppName}</Property>
			<Property name="autoExpand">true</Property>
			<Property name="fileMaxSize">2000</Property>
			<Property name="fileMaxArchives">2</Property>		
		</Appender>
		<!-- Root Logger Definition -->
		<Root levelMin="FATAL" levelMax="DEBUG" appenders="*" />
		<!-- Category Definitions Below -->
	</LogBox>

	<!--Optional,if blank it will use the CFMX administrator settings.-->
	<MailServerSettings />

	<!--Emails to Send bug reports, you can create as many as you like-->
	<BugTracerReports />

	<WebServices />
	
	<!--Declare Layouts for your application here-->
	<Layouts>
		<!--Declare the default layout, MANDATORY-->
		<DefaultLayout>Layout.Main.cfm</DefaultLayout>
		
		<!--Declare other layouts, with view assignments if needed, else do not write them-->
		<Layout file="Layout.Popup.cfm" name="popup">
			<!--You can declare all the views that you want to appear with the above layout-->
			<View>vwTest</View>
			<View>vwMyView</View>
		</Layout>
	</Layouts>

	<i18N />
	
	<Datasources />
	
	<Interceptors>
		<Interceptor class="coldbox.system.interceptors.autowire" />
	</Interceptors>

</Config>

<?xml version="1.0" encoding="UTF-8"?>
<Config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xsi:noNamespaceSchemaLocation="http://www.coldboxframework.com/schema/config_3.0.0.xsd">
	<Settings>
		<!--The name of your app-->
		<Setting name="AppName" 				value="Sample Login Application"/>
		<Setting name="DebugMode" 				value="true" />
		<Setting name="DebugPassword" 			value="coldbox"/>
		<Setting name="EventName" 				value="event"/>
		<Setting name="DefaultEvent" 			value="ehGeneral.dspLogin"/>
		<Setting name="RequestStartHandler" 	value="ehGeneral.onRequestStart"/>
		<Setting name="RequestEndHandler" 		value=""/>
		<Setting name="ApplicationStartHandler" value="" />
		<Setting name="OwnerEmail" 				value="myemail@email.com" />
		<Setting name="EnableBugReports" 		value="true"/>
		<Setting name="UDFLibraryFile" 			value="" />
		<Setting name="CustomErrorTemplate" 	value=""/>
		<Setting name="ExceptionHandler" 		value=""/>
		<Setting name="MessageboxStyleOverride" value=""/>
		<Setting name="HandlersIndexAutoReload" value="false"/>
		<Setting name="ConfigAutoReload" 		value="false"/>
		<Setting name="HandlerCaching" 			value="false"/>
	</Settings>

	<YourSettings />
	
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
		<Root levelMin="FATAL" levelMax="TRACE" appenders="*" />
		<!-- Category Definitions Below -->
	</LogBox>

	<!--Optional,if blank it will use the CFMX administrator settings.-->
	<MailServerSettings>
		<MailServer></MailServer>
		<MailUsername></MailUsername>
		<MailPassword></MailPassword>
	</MailServerSettings>

	<!--Emails to Send bug reports-->
	<BugTracerReports>
		<!--<BugEmail>cfcoldbox@gmail.com</BugEmail>-->
	</BugTracerReports>

	<!--Webservice declarations your use in your app, if not use, leave blank
	<WebServices />
	-->
	<WebServices />

	<!--Declare Layouts for your app here-->
	<Layouts>
		<!--Declare the default layout, mandatory-->
		<DefaultLayout>Layout.Main.cfm</DefaultLayout>
		<!--
		No other layouts are used, so they are not declared, else
		declare them here
			<Layout file="Layout.Popup.cfm" name="popup">
			below declare the views used in this layout.
			<View>vwTest</View>
			</Layout>
		-->
	</Layouts>

	<i18N />
	
	<Datasources />
	
	<Interceptors>
		<Interceptor class="coldbox.samples.applications.sampleloginapp.model.securityInterceptor" />
	</Interceptors>
	
</Config>

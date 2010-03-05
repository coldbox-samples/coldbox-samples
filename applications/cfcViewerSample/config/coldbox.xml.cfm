<?xml version="1.0" encoding="UTF-8"?>
<Config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xsi:noNamespaceSchemaLocation="http://www.coldboxframework.com/schema/config_3.0.0.xsd">
	<Settings>
		<!--The name of your application.-->
		<Setting name="AppName"						value="ColdBox cfcviewer Sample"/>
		<!--Default Debugmode boolean flag (Set to false in production environments)-->
		<Setting name="DebugMode" 					value="false" />
		<!--The Debug Password to use in order to activate/deactivate debugmode,activated by url actions -->
		<Setting name="DebugPassword" 				value=""/>
		<!--The fwreinit password to use in order to reinitialize the framework and application.Optional, else leave blank -->
		<Setting name="ReinitPassword" 				value=""/>
		<!--Default event name variable to use in URL/FORM etc. -->
		<Setting name="EventName"					value="event" />
		<!--Default Event to run if no event is set or passed. Usually the event to be fired first (NOTE: use event handler syntax)-->
		<Setting name="DefaultEvent" 				value="general.index"/>
		<!--Event Handler to run on the start of a request, leave blank if not used. Emulates the Application.cfc onRequestStart method	-->
		<Setting name="RequestStartHandler" 		value="main.onRequestStart"/>
		<!--Event Handler to run at end of all requests, leave blank if not used. Emulates the Application.cfc onRequestEnd method-->
		<Setting name="RequestEndHandler" 			value="main.onRequestEnd"/>
		<!--Event Handler to run at the start of an application, leave blank if not used. Emulates the Application.cfc onApplicationStart method	-->
		<Setting name="ApplicationStartHandler" 	value="main.onAppInit"/>
		<!--Event Handler to run at the start of a session, leave blank if not used.-->
		<Setting name="SessionStartHandler" 		value="main.onSessionStart"/>
		<!--Event Handler to run at the end of a session, leave blank if not used.-->
		<Setting name="SessionEndHandler" 			value="main.onSessionEnd"/>
		<!--The event handler to execute on all framework exceptions. Event Handler syntax required.-->
		<Setting name="ExceptionHandler"			value="" />
		<!--What event to fire when an invalid event is detected-->
		<Setting name="onInvalidEvent" 				value="" />
		<!--Full path from the application's root to your custom error page, else leave blank. -->
		<Setting name="CustomErrorTemplate"			value="" />
		<!--UDF Library To Load on every request for your views and handlers -->
		<Setting name="UDFLibraryFile" 				value="" />
		<!--Flag to Auto reload the internal handlers directory listing. False for production. -->
		<Setting name="HandlersIndexAutoReload"   	value="false" />
		<!--Flag to auto reload the config.xml settings. False for production. -->
		<Setting name="ConfigAutoReload"          	value="false" />
		<!-- Declare the custom plugins base invocation path, if used. You have to use dot notation.Example: mymapping.myplugins	-->
		<Setting name="PluginsExternalLocation"   		value="" />
		<!-- Declare the external handlers base invocation path, if used. You have to use dot notation.Example: mymapping.myhandlers	-->
		<Setting name="HandlersExternalLocation"   	value="" />
		<!--Flag to cache handlers. Default if left blank is true. -->
		<Setting name="HandlerCaching" 				value="true"/>
		<!--Flag to cache events if metadata declared. Default is true -->
		<Setting name="EventCaching" 				value="true"/>
		<!--Request Context Decorator, leave blank if not using. Full instantiation path -->
		<Setting name="RequestContextDecorator" 	value=""/>
		<!--Flag if the proxy returns the entire request collection or what the event handlers return, default is false -->
		<Setting name="ProxyReturnCollection" 		value="false"/>
		<!-- What scope are flash persistance variables using. -->
		<Setting name="FlashURLPersistScope" 		value="session"/>
	</Settings>

	<!--Your Settings can go here, if not needed, use <YourSettings />. You can use these for anything you like.
		<YourSettings>
			<Setting name="MySetting" value="My Value"/>
		</YourSettings>
	 -->
	<YourSettings></YourSettings>
	
	<!-- Custom Conventions : You can override the framework wide conventions
	<Conventions>
		<handlersLocation></handlersLocation>
		<pluginsLocation></pluginsLocation>
		<layoutsLocation></layoutsLocation>
		<viewsLocation></viewsLocation>
		<eventAction></eventAction>		
	</Conventions>	
	-->
	
	<!--Optional,if blank it will use the CFMX administrator settings.-->
	<MailServerSettings>
		<MailServer></MailServer>
		<MailPort></MailPort>
		<MailUsername></MailUsername>
		<MailPassword></MailPassword>
	</MailServerSettings>

	<!--Emails to Send bug reports, you can create as many as you like
	<BugEmail>myemail@gmail.com</BugEmail>	
	-->
	<BugTracerReports/>

	<!--Webservice declarations your use in your application, if not use, leave blank
	Note that for the same webservice name you can have a development url and a production url.
	<WebServices>
		<WebService name="TESTWS1" URL="http://www.test.com/test1.cfc?wsdl" />
		<WebService name="TESTWS2" URL="http://www.test.com/test2.cfc?wsdl" />
	</WebServices>
	-->
	<WebServices />

	<!--Declare Layouts for your application here-->
	<Layouts>
		<!--Declare the default layout, MANDATORY-->
		<DefaultLayout>Layout.Main.cfm</DefaultLayout>
		
		<!--Default View, OPTIONAL
		<DefaultView>home</DefaultView>
		-->
		
		<!--
		Declare other layouts, with view/folder assignments if needed, else do not write them
		<Layout file="Layout.Popup.cfm" name="popup">
			<View>vwTest</View>
			<View>vwMyView</View>
			<Folder>tags</Folder>
		</Layout>
		-->
	</Layouts>

	<!--Internationalization and resource Bundle setup:
	<i18N>
		<DefaultResourceBundle>includes/main</DefaultResourceBundle>
		<DefaultLocale>en_US</DefaultLocale>
		<LocaleStorage>session</LocaleStorage>
	</i18N>
	-->
	<i18N />
	
	<!--Datasource Setup, you can then retreive a datasourceBean via the getDatasource("name") method: 
	<Datasource alias="MyDSNAlias" name="real_dsn_name"   dbtype="mysql"  username="" password="" />	
	-->
	<Datasources />
	
	<!--ColdBox Object Caching Settings Overrides the Framework-wide settings 
	<Cache>
		<ObjectDefaultTimeout>60</ObjectDefaultTimeout>
		<ObjectDefaultLastAccessTimeout>30</ObjectDefaultLastAccessTimeout>
		<UseLastAccessTimeouts>true</UseLastAccessTimeouts>
		<ReapFrequency>1</ReapFrequency>
		<MaxObjects>100</MaxObjects>
		<FreeMemoryPercentageThreshold>1</FreeMemoryPercentageThreshold>
		<EvictionPolicy>LRU</EvictionPolicy>
	</Cache>
	-->
	
	<!-- Interceptor Declarations 
	<Interceptors throwOnInvalidStates="true">
		<CustomInterceptionPoints>comma-delimited list</CustomInterceptionPoints>
		<Interceptor class="full class name">
			<Property name="myProp">value</Property>
			<Property name="myArray">[1,2,3]</Property>
			<Property name="myStruct">{ key1:1, key2=2 }</Property>
		</Inteceptor>
		<Interceptor class="no property" />
	</Interceptors>
	-->
	
	<Interceptors>
		<!-- config file is relative to app root -->
		<Interceptor class="coldbox.system.interceptors.SES">
			<Property name="configFile">config/routes.cfm</Property>
		</Interceptor>
	</Interceptors>
	
</Config>

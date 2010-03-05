<?xml version="1.0" encoding="UTF-8"?>
<Config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:noNamespaceSchemaLocation="http://www.coldboxframework.com/schema/config_3.0.0.xsd">
	<Settings>
		<Setting name="AppName" 					value="ColdBoxReader"/>
		<Setting name="DebugMode" 					value="false"/>
		<Setting name="DebugPassword" 				value=""/>
		<Setting name="EventName" 					value="event"/>
		<Setting name="DefaultEvent" 				value="general.dspStart"/>
		<Setting name="ApplicationStartHandler"		value=""/>
		<Setting name="RequestStartHandler" 		value="main.onRequestStart"/>
		<Setting name="RequestEndHandler" 			value=""/>
		<Setting name="UDFLibraryFile" 				value="" />
		<Setting name="CustomErrorTemplate" 		value=""/>
		<Setting name="ExceptionHandler" 			value="main.onException"/>
		<Setting name="HandlersIndexAutoReload" 	value="false"/>
		<Setting name="ConfigAutoReload" 			value="false"/>
		<Setting name="HandlerCaching"				value="false" />
	</Settings>
	
	<IOC>
		<Framework type="lightwire" objectCaching="true">config/services.xml.cfm</Framework>
	</IOC>

	<YourSettings>
		<Setting name="Version" value="2.1.0" />
		<Setting name="ModelBasePath" value="coldbox.samples.applications.ColdBoxReader.components" />
		<Setting name="MessageBox_style_override"   value="true" />
		<!-- FeedReader Settings -->
		<Setting name="feedReader_useCache" 		value="true" />
		<Setting name="feedReader_cacheType" 		value="file" />
		<Setting name="feedReader_cacheLocation"	value="cache" />
		<Setting name="feedReader_cacheTimeout"		value="30" />
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
		</Appender>
		<!-- Root Logger Definition -->
		<Root levelMin="FATAL" levelMax="DEBUG" appenders="*" />
		<!-- Category Definitions Below -->
	</LogBox>

	<!--Optional,if blank it will use the CFMX administrator settings.-->
	<MailServerSettings />

	<BugTracerReports />

	<WebServices />

	<Layouts>
		<DefaultLayout>Layout.None.cfm</DefaultLayout>
		<Layout file="Layout.Main.cfm" name="clean">
			<View>general/dspstart</View>
		</Layout>
	</Layouts>

	<i18N />

	<Datasources>
		<Datasource alias="coldboxreader" name="coldboxreader" dbtype="mysql" username="" password="" />
	</Datasources>
	
	<Interceptors>
		<Interceptor class="coldbox.system.interceptors.Autowire" />
	</Interceptors>

</Config>

<?xml version="1.0" encoding="UTF-8"?>
<Config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xsi:noNamespaceSchemaLocation="http://www.coldboxframework.com/schema/config_3.0.0.xsd">
	<Settings>
		<Setting name="AppName" 					value="Coldbox Samples Browser"/>
		<Setting name="DebugMode" 					value="true"/>
		<Setting name="DebugPassword" 				value=""/>
		<Setting name="EventName" 					value="event"/>
		<Setting name="DefaultEvent" 				value="Samples.index"/>
		<Setting name="HandlersIndexAutoReload" 	value="false"/>
		<Setting name="ConfigAutoReload" 			value="false"/>
		<Setting name="HandlerCaching" 				value="true" />
		<Setting name="EventCaching" 				value="true" />
	</Settings>

	<!-- Your own custom settings -->
	<YourSettings>
		<Setting name="ForumsURL" 			value="http://forums.coldboxframework.com" />
		<Setting name="AmazonURL" 			value="http://www.amazon.com/o/registry/7DPYG3RZG3AF"/>
		<Setting name="ColdboxURL" 			value="http://www.coldboxframework.com"/>
		<Setting name="BlogURL" 			value="${ColdboxURL}/index.cfm/about/news"/>
		<Setting name="ColdboxAPIURL" 		value="${ColdboxURL}/api"/>
		<Setting name="TracURL" 			value="http://ortus.svnrepository.com/coldbox/trac.cgi/"/>
		<!-- App Versionsettings -->
		<Setting name="BlogcfcApp" 			value="applications/blogcfcv5_0" />
		<Setting name="ForumsApp" 			value="applications/galleon_1_7" />
		<Setting name="ColdboxReaderApp" 	value="applications/ColdBoxReader" />
		<Setting name="cfcGeneratorApp"  	value="applications/cfcGenerator" />
		<Setting name="TransferApp" 		value="applications/TransferSample" />
		<Setting name="TransferApp2" 		value="applications/TransferSample2" />
		<Setting name="SecurityApp" 		value="applications/securitysample" />
	</YourSettings>
	
	<!--Declare Layouts for your app here-->
	<Layouts>
		<!--Declare the default layout, this is mandatory-->
		<DefaultLayout>Layout.Main.cfm</DefaultLayout>
	</Layouts>

	<i18N>
		<!--Default Resource Bundle without locale and properties extension-->
		<DefaultResourceBundle>includes/i18n/main</DefaultResourceBundle>
		<!--Java Standard Locale-->
		<DefaultLocale>en_US</DefaultLocale>
		<!--session or client or cookie-->
		<LocaleStorage>cookie</LocaleStorage>
	</i18N>
	
	<Interceptors >
		<Interceptor class="coldbox.system.interceptors.SES">
			<Property name="configFile">config/routes.cfm</Property>
		</Interceptor>
	</Interceptors>

</Config>

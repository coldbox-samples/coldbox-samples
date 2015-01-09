<cfoutput >
<cfset i18n = getInstance( 'i18n@cbi18n' )>
<strong>Locale:</strong> <br />#i18n.getfwLocale()#<br />
<strong>Language:</strong> <br />#i18n.getFWLanguage()#<br />
<strong>Country:</strong> <br />#i18n.getFWCountry()#<br />
<strong>TimeZone:</strong> <br />#i18n.getServerTZ()#<br />
<strong>i18nDateFormat:</strong> <br />#i18n.i18nDateFormat(i18n.toEpoch(now()),1)#<br />
<strong>i18nTimeFormat:</strong> <br />#i18n.i18nTimeFormat(i18n.toEpoch(now()),2)#<br />
<hr>
<strong>I18NUtilDate:</strong> <br />#i18n.dateLocaleFormat(now())#<br>
</cfoutput>
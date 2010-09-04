<!-----------------------------------------------------------------------
********************************************************************************
Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************

Author     :	Luis Majano
Date        :	10/16/2007
Description :
	This file is used by the BeanFactory plugin to read off model mappings.
	This is a great place to alias model paths into names so when you 
	refactor you can easily do this.
	
	All you need to do is call one method: addModelMapping(path=alias,path)
	
	Alias : The alias to create
	Path : The model class path to alias.
	
	Example:
	
	addModelMapping(path='FormBean',"security.test.FormBean");
	
----------------------------------------------------------------------->
<cfscript>
	/* Add all the model mappings you want */
	addModelMapping(path="security.SecurityService");
	addModelMapping(path="comments.CommentService");
	addModelMapping(path="entries.EntryService");
	addModelMapping(path="users.UserService");
	addModelMapping(path="utilities.DateUtil");
	addModelMapping(path="rss.RSSService");
</cfscript>

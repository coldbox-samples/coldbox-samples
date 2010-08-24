<cfcomponent name="Utilities" hint="Extended utilities plugin for feedReader example" extends="coldbox.system.Plugin" output="false" cache="true">

<!------------------------------------------- CONSTRUCTOR ------------------------------------------->

<cffunction name="init" access="public" returntype="Utilities" output="false">
	<cfargument name="controller" type="any" required="true">
	<cfset super.Init(arguments.controller) />
	<cfset setpluginName("feedReader Example Utilities Plugin")>
	<cfset setpluginVersion("1.0")>
	<cfset setpluginDescription("This is a collection of miscellaneous utilities that are used by the feedReader example.")>
	<!--- Any constructor code you want --->

	<cfreturn this>
</cffunction>

<!------------------------------------------- PUBLIC ------------------------------------------->
<!--- TODO: Utilities plug-in proposals [on-hold] --->
<cffunction name="oneKGrouping" output="false" access="public" returntype="string" hint="Inserts thousand groupings separator into a number">
	<cfargument name="number" required="yes" type="numeric" hint="Integer">
	<cfargument name="locali18n" default="true" type="boolean" hint="Toogle local support or us default US symbols">
	<cfscript>
		/* data containers */
		var decSymbolData = '';
		var decimal = '';
		var integer = '';
		var returnString = '';
		/* separators */
		var decimalSep = '.'; // default US decimal separator
		var groupSep = ','; // default US grouping separator
		/* implement i18n symbols */
		if(arguments.locali18n) {
			try {
				decSymbolData = getPlugin("i18n").getDecimalSymbols();
				decimalSep = decSymbolData.decimalseparator;
				groupSep = decSymbolData.groupingseparator;
			}
			catch (any e) {}
		}
		/* seperate decimal from integer */
		decimal = ListLast(arguments.number,'.');
		integer = ListFirst(arguments.number,'.');
		if(decimal eq integer) { decimal = 0; }
		// insert groupings
		integer = REReplace(Reverse(integer), "([0-9][0-9][0-9])", "\1#groupSep#", "ALL");
		/* remove trailing grouping */
		if(right(integer,1) is groupSep) {
			integer = REReplace(integer, "#groupSep#$", "");
		}
		//integer = REReplace(integer, "#groupSep#([^0-9]+)", "\1");
		/* merge decimal to integer */
		if(Len(decimal) and decimal neq 0) {
			returnString = Reverse(integer) & '#decimalSep#' & decimal;
		}
		else {
			returnString = Reverse(integer);
		}
		return returnString;
	</cfscript>
</cffunction>

<cffunction name="ordinalAbbr" output="false" access="public" returntype="string" hint="Attaches an ordinal abbreviation (st,nd,rd,th) to a number">
	<cfargument name="number" required="yes" type="numeric" hint="Integer">
	<cfargument name="locali18n" default="true" type="boolean" hint="Toogle local support or us default US symbols">
	<cfscript>
		var suffix = '';
		var value = '';
		/* convert number to use an oral suffix */
		value = Right(arguments.number,1);
		if((value gte 4 and value lte 9) or value eq 0 or (arguments.number gte 11 and arguments.number lte 13)) {
			suffix = 'th'; // numbers ending with 4,5,6,7,8,9 and numbers that equal to 11,12,13
		}
		else if(value eq 1) {
			suffix = 'st'; // numbers ending with 1 except number 11
		}
		else if(value eq 2) {
			suffix = 'nd'; // numbers ending with 2 except number 12
		}
		else if(value eq 3) {
			suffix = 'rd'; // numbers ending with 3 except number 13
		}
		return oneKGrouping(arguments.number,arguments.locali18n) & suffix;
	</cfscript>
</cffunction>

<cffunction name="computerUnit" output="false" access="public" returntype="string" hint="Converts a number into a rounded computer unit">
	<cfargument name="number" required="yes" type="numeric" hint="Byte value to be converted">
	<cfargument name="lowestunit" type="string" default="B" hint="Sets the smallest output measurement to be used (B,K,M,G,T)">
	<cfargument name="highestunit" type="string" default="T" hint="Sets the largest output measurement to be used (B,K,M,G,T)">
	<cfargument name="showdecimal" type="boolean" default="yes" hint="Show a decimal place for values equaling 1 or greater">
	<cfargument name="locali18n" default="true" type="boolean" hint="Toogle local support or us default US symbols">
	<cfscript>
		var result = 0;
		var unit = '';
		var unitString = '';
		var Bval = 1; // Byte
		var Kval = 1024; // Kilobyte
		var Mval = 1048576; // Megabyte
		var Gval = 1073741824; // Gigabyte
		var Tval = 1099511627776; // Terabyte
		/* work out which unit to use */
		unit = 'T'; // default unit
		if(arguments.highestunit eq 'G' OR (arguments.number lt Tval and arguments.lowestunit neq 'T')) { unit = 'G'; }
		if(arguments.highestunit eq 'M' OR (arguments.number lt Gval and ReFindNocase('^[T|G]$',lowestunit) is 0)) { unit = 'M'; }
		if(arguments.highestunit eq 'K' OR (arguments.number lt Mval and ReFindNocase('^[T|G|M]$',lowestunit) is 0)) { unit = 'K'; }
		if(arguments.number lt Kval and ReFindNocase('^[T|G|M|K]$',lowestunit) is 0) { unit = 'B'; }
		/* convert number to new unit value */
		result = ( arguments.number / Evaluate('#unit#val') ); // divide number with the [unit]val variable value
		/* format and round number depending on the result value */
		if(result lt 1 and arguments.showdecimal is true) { result = NumberFormat(result,'.99'); } // two optional decimal places
		else if(result lt 1 and arguments.showdecimal is true) { result = NumberFormat(result,'0'); } // no decimal places
		else if(result lt 10 and arguments.showdecimal is true) { result = NumberFormat(Round(result*100)/100,'0.00'); } // two mandatory decimal places
		else if(result lt 10 and arguments.showdecimal is false) { result = NumberFormat(Round(result*100)/100,'0'); } // no decimal places
		else if(result lt 100 and arguments.showdecimal is true) { result = NumberFormat(Round(result*10)/10,"90.0"); } // one mandatory decimal place
		else if(result lt 100 and arguments.showdecimal is false) { result = NumberFormat(Round(result*10)/10,"90"); } // no decimal places
		else { result = Round(result); } // otherwise round the result
		/* format unit string */
		if(ReFindNocase('^[T|G|M]$',unit)) { unitString = " #UCase(unit)#B"; } // TB, GB or MB
		else if(unit eq 'K') { unitString = " #LCase(unit)#B"; } // kB
		else if(unit eq 'B' and result neq 1) { unitString = " bytes"; }
		else if(unit eq 'B') { unitString = " byte"; }
		/* return final result */
		return oneKGrouping(result,arguments.locali18n) & unitString;
	</cfscript>
</cffunction>

<cffunction name="stringAbrupt" output="false" access="public" returntype="string" hint="Cuts a string to a specific length and fills there rest with ...">
	<cfargument name="string" type="string" required="true">
	<cfargument name="length" type="numeric" required="true">
	<cfscript>
		var stringCut = Left(arguments.string,arguments.length);
		var returnString = Reverse(stringCut);
		returnString = Reverse(Right(returnString,Len(returnString)-FindNoCase(' ',returnString)));
		returnString = returnString & '...';
		return returnString;
	</cfscript>
</cffunction>
	 
<!------------------------------------------- PRIVATE ------------------------------------------->
</cfcomponent>
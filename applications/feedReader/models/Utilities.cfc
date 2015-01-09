component singleton {
	property name="i18n" inject="i18n@cbi18n";
		
	/**
	* @number.hint Integer
	* @locali18n.hint Toogle local support or us default US symbols
	*/
	function oneKGrouping( required numeric number, boolean locali18n=true ) {
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
				decSymbolData = i18n.getDecimalSymbols();
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
	}

	/**
	* Attaches an ordinal abbreviation (st,nd,rd,th) to a number
	* @number.hint Integer
	* @locali18n.hint Toogle local support or us default US symbols
	*/
	function ordinalAbbr( required numeric number, boolean locali18n=true  ) {
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
	}
	
	/**
	* Converts a number into a rounded computer unit
	* @number.hint Byte value to be converted
	* @lowestunit.hint Sets the smallest output measurement to be used (B,K,M,G,T)
	* @highestunit.hint Sets the largest output measurement to be used (B,K,M,G,T)
	* @showdecimal.hint Show a decimal place for values equaling 1 or greater
	* locali18n@.hint Toogle local support or us default US symbols
	*/
	function computerUnit(
			required numeric number,
			string lowestunit='B',
			string highestunit='T',
			boolean showdecimal=true,
			boolean locali18n=true ) {
			
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
	}
	
	/**
	* Cuts a string to a specific length and fills there rest with ...
	*/
	function stringAbrupt( required string string, required numberic length ) {
		var stringCut = Left(arguments.string,arguments.length);
		var returnString = Reverse(stringCut);
		returnString = Reverse(Right(returnString,Len(returnString)-FindNoCase(' ',returnString)));
		returnString = returnString & '...';
		return returnString;
	}
	 

}
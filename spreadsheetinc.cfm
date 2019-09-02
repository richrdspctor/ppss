 

<cfscript> 
//Use an absolute path for the files. ---> 
 theDir=GetDirectoryFromPath(GetCurrentTemplatePath());
 theFile=theDir & "report_outputs" &"\" &theReport; 
//Create   ColdFusion spreadsheet objects. ---> 
theSheet = SpreadsheetNew(thesheetname);
	     
//Populate each object with a query. ---> 
SpreadsheetAddRow(theSheet,  "PROD_ORD_NO,ORDER QUANTITY (10 PACKS),TYPE,ASSAY SOURCE,FORMAT,PRODUCT,BTPN,STUDY NAME,ACCOUNT,SPECIES,CUSTOMER SALES ORDER,INT SALES ORDER,ORDER DATE,ASSAY ORDER DATE,SAP DELIVERY DATE,DATE OIF RECEIVED,CUSTOMER,SHIP TO REGION,DATE ASSAYS RECEIVED,BEST CASE SCENERIO,QS OR NT,PRE AMP,PREMIUM TAT,TARGET SHIP DATE,REVISED TARGET SHIP DATE,COMMENTS,PARTIAL (Quantity and Date),COMPLETION DATE,KPQC,CUSTOM CUSTOM,EXPIDITE, STOP POINT EXISTS,E1 SO,TEMPLATE TYPE, SOURCE, PART NUMBER ");
    		
//optional - format the style of the spreadsheet header row********************************************** --->
// specify format object for "odd" rows
format = {};
format.fgcolor="light_yellow";
format.bold="true";
		 
// apply style formatting to row
spreadsheetformatrows(theSheet,format,1);	
//end: optional - format the style of the spreadsheet*****************************************************  ---> 
 // freeze the top row
 spreadsheetaddfreezepane(theSheet,1,1); 
 SpreadsheetAddRows(theSheet,getOrders);
 // include "spreadsheetForceTextFormat.cfm";
 sheet   =   spreadsheetForceTextFormat
  (
    spreadsheetObject=theSheet
    ,data=getOrders
    ,columnNumbersToFormatAsText=[ 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36 ]
     ,addHeaderRow=true
    );

function spreadsheetForceTextFormat
(
 required spreadsheetObject //pre-loaded with the query data
 ,required query data
 ,required array columnNumbersToFormatAsText
 ,spreadsheetIncludesHeader=true
){
 var columns =   arguments.data.getMetaData().getColumnLabels();
 var rownumber=0;
 var value="";
 for( var columnNumberToFormat in columnNumbersToFormatAsText )
 {
  SpreadSheetFormatColumn( spreadsheetObject,{ dataformat="text" },columnNumberToFormat );
   while( data.next() )
    {
     rownumber   =   data.currentrow;
      if( spreadsheetIncludesHeader )
        rownumber++; // start one row below to allow for header
            // Get the value of column at the current row in the loop
            value   =   data[ columns[ columnNumberToFormat ] ][ data.currentrow ];
            // replace the previously added numeric value which will now be treated as text
          SpreadsheetSetCellValue( spreadsheetObject,value,rownumber,columnNumberToFormat );
        }
    }
    return spreadsheetObject;
}
	
	
</cfscript>
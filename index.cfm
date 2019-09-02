<cfparam name="is_ie8" default=FALSE>
<cfif findnocase("msie 7",cgi.HTTP_USER_AGENT) or findnocase("msie 8",cgi.HTTP_USER_AGENT) ><cfset is_ie8 =TRUE></cfif>
<cfparam name="url.exceloutput" default="no">
 


<cfset thereport="PPSS REPORT #DATEFORMAT(Now(), 'YYYY-MM-DD')#.xls">
<cfset thesheetname= thereport>
<cfset thereporttitle="PPSS REPORT #DATEFORMAT(Now(), 'YYYY-MM-DD')#">
<cfparam name="startdate" default="#dateformat(now()-730, 'yyyy-mm-dd')#">
<cfparam name="enddate" default="#dateformat(now(), 'yyyy-mm-dd')#">
 
<cfset mystartdate= '#startdate#'>
<cfset myenddate = '#enddate#'> 
<!--- standard module include for Oracle query --->
<cfinclude template="queryinc.cfm">

<!--- create excel file, if operator clicked the link --->
<cfif url.exceloutput eq "yes">
     <cfinclude template="spreadsheetinc.cfm">
     <cfspreadsheet action="write" filename="#theFile#" name="theSheet"  
    overwrite=true>
     <cflocation url="http://#CGI.SERVER_NAME#:8500/dashboard/operator/openarray/ppss/report_outputs/#theReport#">
</cfif>
 <html>
<head>
<title><cfoutput>#thereport#</cfoutput></title>
 
<!--- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/s/dt/jqc-1.11.3,dt-1.10.10,fc-3.2.0,fh-3.1.0/datatables.min.css"/>
<script type="text/javascript" src="https://cdn.datatables.net/s/dt/jqc-1.11.3,dt-1.10.10,fc-3.2.0,fh-3.1.0/datatables.min.js"></script> 
  --->
 
<link rel="stylesheet" type="text/css" href="datatables.min.css"/>
<script type="text/javascript" src="datatables.min.js"></script>     		
	   
</head>
<body>
<div id="page">
<div style="position:relative; z-index:3">
     <table cellpadding=0 cellspacing=0
     border=0 width="100%">
          <tr bgcolor="#3f6c96">
               <td  ><font face="Arial, Helvetica, sans-serif"  color="FFFFFF" size="4"><strong><cfoutput>#thereporttitle#</cfoutput></strong> &nbsp;&nbsp;&nbsp; <a style="font-family:Arial, Helvetica, sans-serif;text-decoration:none;color:#FF9900;" href="<cfoutput>#cgi.script_name#</cfoutput>?exceloutput=yes&startdate=<cfoutput>#startdate#</cfoutput>&enddate=<cfoutput>#enddate#</cfoutput>" target="_parent">Excel &nbsp;&nbsp; <img src="../../../images/excel.jpg"    align="top" width="50" border="0"/></a></small></td>
               <td nowrap align="left"><cfform name="myForm" format="html" width="375" height="350" action='#cgi.script_name#' >
                         <cfinput type="dateField" name="startdate"  label="Start date"  width="100" value="#startdate#">
                         <cfinput type="dateField" name="enddate"    label="End date"    width="100" value="#enddate#">
                         <cfinput type="Submit" name="submitit" value="GO" width="100">
                    </cfform></td>
          </tr>
     </table>
</div>
<br>
  <table width="100%"  id="mydataTable" class="display" >
             <thead>
              
                          
                            <th nowrap align="left"><small>PROD ORD NO</small></th>
                            <th nowrap align="left"><small>NUM 10PACK</small></th>
                            <th nowrap align="left"><small>TYPE</small></th>
                            <th nowrap align="left"><small>ASSAY SOURCE</small></th>
                            <th nowrap align="left"><small>FORMAT</small></th>
                            <th nowrap align="left"><small>PRODUCT</small></th>
                            <th nowrap align="left"><small>BTPN </small></th>
                            <th nowrap align="left"><small>STUDY NAME </small></th>
                            <th nowrap align="left"><small>ACCOUNT </small></th>
                            <th nowrap align="left"><small>SPECIES </small></th>
                            <th nowrap align="left"><small>CUSTOMER SALES ORDER </small></th>
                        
                            <th nowrap align="left"><small>INT SALES ORDER</small></th>
                            <th nowrap align="left"><small>ORDER DATE</small></th>
                            <th nowrap align="left"><small>ASSAY ORDER DATE</small></th>
                            <th nowrap align="left"><small>SAP DELIVERY DATE</small></th>
                            <th nowrap align="left"><small>DATE OIF RECEIVED</small></th>
                            <th nowrap align="left"><small>CUSTOMER</small></th>
                            <th nowrap align="left"><small>SHIP TO REGION</small></th>
                            <th nowrap align="left"><small>DATE ASSAYS RECEIVED</small></th>
                            <th nowrap align="left"><small>BEST CASE SCENERIO </small></th> 
                            <th nowrap align="left"><small>QS OR NT</small></th>
                            <th nowrap align="left"><small>PRE AMP</small></th>
                            <th nowrap align="left"><small>PREMIUM TAT</small></th>
                            <th nowrap align="left"><small>TARGET SHIP DATE </small></th>
                            <th nowrap align="left"><small>REVISED TARGET SHIP DATE</small></th>
                            <th nowrap align="left"><small>COMMENTS</small></th>
                           
                            <th nowrap align="left"><small>PARTIAL (QUANTITY AND DATE)</small></th>
                            <th nowrap align="left"><small>COMPLETION DATE</small></th>
                            <th nowrap align="left"><small>KPQC</small></th>
                            <th nowrap align="left"><small>CUSTOM CUSTOM</small></th>
                            <th nowrap align="left"><small>EXPEDITE</small></th>
                            <th nowrap align="left"><small>STOP POINT EXIST</small></th> 
                            <th nowrap align="left"><small>E1 SO</small></th>
                            <th nowrap align="left"><small>TEMPLATE TYPE</small></th>
                           
                            <th nowrap align="left"><small>SOURCE</small></th>
                            <th nowrap align="left"><small>PART NUMBER</small></th>
                  </thead>
             <tfoot>
                              
                            <th nowrap align="left"><small>PROD ORD NO</small></th>
                            <th nowrap align="left"><small>NUM 10PACK</small></th>
                            <th nowrap align="left"><small>TYPE</small></th>
                            <th nowrap align="left"><small>ASSAY SOURCE</small></th>
                            <th nowrap align="left"><small>FORMAT</small></th>
                            <th nowrap align="left"><small>PRODUCT</small></th>
                            <th nowrap align="left"><small>BTPN </small></th>
                            <th nowrap align="left"><small>STUDY NAME </small></th>
                            <th nowrap align="left"><small>ACCOUNT </small></th>
                            <th nowrap align="left"><small>SPECIES </small></th>
                            <th nowrap align="left"><small>CUSTOMER SALES ORDER </small></th>
                        
                            <th nowrap align="left"><small>INT SALES ORDER</small></th>
                            <th nowrap align="left"><small>ORDER DATE</small></th>
                             <th nowrap align="left"><small>ASSAY ORDER DATE</small></th>
                            <th nowrap align="left"><small>SAP DELIVERY DATE</small></th>
                            <th nowrap align="left"><small>DATE OIF RECEIVED</small></th>
                            <th nowrap align="left"><small>CUSTOMER</small></th>
                            <th nowrap align="left"><small>SHIP TO REGION</small></th>
                            <th nowrap align="left"><small>DATE ASSAYS RECEIVED</small></th>
                            <th nowrap align="left"><small>BEST CASE SCENERIO </small></th> 
                            <th nowrap align="left"><small>QS OR NT</small></th>
                            <th nowrap align="left"><small>PRE AMP</small></th>
                            <th nowrap align="left"><small>PREMIUM TAT</small></th>
                            <th nowrap align="left"><small>TARGET SHIP DATE </small></th>
                            <th nowrap align="left"><small>REVISED TARGET SHIP DATE</small></th>
                            <th nowrap align="left"><small>COMMENTS</small></th>
                           
                            <th nowrap align="left"><small>PARTIAL (QUANTITY AND DATE)</small></th>
                            <th nowrap align="left"><small>COMPLETION DATE</small></th>
                            <th nowrap align="left"><small>KPQC</small></th>
                            <th nowrap align="left"><small>CUSTOM CUSTOM</small></th>
                            <th nowrap align="left"><small>EXPEDITE</small></th>
                            <th nowrap align="left"><small>STOP POINT EXIST</small></th> 
                            <th nowrap align="left"><small>E1 SO</small></th>
                            <th nowrap align="left"><small>TEMPLATE TYPE</small></th>
                           
                            <th nowrap align="left"><small>SOURCE</small></th>
                            <th nowrap align="left"><small>PART NUMBER</small></th>
                  </tfoot>
             <tbody>
                  <cfoutput query="getorders">
                       <tr align="center" valign="middle">
                        
                            <td nowrap align="left"><small> <a href="##" onClick="javascript:showWin('#prod_ord_no#')">#PROD_ORD_NO#</a>  </small></td>
                            <td nowrap align="left"><small>#NUM_10PACK#</small></td>
                            <td nowrap align="left"><small>#TYPE#</small></td>
                            <td nowrap align="left"><small>#ASSAY_SOURCE#</small></td>
                            <td nowrap align="left"><small>#FORMAT#</small></td>
                            <td nowrap align="left"><small>#PRODUCT#</small></td>
                            <td nowrap align="left"><small>#BTPN# </small></td>
                            <td nowrap align="left"><small>#STUDY_NAME# </small></td>
                            <td nowrap align="left"><small>#ACCOUNT# </small></td>
                            <td nowrap align="left"><small>#SPECIES# </small></td>
                            <td nowrap align="left"><small>#CUSTOMER_SALES_ORDER# </small></td>
                        
                            <td nowrap align="left"><small>#INT_SALES_ORDER#</small></td>
                            <td nowrap align="left"><small>#ORDER_DATE#</small></td>
                            <td nowrap align="left"><small>#ASSAY_ORDER_DATE#</small></td>
                            <td nowrap align="left"><small>#SAP_DELIVERY_DATE#</small></td>
                            <td nowrap align="left"><small>#DATE_OIF_RECEIVED#</small></td>
                            <td nowrap align="left"><small>#CUSTOMER# </small></td>
                            <td nowrap align="left"><small>#SHIP_TO_REGION#</small></td>
                            <td nowrap align="left"><small>#DATE_ASSAYS_RECEIVED#</small></td>
                            <td nowrap align="left"><small>#BEST_CASE_SCENERIO#</small></td>
                            <td nowrap align="left"><small>#QS_OR_NT#</small></td>
                            <td nowrap align="left"><small>#PRE_AMP#</small></td>
                            <td nowrap align="left"><small>#PREMIUM_TAT#</small></td>
                            <td nowrap align="left"><small>#TARGET_SHIP_DATE# </small></td>
                            <td nowrap align="left"><small>#REVISED_TARGET_SHIP_DATE#</small></td>
                            <td nowrap align="left"><small>#COMMENTS#</small></td>
                            <td nowrap align="left"><small>#PARTIAL#</small></td>
                            <td nowrap align="left"><small>#COMPLETION_DATE#</small></td>
                            <td nowrap align="left"><small>#KPQC#</small></td>
                            <td nowrap align="left"><small>#CUSTOM_CUSTOM#</small></td>
                            <td nowrap align="left"><small>#EXPEDITE#</small></td>
                            <td nowrap align="left"><small>#STOP_POINT_EXIST#</small></td>
                            <td nowrap align="left"><small>#E1_SO#</small></td>
                            <td nowrap align="left"><small>#TEMPLATE_TYPE#</small></td>
                            <td nowrap align="left"><small>#SOURCE#</small></td>
                            <td nowrap align="left"><small>#PART_NUMBER#</small></td>
                            
                       </tr>
                  </cfoutput>
             </tbody>
        </table>
    

  
<cfif is_ie8 eq TRUE>
 <script type="text/javascript">
  	 
	$('#mydataTable').dataTable( {
        "order": [[ 2, "desc" ]],
		"pageLength": 50
    } ); 
	 
  
</script>  
<cfelse>
	  <script type="text/javascript">
                  $('#mydataTable').dataTable( {
                    "order": [[ 11, "desc" ]],
                    "pageLength": 50,fixedColumns:true, fixedHeader:true,"sScrollY": "420px","sScrollX":"100%","sScrollXInner": "150%","bScrollCollapse": true
                } ); 
       </script> 
 
</cfif>
<cfajaximport tags="cfwindow,cfform">

 <script>
        function cleanup() {
            ColdFusion.Window.destroy('myeditor',true);
                }
        
        function showWin(id) {
                    //do we have one?
                    try {
                    ColdFusion.Window.destroy('myeditor',true);
                    } catch(e) { }
                    
                    ColdFusion.Window.create('myeditor','Edit Production Order', 'pps_editor.cfm?id='+id, {x:100,y:100,height:600,width:800,modal:true,closable:true, 
                            draggable:true,resizable:true,center:true, 
                            minheight:200,minwidth:200}
                    );
                    ColdFusion.Window.onHide('myeditor',cleanup);
                    }
                    
                    
        function showWin2() {
                    //do we have one?
                    try {
                    ColdFusion.Window.destroy('myeditor',true);
                    } catch(e) { }
                    
                    ColdFusion.Window.create('myeditor','Add Workbook Order', 'pps_addrecord.cfm', {x:100,y:100,height:600,width:800,modal:true,closable:true, 
                            draggable:true,resizable:true,center:true, 
                            minheight:200,minwidth:200}
                    );
                    ColdFusion.Window.onHide('myeditor',cleanup);
                    }			
                    
        </script>
         
</body>
</html>

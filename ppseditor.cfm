
 <cfparam name="ppssrecord" default="">
<cfparam name="deleteme" default="NO">   <!--- need to set default values for checkboxes cuz if they're not checked nothing comes over---->
<cfparam name="stoppointexist" default="NO">
<cfparam name="kpqc" default="NO">
<cfparam name="customcustom" default="NO">
<cfparam name="expedite" default="NO">
<cfparam name="preamp" default="NO">
<cfparam name="premiumtat" default="NO">

<cfif deleteme eq 'YES' and source eq "WORKBOOK">
                 <cfquery datasource="GOA" name="mydelete">
                     DELETE from txt_rpt_ppss where prod_ord_no= '#prodordno#'  and SOURCE='WORKBOOK'
                 </cfquery>
</cfif>                

 <cfquery datasource="GOA" name="ppss_exists">
   SELECT prod_ord_no from txt_rpt_ppss where prod_ord_no= '#prodordno#'   
 </cfquery>
 <cfif ppss_exists.recordcount GT 0>
 	<cfset ppssrecord=ppss_exists.prod_ord_no>
  </cfif>


 <cfif source eq 'GOAST' and ppssrecord eq "">
       	 <cfinclude template="ppsaddrecord.cfm"> 
        <cfelse>
			
                         <cfquery datasource="GOA" name="myupdate">
                            UPDATE txt_rpt_ppss
                            SET 
                            source ='#source#',
                            prod_ord_no ='#prodordno#',
                            num_10pack ='#num10pack#',
                            type ='#type#',
                            assay_source ='#assaysource#',
                            format ='#format#',
                            product ='#product#',   
                            BTPN ='#BTPN#',
                            study_name ='#studyname#',
                            Account ='#account#', 
                            species ='#species#',
                            Customer_sales_order ='#customersalesorder#',
                         
                            part_number= '#partnumber#',
                            int_sales_order = '#intsalesorder#',
                            Order_date =<cfif orderdate NEQ ''>To_Date('#DateFormat(CreateODBCDATE(orderdate),'yyyy-mm-dd')#','YYYY-MM-DD') <cfelse> NULL</cfif>,
                            Assay_Order_date =<cfif assayorderdate NEQ ''>To_Date('#DateFormat(CreateODBCDATE(assayorderdate),'yyyy-mm-dd')#','YYYY-MM-DD') <cfelse> NULL</cfif>,
                            sap_delivery_date =<cfif sapdeliverydate NEQ ''>To_Date('#DateFormat(CreateODBCDATE(sapdeliverydate),'yyyy-mm-dd')#','YYYY-MM-DD') <cfelse> NULL</cfif>,
                            Date_assays_Received =<cfif dateassaysreceived NEQ ''>To_Date('#DateFormat(CreateODBCDATE(dateassaysreceived),'yyyy-mm-dd')#','YYYY-MM-DD') <cfelse> NULL</cfif>,
                            pre_amp='#preamp#',
                            premium_tat='#premiumtat#',
                            target_ship_date= <cfif targetshipdate NEQ ''>To_Date('#DateFormat(CreateODBCDATE(targetshipdate),'yyyy-mm-dd')#','YYYY-MM-DD') <cfelse> NULL</cfif>,
                            revised_target_ship_date=    <cfif revisedtargetshipdate NEQ ''>To_Date('#DateFormat(CreateODBCDATE(revisedtargetshipdate),'yyyy-mm-dd')#','YYYY-MM-DD')<cfelse> NULL</cfif>,
                            e1_so='#e1so#',
                            best_case_scenerio=   <cfif bestcasescenerio NEQ ''>To_Date('#DateFormat(CreateODBCDATE(bestcasescenerio),'yyyy-mm-dd')#','YYYY-MM-DD')<cfelse> NULL</cfif>,       
                            qs_or_nt='#qsornt#',
                        
                            comments='#comments#',
                            stop_point_exist = '#stoppointexist#',
                            kpqc='#kpqc#',
                            custom_custom ='#customcustom#',
                            expedite='#expedite#',
                            ship_to_region='#shiptoregion#',
                            template_type='#templatetype#',
                            partial='#partial#'  
                          
                            where prod_ord_no= '#id#'  
                 
                        </cfquery>
                 
        </cfif> 
 
		<script language="javascript">
        window.location.href="index.cfm";
        </script>




 
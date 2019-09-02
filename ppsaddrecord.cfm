
<cfparam name="stoppointexist" default="NO">
<cfparam name="kpqc" default="NO">
<cfparam name="customcustom" default="NO">
<cfparam name="expedite" default="NO">
<cfparam name="completiondate" default="NO">
<cfparam name="preamp" default="NO">
<cfparam name="premiumtat" default="NO">

 <cfquery datasource="GOA" name="ppss_exists">
   SELECT prod_ord_no from txt_rpt_ppss where prod_ord_no= '#prodordno#'  and source='WORKBOOK' 
 </cfquery>
  
 
 
 <cfif ppss_exists.recordcount GT 0  >
 
 <h2>Production Order: <cfoutput>#prodordno#</cfoutput> already exists! </h2> 
 <cfset thread = CreateObject("java", "java.lang.Thread")>
 
<cfset thread.sleep(5000)>
<cfelse>


 <cfparam name="stoppointexist" default="0">
     <cfquery datasource="GOA" name="myaddrecord">
            INSERT INTO txt_rpt_ppss(
            
            source,
            prod_ord_no,
            num_10pack,
            type,
            assay_source,
            format,
            product,   
            BTPN ,
            study_name ,
            Account, 
            species,
            Customer_sales_order,
         
            part_number,
            int_sales_order ,
            Order_date ,
            Assay_Order_date ,
            sap_delivery_date,
            Date_assays_Received,
            pre_amp,
            premium_tat,
            target_ship_date,
            revised_target_ship_date,
            e1_so,
            best_case_scenerio ,       
            qs_or_nt ,
            comments,
          
            stop_point_exist ,
            kpqc,
            custom_custom,
            expedite,
            template_type,
            completion_date,
            ship_to_region,
            partial
             )
            VALUES(
            '#source#',
            '#prodordno#',
            '#num10pack#',
            '#type#',
            '#assaysource#',
            '#format#',
            '#product#',   
            '#BTPN#',
            '#studyname#',
            '#account#', 
            '#species#',
            '#customersalesorder#',
         
            '#partnumber#',
           '#intsalesorder#',
             <cfif orderdate NEQ ''>To_Date('#DateFormat(CreateODBCDATE(orderdate),'yyyy-mm-dd')#','YYYY-MM-DD') <cfelse> NULL</cfif>,
            <cfif assayorderdate NEQ ''>To_Date('#DateFormat(CreateODBCDATE(assayorderdate),'yyyy-mm-dd')#','YYYY-MM-DD') <cfelse> NULL</cfif>,
             <cfif sapdeliverydate NEQ ''>To_Date('#DateFormat(CreateODBCDATE(sapdeliverydate),'yyyy-mm-dd')#','YYYY-MM-DD') <cfelse> NULL</cfif>,
            <cfif dateassaysreceived NEQ ''>To_Date('#DateFormat(CreateODBCDATE(dateassaysreceived),'yyyy-mm-dd')#','YYYY-MM-DD') <cfelse> NULL</cfif>,
            '#preamp#',
             '#premiumtat#',
            <cfif targetshipdate NEQ ''>To_Date('#DateFormat(CreateODBCDATE(targetshipdate),'yyyy-mm-dd')#','YYYY-MM-DD') <cfelse> NULL</cfif>,
             <cfif revisedtargetshipdate NEQ ''>To_Date('#DateFormat(CreateODBCDATE(revisedtargetshipdate),'yyyy-mm-dd')#','YYYY-MM-DD')<cfelse> NULL</cfif>,
            '#e1so#',
            <cfif bestcasescenerio NEQ ''>To_Date('#DateFormat(CreateODBCDATE(bestcasescenerio),'yyyy-mm-dd')#','YYYY-MM-DD')<cfelse> NULL</cfif>,       
            '#qsornt#',
            '#comments#',
          
            '#stoppointexist#',
            '#kpqc#',
            '#customcustom#',
            '#expedite#',
            '#templatetype#',
             <cfif completiondate NEQ ''>To_Date('#DateFormat(CreateODBCDATE(completiondate),'yyyy-mm-dd')#','YYYY-MM-DD')<cfelse> NULL</cfif>,
             '#shiptoregion#',       
             '#partial#' 
            
            )
         
 
		</cfquery>
 </cfif>
<script language="javascript">
window.location.href="index.cfm";
</script>



 
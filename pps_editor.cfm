<style>
input[readonly]
{
    background-color:lightgray;
}
</style> 
<cfinclude template ="queryinc.cfm">
<cfform action="ppseditor.cfm" name="myeditorform"  target="_parent" >
   		  <cfoutput>
              
           
          
             <input type="hidden" name="id"value="#id#">
           
          <table border=1 width="99%" bgcolor="FFFFFF">
               <tr>
                    <td nowrap><small><b>PROD_ORD_NO<b></small></td>
                    <td nowrap> <input ="text" style="width:200"  name="prodordno" size="40"value="#getorders.prod_ord_no#"  <cfif getorders.source eq 'GOAST'>readonly="readonly"</cfif></td>
                    <td nowrap><small><b>NUM 10 PACK</b></small></td>
                    <td nowrap><input ="text" style="width:200"  name="num10pack" size="40"value="#getorders.num_10pack#"  <cfif getorders.source eq 'GOAST'>readonly="readonly"</cfif>></td>
               </tr>
                 <tr>
                    <td nowrap><small><b>SOURCE<b></small></td>
                    <td nowrap> <input ="text" style="width:200"  name="source" size="40"value="#getorders.source#"  <cfif getorders.source eq 'GOAST'>readonly="readonly"</cfif>></td>
                    <td nowrap><small><b>ASSAY SOURCE</b></small></td>
                    <td nowrap><input ="text" style="width:200"  name="assaysource" size="40"value="#getorders.assay_source#"  <cfif getorders.source eq 'GOAST'>readonly="readonly"</cfif>></td>
               </tr>
               
               
               <tr>
                    <td nowrap><small><b>ACCOUNT<b></small></td>
                    <td colspan="3"><input ="text" style="width:390"  name="account" size="80"value="#getorders.account#"  <cfif getorders.source eq 'GOAST'>readonly="readonly"</cfif>></td>
               </tr>
               <tr>
                    <td nowrap><small><b>STUDY NAME<b></small></td>
                    <td colspan="3"><input ="text" style="width:390"  name="studyname" size="40"value="#getorders.study_name#"  <cfif getorders.source eq 'GOAST'>readonly="readonly"</cfif>> </td>
               </tr>
               <tr>
                    <td nowrap><small><b>BTPN</b></small></td>
                    <td nowrap> <input ="text" style="width:200"  name="btpn" size="40"value="#getorders.btpn#"  <cfif getorders.source eq 'GOAST'>readonly="readonly"</cfif>></td>
                    <td nowrap><small><b>ASSAYS RECEIVED</b></small></td>
                    <td>&nbsp;</td>
               </tr>
               <tr>
                    <td nowrap><small><b>FORMAT<b></small></td>
                    <td nowrap> <input ="text" style="width:200"  name="format" size="40"value="#getorders.format#"  <cfif getorders.source eq 'GOAST'>readonly="readonly"</cfif>></td>
                    <td nowrap><small><b>PRODUCT</b></small></td>
                    <td nowrap><input ="text" style="width:200"  name="product" size="40"value="#getorders.product#" <cfif getorders.source eq 'GOAST'>readonly="readonly"</cfif>></td>
                    
        
               </tr>
               <tr>
                    <td nowrap><small><b>CUSTOMER SALES ORDER<b></small></td>
                    <td nowrap><input ="text" style="width:200"  name="customersalesorder" size="40"value="#getorders.customer_sales_order#" <cfif getorders.source eq 'GOAST'>readonly="readonly"</cfif>></td>
                    <td nowrap><small><b>COMPLETION DATE</b></small></td>
                    <td nowrap> <cfinput type="dateField" name="completiondate"  label="Start date"  width="100"value="#DateFormat(getorders.completion_date,'yyyy-mm-dd')#"  readonly="readonly" ></td>
               </tr>
            
               <cfif getorders.source eq 'GOAST'>
               <tr>
                    <td nowrap><small><b>ORDER DATE<b></small></td>
                    <td nowrap><small><cfinput type="dateField" name="orderdate"  label="Start date"  width="100"value="#DateFormat(getorders.order_date,'yyyy-mm-dd')#"  readonly="readonly"  ></small></td>
                    <td nowrap><small><b>ASSAY ORDER DATE</b></small></td>
                    <td nowrap><small><cfinput type="dateField" name="assayorderdate"  label="Start date"  width="100"value="#DateFormat(getorders.assay_order_date,'yyyy-mm-dd')#"  readonly="readonly" ></small></td>
               </tr>
                 <tr>
                    <td nowrap><small><b>SAP DELIVERY DATE<b></small></td>
                    <td nowrap><small><cfinput type="dateField" name="sapdeliverydate"  label="Start date"  width="100"value="#DateFormat(getorders.sap_delivery_date,'yyyy-mm-dd')#"  readonly="readonly" ></small></td>
                    <td nowrap><small><b>DATE ASSAYS RECEIVED<b></small></td>
                    <td nowrap><small><cfinput type="dateField" name="dateassaysreceived"  label="Start date"  width="100"value="#DateFormat(getorders.date_assays_received,'yyyy-mm-dd')#"  readonly="readonly" ></small></td>
                     
               </tr>
               <cfelse>
                 <tr>
                    <td nowrap><small><b>ORDER DATE<b></small></td>
                    <td nowrap><small><cfinput type="dateField" name="orderdate"  label="Start date"  width="100"value="#DateFormat(getorders.order_date,'yyyy-mm-dd')#"   ></small></td>
                    <td nowrap><small><b>ASSAY ORDER DATE</b></small></td>
                    <td nowrap><small><cfinput type="dateField" name="assayorderdate"  label="Start date"  width="100"value="#DateFormat(getorders.assay_order_date,'yyyy-mm-dd')#"   ></small></td>
               </tr>
                 <tr>
                    <td nowrap><small><b>SAP DELIVERY DATE<b></small></td>
                    <td nowrap><small><cfinput type="dateField" name="sapdeliverydate"  label="Start date"  width="100"value="#DateFormat(getorders.sap_delivery_date,'yyyy-mm-dd')#"  ></small></td>
                    <td nowrap><small><b>DATE ASSAYS RECEIVED<b></small></td>
                    <td nowrap><small><cfinput type="dateField" name="dateassaysreceived"  label="Start date"  width="100"value="#DateFormat(getorders.date_assays_received,'yyyy-mm-dd')#"   ></small></td>
                     
               </tr>
               
               
               </cfif>
               
               
               
               <tr>
                    <td nowrap><small><b>INT SALES ORDER</b></small></td>
                    <td nowrap><input ="text" style="width:200"  name="intsalesorder" size="40"value="#getorders.int_sales_order#"  <cfif getorders.source eq 'GOAST'>readonly="readonly"</cfif>></td>
                    <td nowrap><small><b>TYPE</b></small></td>
                    <td nowrap><input ="text" style="width:200"  name="type" size="40"value="#getorders.type#"  <cfif getorders.source eq 'GOAST'>readonly="readonly"</cfif>></td>
               </tr>
                 <tr>
                    <td nowrap><small><b>SPECIES<b></small></td>
                    <td nowrap><input ="text" style="width:200"  name="species" size="40"value="#getorders.species#"  <cfif getorders.source eq 'GOAST'>readonly="readonly"</cfif>></td>
                   
                     <td nowrap><small><b>QS or NT</b></small></td>
                    <td nowrap><input ="text" style="width:200"  name="qsornt" size="40"value="#getorders.qs_or_nt#"></td>  
                  
               </tr>
            
              
           
                  <tr>
                    <td nowrap><small><b>PARTIAL (QTY and DATE)</b></small></td>
                    <td nowrap colspan="3"><input ="text" style="width:500"  name="partial" size="90"value="#getorders.partial#" </td>
                     
               </tr>
               
               
               
               <cfif getorders.source eq 'GOAST'>
                       <tr>
                            <td nowrap><small><b>BEST CASE SCENARIO</b></small></td>
                            <td nowrap><cfinput type="dateField" name="bestcasescenerio"  label="Start date"  width="100"value="#DateFormat(getorders.best_case_scenerio,'yyyy-mm-dd')#" readonly="readonly" ></td>
                            <td nowrap><small><b>PART NUMBER</b></small></td>
                            <td nowrap><input ="text" style="width:200"  name="partnumber" size="40"value="#getorders.part_number#"   readonly="readonly" </td>
                       </tr>
                       <tr>
                            <td nowrap><small><b>TARGET SHIP DATE</b></small></td>
                            <td nowrap><cfinput type="dateField" name="targetshipdate"  label="Start date"  width="100"value="#DateFormat(getorders.target_ship_date,'yyyy-mm-dd')#"   ></td>
                            <td nowrap><small><b>REVISED TARGET SHIP DATE</b></small></td>
                            <td nowrap><cfinput type="dateField" name="revisedtargetshipdate"  label="Start date"  width="100"value="#DateFormat(getorders.target_ship_date,'yyyy-mm-dd')#"   ></td>
                           
                       </tr>
               <cfelse>
                        <tr>
                            <td nowrap><small><b>BEST CASE SCENARIO</b></small></td>
                            <td nowrap><cfinput type="dateField" name="bestcasescenerio"  label="Start date"  width="100"value="#DateFormat(getorders.best_case_scenerio,'yyyy-mm-dd')#" ></td>
                            <td nowrap><small><b>PART NUMBER</b></small></td>
                            <td nowrap><input ="text" style="width:200"  name="partnumber" size="40"value="#getorders.part_number#"   ></td>
                       </tr>
                       <tr>
                            <td nowrap><small><b>TARGET SHIP DATE</b></small></td>
                            <td nowrap><cfinput type="dateField" name="targetshipdate"  label="Start date"  width="100"value="#DateFormat(getorders.target_ship_date,'yyyy-mm-dd')#"  ></td>
                            <td nowrap><small><b>REVISED TARGET SHIP DATE</b></small></td>
                            <td nowrap><cfinput type="dateField" name="revisedtargetshipdate"  label="Start date"  width="100"value="#DateFormat(getorders.target_ship_date,'yyyy-mm-dd')#"  ></td>
                           
                       </tr>
                       
               
               </cfif>
               
               <tr>
                    <td nowrap><small><b>SHIP TO REGION</b></small></td>
                    <td nowrap><input ="text" style="width:200"  name="shiptoregion" size="40"value="#getorders.ship_to_region#"></td>
                    <td nowrap><small><b>E1 SO</b></small></td>
                    <td nowrap><input ="text" style="width:200"  name="e1so" size="40"value="#getorders.e1_so#"></td>
               </tr>
               <tr>
                    <td nowrap><small><b>COMMENTS</b></small></td>
                    <td nowrap colspan="3"><textarea  name="comments" size="250" rows ="2"  style="width:590">#getorders.comments#</textarea></td>
               </tr>
               
                <tr>
                            <td nowrap><small><b>EXPEDITE</b></small></td>
                            <td nowrap> <input type="checkbox"  value="YES" name="expedite" <cfif ucase(getorders.expedite) eq 'YES'> checked </cfif> ></td>
                            <td nowrap><small><b>TEMPLATE TYPE</b></small></td>
                            <td nowrap> <input ="text" style="width:200"  name="templatetype" size="40"value="#getorders.template_type#"></td>
                           
               </tr>
               
                <tr>
                            <td nowrap><small><b>KPQC</b></small></td>
                            <td nowrap> <input type="checkbox"  value="YES" name="kpqc" <cfif  ucase(getorders.kpqc) eq 'YES'> checked </cfif> ></td>
                            <td nowrap><small><b>CUSTOM CUSTOM</b></small></td>
                            <td nowrap> <input type="checkbox"  value="YES" name="customcustom" <cfif ucase(getorders.custom_custom) eq 'YES'> checked </cfif>   ></td>
                           
               </tr>
               
               
                <tr>
                    <td nowrap><small><b>PRE AMP</b></small></td>
                    <td nowrap> <input type="checkbox"  value="YES" name="preamp" <cfif getorders.pre_amp eq 'YES'>checked</cfif> /></td>
                    <td nowrap><small><b>PREMIUM TAT</b></small></td>
                    <td nowrap><input type="checkbox"  value="YES" name="premiumtat"  <cfif getorders.premium_tat eq 'YES'>checked</cfif>  /></td>
               </tr>
                   
               <cfif getorders.source NEQ 'GOAST'>
                 <tr>
                    <td nowrap><small><b>DELETE</b></small></td>
                    <td nowrap><input type="checkbox" name="deleteme"  value='TRUE'/></td>
                    <td nowrap><small><b>STOP POINT EXIST</b></small></td>
                    <td nowrap><input type="checkbox" name="stoppointexist"  value='Yes'  <cfif ucase(getorders.stop_point_exist) eq "YES"> checked </cfif> /></td>
               </tr>
               <cfelse>
                   <tr>
                    <input type="hidden" name="deleteme" value="FALSE" />
                    <td nowrap><small><b>DELETE</b></small></td>
                    <td nowrap><input type="checkbox"   value='FALSE' disabled/></td>
                    <td nowrap><small><b>STOP POINT EXIST</b></small></td>
                    <td nowrap><input type="checkbox"  value='yes' readonly="readonly" <cfif ucase(getorders.stop_point_exist) eq "YES"> checked </cfif> disabled /></td>
               </tr>
               <input type="hidden" name="stoppointexist" value='#getorders.stop_point_exist#'>
               </cfif>
          </table>
          <input type="submit" value="submit" name="submit">
     </cfoutput>
</cfform>

 
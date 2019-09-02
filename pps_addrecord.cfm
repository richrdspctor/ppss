 
 
<cfform action="ppsaddrecord.cfm" name="myaddform"  target="_parent" >
   		  
       
           
          <table border=1 width="99%" bgcolor="FFFFFF">
               <tr>
                    <td nowrap><small><b>PROD_ORD_NO<b></small></td>
                    <td nowrap> <cfinput type ="text" style="width:200"  name="prodordno" size="40" required="yes" message="Production Order Number Required" ></td>
                    <td nowrap><small><b>NUM 10 PACK</b></small></td>
                    <td nowrap><input ="text" style="width:200"  name="num10pack" size="40"  ></td>
               </tr>
                 <tr>
                    <td nowrap><small><b>SOURCE<b></small></td>
                    <td nowrap> <input ="text" style="width:200"  name="source" size="40" value="WORKBOOK" readonly></td>
                    <td nowrap><small><b>ASSAY SOURCE</b></small></td>
                    <td nowrap><input ="text" style="width:200"  name="assaysource" size="40"  ></td>
               </tr>
               
               
               <tr>
                    <td nowrap><small><b>ACCOUNT<b></small></td>
                    <td colspan="3"><cfinput type ="text" style="width:390"  name="account" size="80"  required="yes" message="Account is Required"   ></td>
               </tr>
               <tr>
                    <td nowrap><small><b>STUDY NAME<b></small></td>
                    <td colspan="3"><cfinput type="text" style="width:390"  name="studyname" size="40"  required="yes" message="Study Name Required"  > </td>
               </tr>
               <tr>
                    <td nowrap><small><b>BTPN</b></small></td>
                    <td nowrap> <input ="text" style="width:200"  name="btpn" size="40"  ></td>
                    <td nowrap><small><b>ASSAYS RECEIVED</b></small></td>
                    <td>&nbsp;</td>
               </tr>
               <tr>
                    <td nowrap><small><b>FORMAT<b></small></td>
                    <td nowrap> <input ="text" style="width:200"  name="format" size="40"  ></td>
                    <td nowrap><small><b>PRODUCT</b></small></td>
                    <td nowrap><input ="text" style="width:200"  name="product" size="40"  ></td>
                    
        
            
               
               
               <tr>
                    <td nowrap><small><b>CUSTOMER SALES ORDER<b></small></td>
                    <td nowrap colspan="3"><input ="text" style="width:200"  name="customersalesorder" size="40"  ></td>
                     
               </tr>
            
               <tr>
                    <td nowrap><small><b>ORDER DATE<b></small></td>
                    <td nowrap><small><cfinput type="dateField" name="orderdate"  label="Start date"  width="100"  value="#NOW()#"></small></td>
                    <td nowrap><small><b>ASSAY ORDER DATE</b></small></td>
                    <td nowrap><small><cfinput type="dateField" name="assayorderdate"  label="Start date"  width="100"  ></small></td>
               </tr>
                 <tr>
                    <td nowrap><small><b>SAP DELIVERY DATE<b></small></td>
                    <td nowrap><small><cfinput type="dateField" name="sapdeliverydate"  label="Start date"  width="100"  ></small></td>
                    <td nowrap><small><b>DATE ASSAYS RECEIVED<b></small></td>
                    <td nowrap><small><cfinput type="dateField" name="dateassaysreceived"  label="Start date"  width="100"  ></small></td>
                     
               </tr>
               
               
               <tr>
                    <td nowrap><small><b>INT SALES ORDER</b></small></td>
                    <td nowrap><input ="text" style="width:200"  name="intsalesorder" size="40" ></td>
                    <td nowrap><small><b>TYPE</b></small></td>
                    <td nowrap><input ="text" style="width:200"  name="type" size="40"  ></td>
               </tr>
                 <tr>
                    <td nowrap><small><b>SPECIES<b></small></td>
                    <td nowrap><input ="text" style="width:200"  name="species" size="40" ></td>
                   
                     <td nowrap><small><b>QS or NT</b></small></td>
                    <td nowrap><input ="text" style="width:200"  name="qsornt" size="40"  ></td>  
                  
               </tr>
            
           
               </tr>
                   <tr>
                    <td nowrap><small><b>PARTIAL (QTY and DATE)</b></small></td>
                    <td nowrap colspan="3"><input ="text" style="width:500"  name="partial" size="90" />   </td>
                     
               </tr>
               <tr>
                    <td nowrap><small><b>BEST CASE SCENARIO</b></small></td>
                    <td nowrap><cfinput type="dateField" name="bestcasescenerio"  label="Start date"  width="100"  ></td>
                    <td nowrap><small><b>PART NUMBER</b></small></td>
                    <td nowrap><input ="text" style="width:200"  name="partnumber" size="40"  ></td>
               </tr>
               <tr>
                    <td nowrap><small><b>TARGET SHIP DATE</b></small></td>
                    <td nowrap><cfinput type="dateField" name="targetshipdate"  label="Start date"  width="100"  ></td>
                    <td nowrap><small><b>REVISED TARGET SHIP DATE</b></small></td>
                    <td nowrap><cfinput type="dateField" name="revisedtargetshipdate"  label="Start date"  width="100"  ></td>
                   
               </tr>
               <tr>
                    <td nowrap><small><b>SHIP TO REGION</b></small></td>
                    <td nowrap><input ="text" style="width:200"  name="shiptoregion" size="40" ></td>
                    <td nowrap><small><b>E1 SO</b></small></td>
                    <td nowrap><input ="text" style="width:200"  name="e1so" size="40"  ></td>
               </tr>
               <tr>
                    <td nowrap><small><b>COMMENTS</b></small></td>
                    <td nowrap colspan="3"><textarea  name="comments" size="250" rows ="3"  style="width:590"> </textarea></td>
               </tr>
                  <tr>
                            <td nowrap><small><b>EXPEDITE</b></small></td>
                            <td nowrap> <input type="checkbox"  value="YES" name="expedite"   ></td>
                            <td nowrap><small><b>TEMPLATE TYPE</b></small></td>
                            <td nowrap> <input ="text" style="width:200"  name="templatetype" size="40"  ></td>
                           
               </tr>
               
                <tr>
                            <td nowrap><small><b>KPQC</b></small></td>
                            <td nowrap> <input type="checkbox"  value="YES" name="kpqc"  ></td>
                            <td nowrap><small><b>CUSTOM CUSTOM</b></small></td>
                            <td nowrap> <input type="checkbox"  value="YES" name="customcustom"    ></td>
                           
               </tr>
               <tr>
                    <td nowrap><small><b>PRE AMP</b></small></td>
                    <td nowrap> <input type="checkbox"  value="YES" name="preamp"  /></td>
                    <td nowrap><small><b>PREMIUM TAT</b></small></td>
                    <td nowrap><input type="checkbox"  value="YES" name="premiumtat" /></td>
               </tr>
               
                 <tr>
                    <td nowrap><small><b>STOP POINT EXIST</b></small></td>
                    <td nowrap colspan="3"><input type="checkbox" name="stoppointexist" value="yes" /></td>
               </tr>
               
          </table>
          <input type="submit" value="submit" name="submit">
      
</cfform>

 
<cfparam name ="id" default=0>
 
  
<cfquery name="getorders" datasource="GOA">
 select 
  prod_ord_no,
  num_10pack,
  type,
  assay_source,
  format,
  product,   
  BTPN,
  study_name,
  Account, 
  species,
  Customer_sales_order,
   int_sales_order,
  Trunc(Order_date) as order_date,
  Trunc(Assay_Order_date) as assay_order_date,
  Trunc(sap_delivery_date) as sap_delivery_date,
  Trunc(Date_OIF_Received) as date_oif_received,
  customer,
  ship_to_region,
  Trunc(Date_assays_Received) as Date_assays_received,
  Trunc(Best_case_Scenerio) as Best_case_Scenerio,
  QS_OR_NT, 
  pre_amp,
  premium_tat,
  Trunc(TARGET_SHIP_DATE) as Target_Ship_date,
  Trunc(REVISED_TARGET_SHIP_DATE) as Revised_Target_Ship_Date,
  comments,
  partial,
  Trunc(COMPLETION_DATE) as Completion_Date,
  kpqc,
  custom_custom,
  expedite,
  STOP_POINT_EXIST,
  e1_so,
  template_type,
 'WORKBOOK' as source,
  PART_NUMBER 
--,array_singlepacked,
--array_10PACKED,
--array_pending_packaging,
--ARRAY_PENDING_QC,
 
from txt_rpt_ppss
WHERE SOURCE ='WORKBOOK'
<cfif id eq "0">
 and  order_date >=
<cfqueryparam  
                value="#mystartdate#"  
               cfsqltype="cf_sql_date" >  
               
and order_date <=  
 <cfqueryparam  
                value="#myenddate#"  
               cfsqltype="cf_sql_date" >
               
<cfelse>
AND prod_ord_no = '#id#'

</cfif>               
UNION ALL
 select 
DISTINCT
 a.prod_ord_no,
a.quantity as  num_10pack,
c.product_type as type,
'Pleasanton' as assay_source,
 (select max(attr_text) from cat_products_hdr ,cat_products_dtls where cat_products_hdr.prod_id=cat_products_dtls.prod_id and cat_products_hdr.part_no=a.part_no  and (cat_products_dtls.attr_name='FORMAT' ) ) format,
DECODE((select max(attr_text)  from cat_products_hdr , cat_products_dtls where  cat_products_hdr.prod_id=cat_products_dtls.prod_id and cat_products_hdr.part_no=a.part_no  and (cat_products_dtls.attr_name='PRODUCT' ) ),'SNP','SNP','GEx') product,   
(select max(attr_text) from cat_products_hdr ,cat_products_dtls where cat_products_hdr.prod_id=cat_products_dtls.prod_id and cat_products_hdr.part_no=a.part_no  and (cat_products_dtls.attr_name='BTPN' ) ) BTPN,
a.study_name,
a.company_name as Account, 
a.species,
a.sales_order as Customer_sales_order,
 
--a.part_no as part_number,
o.int_sales_order,
TRUNC(a.create_dt) as Order_date,
TRUNC(o.int_date) as Assay_Order_date,
TRUNC(a.create_dt+42) as sap_delivery_date,
(select max(TRUNC(end_dt))  from txt_prod_run_instances where run_id=r.run_id and step_id IN   (3300,1300)  ) as Date_OIF_Received,
a.company_Name as customer,
p.ship_to_region,
(select max(TRUNC(end_dt))  from txt_prod_run_instances where run_id=r.run_id and step_id IN   (3300,1300)  ) as Date_assays_Received,
NVL2(p.best_case_scenerio,p.best_case_scenerio,NVL2((select max(end_dt)  from txt_prod_run_instances where run_id=r.run_id and step_id IN   (3300,1300)  ), (select max(end_dt)+14  from txt_prod_run_instances where run_id=r.run_id and step_id IN   (3300,1300)  ), NULL)) as Best_case_Scenerio,
decode(NVL2(p.qs_or_nt,p.qs_or_nt,substr(c.desc_main,1,2)),'QS','QS','NT','NT','Qu','QS','') as QS_OR_NT, 
p.pre_amp,
p.premium_tat,
TRUNC(p.target_ship_date) as TARGET_SHIP_DATE,
TRUNC(p.revised_target_ship_date) as REVISED_TARGET_SHIP_DATE,
 p.comments,
p.partial as partial,
(select TRUNC(max(end_dt))  from txt_prod_run_instances where run_id=r.run_id and step_id IN   (2080,4080)  ) as COMPLETION_DATE,

p.kpqc,
p.custom_custom,
p.expedite,
NVL2(p.stop_point_exist,p.stop_point_exist,a.stop_point_exist) as STOP_POINT_EXIST,
p.e1_so,
p.template_type,
'GOAST' as source,
a.part_no as PART_NUMBER

--,(select count(*) from txt_run_materials where run_id=r.run_id and oa_status=1 and verified_array=1 and verified_array_lbl=1) as array_singlepacked,
--(select count(*) from txt_run_materials where run_id=r.run_id and oa_status=1 and verified_array_10pk=1) as array_10PACKED,
--(select count(*) from txt_run_materials where run_id=r.run_id and oa_status=1 and (verified_array is NULL or verified_array =0)   ) as array_pending_packaging,
--(Select count(aa.barcode) as totalqc from txt_run_materials aa left join txt_run_materials bb on aa.oa_sheet=bb.barcode where aa.run_id= r.run_id  and aa.oa_status=1 and aa.mat_id=16 and bb.mat_id=17 and (upper(bb.status) ='IMAGING PASS'  or  upper(bb.status) ='QC') ) as ARRAY_PENDING_QC,



from txt_prod_order a 
left join txt_prod_runs b on a.prod_ord_no=b.prod_ord_no
left join cat_products_hdr c on a.part_no=c.part_no
left join cat_config_hdr d on a.part_no=d.part_no
left join txt_prod_int_order o  on a.prod_ord_no=o.prod_ord_no
left join txt_prod_runs r on a.prod_ord_no=r.prod_ord_no
left join txt_rpt_ppss p on a.prod_ord_no=p.prod_ord_no

WHERE

 (select max(attr_text)  from cat_products_hdr , cat_products_dtls where 
 cat_products_hdr.prod_id=cat_products_dtls.prod_id and cat_products_hdr.part_no=a.part_no  and (cat_products_dtls.attr_name='PLATE_TYPE' ) ) ='OPEN ARRAY'   
   
  

<cfif id eq "0">
 and  a.create_dt >=
<cfqueryparam  
                value="#mystartdate#"  
               cfsqltype="cf_sql_date" >  
               
and a.create_dt <=  
 <cfqueryparam  
                value="#myenddate#"  
               cfsqltype="cf_sql_date" >
               
<cfelse>
AND a.prod_ord_no = '#id#'

</cfif>               
        


              
Order by order_date DESC               
</cfquery>
 
 
 
 
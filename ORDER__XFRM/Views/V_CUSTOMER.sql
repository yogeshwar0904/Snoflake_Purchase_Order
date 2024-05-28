create or replace view ORDER_PROCESS.ORDER__XFRM.V_CUSTOMER(
	CUSTOMER_ID,
	ADDRESS,
	PHONE_NO,
	CATEGORY,
	STATUS,
	TOTAL_ORDERS,
	TOTAL_INVOICE_AMOUNT,
    LOYALTY_POINTS,
	CREATE_DATE,
	CREATE_USER
) as
select 
	customer.CUSTOMER_ID,
	customer.ADDRESS,
	customer.PHONE_NO,
	customer.CATEGORY,
	customer.STATUS,
    COUNT(detail.ORDER_ID) AS TOTAL_ORDERS,
    SUM(detail.TOTAL_AMOUNT) AS TOTAL_INVOICE_AMOUNT,
    SUM(case
    when detail.TOTAL_AMOUNT > 1000  and customer.category = 'Gold' then 100
    when detail.TOTAL_AMOUNT > 1000  and customer.category = 'Silver' then 50
    when detail.TOTAL_AMOUNT > 1000  and customer.category = 'Bronze' then 30
    else 0
    end) as LOYALTY_POINTS,
	customer.CREATE_DATE,
	customer.CREATE_USER
FROM ORDER_PROCESS.ORDER_BASE.T_CUSTOMER customer
left join ORDER_PROCESS.ORDER__XFRM.V_SALES_ORDER_DETAIL detail
on customer.customer_id = detail.customer_id
group by customer.CUSTOMER_ID, customer.ADDRESS, customer.PHONE_NO, customer.CATEGORY, customer.STATUS, customer.LOYALTY_POINTS, customer.CREATE_DATE, customer.CREATE_USER;
create or replace view ORDER_PROCESS.ORDER__XFRM.V_CUSTOMER(
	CUSTOMER_ID,
	ADDRESS,
	PHONE_NO,
	CATEGORY,
	STATUS,
	TOTAL_ORDERS,
	TOTAL_INVOICE_AMOUNT,
	CREATE_DATE,
	CREATE_USER
) as
select * FROM ORDER_PROCESS."ORDER _BASE".T_CUSTOMER;
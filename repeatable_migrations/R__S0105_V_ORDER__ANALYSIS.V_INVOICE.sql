create or replace view ORDER_PROCESS.ORDER__ANALYSIS.V_INVOICE(
	ORDER_ID,
	ORDER_DATE,
	INVOICE_DATE,
	TAX_AMOUNT,
	TOTAL_AMOUNT,
	DISCOUNT,
	FINAL_INVOICE_AMT,
	CUSTOMER_ID,
	CREATE_DATE,
	CREATE_USER
) as
select ORDER_ID,
	ORDER_DATE,
	INVOICE_DATE,
	TAX_AMOUNT,
	TOTAL_AMOUNT,
	DISCOUNT,
	FINAL_INVOICE_AMT,
	CUSTOMER_ID,
	CREATE_DATE,
	CREATE_USER from order_process."ORDER_BASE".T_INVOICE;
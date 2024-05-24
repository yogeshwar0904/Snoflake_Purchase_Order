create or replace view ORDER_PROCESS.ORDER__XFRM.V_SALES_ORDER_HDR(
	ORDER_ID,
	ORDER_DATE,
	STATUS,
	CUSTOMER_ID,
	ITEM_COUNT,
	TOTAL_AMOUNT,
	DISCOUNT,
	CREATE_DATE,
	CREATE_USER
) as
SELECT
    ORDER_ID,
    ORDER_DATE,
    STATUS,
    CUSTOMER_ID,
    ITEM_COUNT,
    TOTAL_AMOUNT,
    DISCOUNT,
    CREATE_DATE,
    CREATE_USER
FROM ORDER_PROCESS."ORDER _BASE".T_SALES_ORDER_HEADER;
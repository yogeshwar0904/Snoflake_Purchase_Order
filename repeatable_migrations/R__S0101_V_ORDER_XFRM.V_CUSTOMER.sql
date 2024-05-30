CREATE OR REPLACE VIEW ORDER_PROCESS."ORDER__XFRM".V_CUSTOMER (
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
) AS
SELECT 
    customer.CUSTOMER_ID,
    customer.ADDRESS,
    customer.PHONE_NO,
    customer.CATEGORY,
    customer.STATUS,
    COUNT(detail.ORDER_ID) AS TOTAL_ORDERS,
    SUM(detail.TOTAL_AMOUNT) AS TOTAL_INVOICE_AMOUNT,
    SUM(
        CASE
            WHEN detail.TOTAL_AMOUNT > 1000 AND customer.CATEGORY = 'Gold' THEN 100
            WHEN detail.TOTAL_AMOUNT > 1000 AND customer.CATEGORY = 'Silver' THEN 50
            WHEN detail.TOTAL_AMOUNT > 1000 AND customer.CATEGORY = 'Bronze' THEN 30
            ELSE 0
        END
    ) AS LOYALTY_POINTS,
    customer.CREATE_DATE,
    customer.CREATE_USER
FROM 
    ORDER_PROCESS.ORDER_BASE.T_CUSTOMER customer
LEFT JOIN 
    ORDER_PROCESS.ORDER__XFRM.V_SALES_ORDER_DETAIL detail
ON 
    customer.CUSTOMER_ID = detail.CUSTOMER_ID
GROUP BY 
    customer.CUSTOMER_ID, 
    customer.ADDRESS, 
    customer.PHONE_NO, 
    customer.CATEGORY, 
    customer.STATUS, 
    customer.CREATE_DATE, 
    customer.CREATE_USER;

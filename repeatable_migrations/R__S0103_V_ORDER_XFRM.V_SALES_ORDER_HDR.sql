CREATE OR REPLACE VIEW ORDER_PROCESS."ORDER__XFRM".V_SALES_ORDER_HDR (
    ORDER_ID,
    ORDER_DATE,
    STATUS,
    CUSTOMER_ID,
    ITEM_COUNT,
    TOTAL_AMOUNT,
    DISCOUNT,
    CREATE_DATE,
    CREATE_USER,
    COUPON_CODE
) AS
SELECT 
    header.ORDER_ID,
    header.ORDER_DATE,
    header.STATUS,
    header.CUSTOMER_ID,
    header.ITEM_COUNT,
    detail.TOTAL_AMOUNT,
    CASE
        WHEN t_customer.CATEGORY = 'Gold' THEN detail.TOTAL_AMOUNT * 0.05
        WHEN t_customer.CATEGORY = 'Silver' THEN detail.TOTAL_AMOUNT * 0.03
        WHEN t_customer.CATEGORY = 'Bronze' THEN detail.TOTAL_AMOUNT * 0.01
        WHEN t_customer.CATEGORY = 'Regular' AND header.COUPON_CODE = 'Coupon_X' THEN detail.TOTAL_AMOUNT * 0.03
        WHEN t_customer.CATEGORY = 'Regular' AND header.COUPON_CODE = 'Coupon_Y' THEN detail.TOTAL_AMOUNT * 0.02
        WHEN t_customer.CATEGORY = 'Regular' AND header.COUPON_CODE = 'Coupon_Z' THEN detail.TOTAL_AMOUNT * 0.01
        ELSE 0 
    END AS DISCOUNT,
    header.CREATE_DATE,
    header.CREATE_USER,
    header.COUPON_CODE
FROM 
    ORDER_PROCESS."ORDER_BASE".T_SALES_ORDER_HEADER header
JOIN 
    ORDER_PROCESS."ORDER__XFRM".V_SALES_ORDER_DETAIL detail 
    ON header.ORDER_ID = detail.ORDER_ID
JOIN 
    ORDER_PROCESS."ORDER_BASE".T_CUSTOMER t_customer 
    ON header.CUSTOMER_ID = t_customer.CUSTOMER_ID;

CREATE OR REPLACE PROCEDURE P_INVOICE_GENERATE()
RETURNS STRING
LANGUAGE SQL
AS
$$
BEGIN
   INSERT INTO T_INVOICE (
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
    ) 
    SELECT 
        V_SALES_ORDER_HDR.ORDER_ID,
        V_SALES_ORDER_HDR.ORDER_DATE,
        V_SALES_ORDER_HDR.ORDER_DATE AS INVOICE_DATE,
        0.09 * V_SALES_ORDER_HDR.TOTAL_AMOUNT AS TAX_AMOUNT,
        V_SALES_ORDER_HDR.TOTAL_AMOUNT,
        V_SALES_ORDER_HDR.DISCOUNT,
        (V_SALES_ORDER_HDR.TOTAL_AMOUNT + (0.09 * V_SALES_ORDER_HDR.TOTAL_AMOUNT)) - V_SALES_ORDER_HDR.DISCOUNT AS FINAL_INVOICE_AMT,
        V_SALES_ORDER_HDR.CUSTOMER_ID,
        V_SALES_ORDER_HDR.CREATE_DATE,
        V_SALES_ORDER_HDR.CREATE_USER
    FROM 
        ORDER_PROCESS.ORDER__XFRM.V_SALES_ORDER_HDR V_SALES_ORDER_HDR
    JOIN 
        ORDER_PROCESS.ORDER__XFRM.V_CUSTOMER V_customer
    ON 
        V_SALES_ORDER_HDR.CUSTOMER_ID = V_customer.CUSTOMER_ID
    WHERE 
        V_SALES_ORDER_HDR.ORDER_DATE < CURRENT_DATE 
        AND V_customer.STATUS = 'Active';

   RETURN 'Invoices generated successfully';
END;
$$;
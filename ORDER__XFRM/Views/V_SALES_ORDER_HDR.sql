create or replace view ORDER_PROCESS.ORDER__XFRM.V_SALES_ORDER_HDR(
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
) as
select 
	header.ORDER_ID,
	header.ORDER_DATE,
	header.STATUS,
	header.CUSTOMER_ID,
	header.ITEM_COUNT,
    detail.total_amount,
    CASE
    WHEN t_customer.category = 'Gold' AND header.COUPON_CODE ='Discount' then detail.total_amount * 0.05

    WHEN t_customer.category = 'Silver' AND header.COUPON_CODE ='Discount' then detail.total_amount * 0.03

    WHEN t_customer.category = 'Bronze' AND header.COUPON_CODE ='Discount' then detail.total_amount * 0.01

    WHEN t_customer.category = 'Regular' AND header.COUPON_CODE ='Coupon_X' then detail.total_amount * 0.03

    WHEN t_customer.category = 'Regular' AND header.COUPON_CODE ='Coupon_Y' then detail.total_amount * 0.02

    WHEN t_customer.category = 'Regular' AND header.COUPON_CODE ='Coupon_Z' then detail.total_amount * 0.01

    WHEN t_customer.category IN ('Gold','Silver', 'Bronze')  AND header.COUPON_CODE ='Loyalty' then 0

    Else 0 
END as discount,
	header.CREATE_DATE,
	header.CREATE_USER,
    header.COUPON_CODE 
 FROM ORDER_PROCESS."ORDER_BASE".T_SALES_ORDER_HEADER header
 join ORDER_PROCESS.ORDER__XFRM.V_SALES_ORDER_DETAIL detail
 on header.order_id = detail.order_id
 JOIN ORDER_PROCESS.ORDER_BASE.T_CUSTOMER t_customer
 ON header.CUSTOMER_ID = t_customer.CUSTOMER_ID;
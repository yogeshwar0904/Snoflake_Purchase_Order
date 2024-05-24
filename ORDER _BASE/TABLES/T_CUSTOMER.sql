create or replace TABLE ORDER_PROCESS."ORDER _BASE".T_CUSTOMER (
	CUSTOMER_ID VARCHAR(10) NOT NULL,
	ADDRESS VARCHAR(50),
	PHONE_NO VARCHAR(10),
	CATEGORY VARCHAR(10),
	STATUS VARCHAR(10),
	TOTAL_ORDERS NUMBER(38,0),
	TOTAL_INVOICE_AMOUNT NUMBER(12,2),
	CREATE_DATE DATE,
	CREATE_USER VARCHAR(10),
	LOYALTY_POINTS NUMBER(12,2),
	constraint PK_CUSTOMER_ID primary key (CUSTOMER_ID)
);


update t_customer
set loyalty_points = case
when t_promotion.customer_category = 'Gold' and t_promotion.promotion_type = 'Loyalty' then 100
when t_promotion.customer_category = 'Silver' and t_promotion.promotion_type = 'Loyalty' then 50
when t_promotion.customer_category = 'Bronze' and t_promotion.promotion_type = 'Loyalty' then 30
ELSE 0
END
FROM t_promotion
where t_customer.category = t_promotion.CUSTOMER_CATEGORY;
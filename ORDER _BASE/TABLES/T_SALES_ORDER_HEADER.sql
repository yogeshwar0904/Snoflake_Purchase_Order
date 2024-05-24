create or replace TABLE ORDER_PROCESS."ORDER _BASE".T_SALES_ORDER_HEADER (
	ORDER_ID VARCHAR(10) NOT NULL,
	ORDER_DATE DATE,
	STATUS VARCHAR(10),
	CUSTOMER_ID VARCHAR(10),
	ITEM_COUNT NUMBER(38,0),
	TOTAL_AMOUNT NUMBER(12,2),
	DISCOUNT NUMBER(10,2),
	CREATE_DATE DATE,
	CREATE_USER VARCHAR(10),
	constraint PK_ORDER_ID primary key (ORDER_ID)
);

insert into T_SALES_ORDER_HEADER
(ORDER_ID, ORDER_DATE, STATUS, CUSTOMER_ID, ITEM_COUNT, TOTAL_AMOUNT, DISCOUNT, CREATE_DATE, CREATE_USER)
values
('ORD-01', DATE '2023-05-01', 'OPEN', 'CUST-01', 1, 0, 25.00, DATE '2023-05-01', 'admin'),
('ORD-02', DATE '2023-05-03', 'OPEN', 'CUST-02', 1, 0, 50.00, DATE '2023-05-03', 'admin'),
('ORD-03', DATE '2023-05-05', 'CLOSE', 'CUST-03', 1, 0, 75.00, DATE '2023-05-05', 'admin');

update t_sales_order_header
set discount = CASE
    WHEN t_customer.category = 'Gold' AND t_promotion.promotion_type ='Discount' then total_amount * 0.05

    WHEN t_customer.category = 'Silver' AND t_promotion.promotion_type ='Discount' then total_amount * 0.03

    WHEN t_customer.category = 'Bronze' AND t_promotion.promotion_type ='Discount' then total_amount * 0.01

    WHEN t_customer.category = 'Regular' AND t_promotion.promotion_type ='Coupon_X' then total_amount * 0.03

    WHEN t_customer.category = 'Regular' AND t_promotion.promotion_type ='Coupon_Y' then total_amount * 0.02

    WHEN t_customer.category = 'Regular' AND t_promotion.promotion_type ='Coupon_Z' then total_amount * 0.01
    Else 0 
END
From t_customer
join t_promotion on t_customer.category = t_promotion.customer_category
where t_sales_order_header.customer_id = t_customer.customer_id;
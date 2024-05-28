create or replace TABLE ORDER_PROCESS."ORDER _BASE".T_PROMOTION (
	PROMOTION_ID VARCHAR(10) NOT NULL,
	CUSTOMER_CATEGORY VARCHAR(10),
	PROMOTION_TYPE VARCHAR(10),
	PROMOTION_VALUE NUMBER(10,2),
	COMMENT VARCHAR(20),
	constraint PK_PROMOTION_ID primary key (PROMOTION_ID)
);

insert into t_promotion
(	PROMOTION_ID,
	CUSTOMER_CATEGORY,
	PROMOTION_TYPE,
	PROMOTION_VALUE,
	COMMENT)
values
('1001', 'Gold', 'Discount', 5, 'PERCENT'),
('1002', 'Silver', 'Discount', 3, 'PERCENT'),
('1003', 'Bronze', 'Discount', 1, 'PERCENT'),
('1004', 'Regular', 'Coupon_X', 0.03, 'AMOUNT'),
('1005', 'Regular', 'Coupon_Y', 0.02, 'AMOUNT'),
('1006', 'Regular', 'Coupon_Z', 0.01, 'AMOUNT'),
('1007', 'Gold', 'Loyalty', 100, 'POINTS/1000 SPENT'),
('1008', 'Silver', 'Loyalty', 50, 'POINTS/1000 SPENT'),
('1009', 'Bronze', 'Loyalty', 30, 'POINTS/1000 SPENT');
create or replace TABLE ORDER_PROCESS."ORDER _BASE".T_SALES_ORDER_DETAIL (
	ORDER_ID VARCHAR(10) NOT NULL,
	ORDER_DATE DATE,
	CUSTOMER_ID VARCHAR(10),
	ITEM_ID VARCHAR(10),
	QTY NUMBER(38,0),
	TOTAL_AMOUNT NUMBER(12,2),
	CREATE_DATE DATE,
	CREATE_USER VARCHAR(10),
	PRICE NUMBER(12,2),
	constraint PK_ORDER_ID primary key (ORDER_ID)
);
insert into T_SALES_ORDER_DETAIL
(ORDER_ID, ORDER_DATE, CUSTOMER_ID, ITEM_ID, QTY, TOTAL_AMOUNT, CREATE_DATE, CREATE_USER)
values
('ORD-01', DATE '2023-05-01', 'CUST-01', 'ITEM001', 10, 200.00, DATE '2023-05-01', 'admin');
('ORD-02', DATE '2023-05-03', 'CUST-02', 'ITEM002', 5, 150.00, DATE '2023-05-03', 'admin');
('ORD-03', DATE '2023-05-05', 'CUST-03', 'ITEM003', 20, 400.00, DATE '2023-05-05', 'admin');
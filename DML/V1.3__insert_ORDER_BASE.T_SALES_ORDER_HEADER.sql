insert into ORDER_PROCESS."ORDER_BASE".T_SALES_ORDER_HEADER (
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
) VALUES
    ('ORD-01', DATE '2023-07-15', 'OPEN', 'CUST-01', 1, 0, 0, DATE '2023-05-01', 'admin','No Coupon'),
    ('ORD-02', DATE '2023-07-18', 'OPEN', 'CUST-01', 1, 0, 0, DATE '2023-05-03', 'admin', 'No Coupon'),
    ('ORD-03', DATE '2023-07-20', 'OPEN', 'CUST-01', 1, 0, 0, DATE '2023-05-05', 'admin', 'No Coupon'),
    ('ORD-11', DATE '2023-07-18', 'OPEN', 'CUST-02', 1, 0, 0, DATE '2023-05-03', 'admin', 'No Coupon'),
    ('ORD-12', DATE '2023-07-20', 'OPEN', 'CUST-02', 1, 0, 0, DATE '2023-05-05', 'admin', 'No Coupon'),
    ('ORD-23', DATE '2023-07-21', 'OPEN','CUST-03',1, 0, 0, DATE '2023-05-05', 'admin','No Coupon'),
    ('ORD-24', DATE '2023-07-21', 'OPEN','CUST-03',1, 0, 0, DATE '2023-05-05', 'admin','No Coupon'),
    ('ORD-25', DATE '2023-07-21', 'OPEN','CUST-03',1, 0, 0, DATE '2023-05-05', 'admin','No Coupon'),
    ('ORD-14', DATE '2023-07-25', 'OPEN','CUST-04',1, 0, 0, DATE '2023-05-01', 'admin','Coupon_X'),
    ('ORD-15', DATE '2023-07-26', 'OPEN','CUST-04',1, 0, 0, DATE '2023-05-03', 'admin','Coupon_X'),
    ('ORD-17', DATE '2023-07-26', 'OPEN','CUST-05',1, 0, 0, DATE '2023-05-03', 'admin','No Coupon');
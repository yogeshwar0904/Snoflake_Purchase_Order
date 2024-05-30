
insert into ORDER_PROCESS."ORDER_BASE".T_CUSTOMER
(CUSTOMER_ID, ADDRESS, PHONE_NO, CATEGORY, STATUS, TOTAL_ORDERS, TOTAL_INVOICE_AMOUNT, LOYALTY_POINTS, CREATE_DATE,	CREATE_USER)
values
('CUST-01', '2 Main StAnytown', '1234567890', 'Gold', 'Active', 3, 0, 0, DATE '2023-05-01', 'admin'),
('CUST-02', '2 Main StOldtown', '1234567891', 'Silver', 'Active', 2, 0, 0, DATE '2023-05-01', 'admin'),
('CUST-03', '3 Main StAnytown', '1234567892', 'Bronze', 'Active', 3, 0, 0, DATE '2023-05-01', 'admin'),
('CUST-04', '4 Main StOldtown', '1234567893', 'regular', 'Active', 2, 0, 0, DATE '2023-05-01', 'admin'),
('CUST-05', '5 Main StAnytown', '1234567894', 'Gold', 'Inactive', 1, 0, 0, DATE '2023-05-01', 'admin');
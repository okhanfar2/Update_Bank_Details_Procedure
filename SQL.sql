create table bank_details
(account_no number(20),
full_name varchar2(45),
mobile number(15),
adhar number(20),
pan varchar2(10),
address varchar2(30));

INSERT INTO bank_details VALUES (12345678901234567890, 'Amit Patel', 9876543210, 123456789012, 'ABCDE1234F', '123 Main Street, City');
INSERT INTO bank_details VALUES (23456789012345678901, 'Priya Sharma', 8765432109, 234567890123, 'FGHIJ5678K', '456 Oak Avenue, Town');

select * from bank_details;

update bank_details
set account_no=5678
where full_name='Prnali';



#insert is used for implementing new records in a table.
#Command used twice as illustrated in screenshot
insert into CUSTOMER Values();

#Update used to correct data in tables. Can specify using 'where'
update CUSTOMER set CUSTOMER_NAME = 'Jon Smith'
	where CUTSOMER_NAME = 'Jane Smith';
update CUSTOMER set CUST_PAYMENT_TYPE = 'Bank'
	where CUST_PAYMENT_TYPE = 'Check';
    
#Shows all of table columns and rows
select * from CUSTOMER;

#removes any unwanted or unecessary records
delete from CUSTOMER where POLICY_ID = 789456123;

#Joins two tables together. More specifically, CUSTOMER and POLICY
select * from CUSTOMER cross join POLICY;
select * from CUSTOMER, POLICY 
	where CUSTOMER.POLICY_ID = POLICY.POLICY_ID;

#Sums up the total amount being paid by all insured customers
select sum(POLICY_PRICE) from POLICY;

#Counts the total number of customers using our product. Counts number of rows in a column
select count(POLICY_ID)from CUSTOMER;

#Able to identify a customers bank through claims ID for repayment
select * from CLAIMS left join (CUSTOMER cross join PAYMENT)
	on (CUSTOMER.POLICY_ID = CLAIMS.POLICY_ID and PAYMENT.POLICY_ID = CLAIMS.POLICY_ID);

#With this query I am able to determine the License of an individual based on policy plan and policy ID
select  * from DRIVER left join (POLICY cross join CUSTOMER)
	on (POLICY.POLICY_PLAN = DRIVER.POLICY_PLAN and CUSTOMER.POLICY_ID = DRIVER.POLICY_ID);
    


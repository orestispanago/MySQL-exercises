-- Display the sales with total cost larger than 1000 and quantity lower than 18
select * from sales
where cost>1000 and quant <18;

-- Delete all Athens employees (what happens to their family members?)
delete from salesmen
where scity = 'Athens';
-- Answer:
-- Error Code: 1451. Cannot delete or update a parent row: 
-- a foreign key constraint fails (`sales`.`sales`, CONSTRAINT `FK_sales` FOREIGN KEY (`Smcode`) REFERENCES `salesmen` (`Scode`))

-- Give a 10% discount to all printers
update products
set pprice=pprice-0.1*pprice
where pdescr like '%printer%';

-- Display the id of the customer named Ioannou
select ccode from customers
where cname = 'Ioannou';

-- Display all sale quantities ordered by their total cost
select quant from sales
order by cost;

-- Find and display the average cost of the sales that took place in 1992
select avg(cost) from sales
where year(sdate)=1992;

-- Display the customers that have bought 3-7 HDDs
select customers.cname,sales.quant,products.pdescr from customers,sales,products
where customers.ccode=sales.ccode and (products.pdescr like '%hdd%') and (sales.quant between 3 and 7);

-- Display the product description and the average pieces being sold
select products.pdescr,avg(sales.cost) as avg from products,sales 
where products.pcode=sales.pcode group by products.pdescr;

-- Display the salesmen that have commission larger than 0.15, smaller that 0.18 but not equal to 0.165
select * from salesmen
where scomm between 0.15 and 0.18 and scomm != 0.165;

-- Display the salesmen that have more than 2 family members
select salesmen.sname as salesMan,count(family.salesman) as familyMembers from salesmen,family
where salesmen.scode=family.salesman and family.salesman>2
group by salesmen.sname;

-- Display the code and the total profit of each product if the total profit is above 1500
select products.pcode, sum(sales.cost) as sumBuys from products,sales 
where products.pcode=sales.pcode
group by products.pcode;
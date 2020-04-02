use sakila;

CREATE TABLE `sakila`.`newtable` (
  `fullname` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL);

-- select customer.first_name,customer.last_name from customer, address
-- where customer.address_id=address.address_id;

-- insert into newtable
-- select CONCAT(customer.first_name,' ',customer.last_name), address.address from customer, address
-- where customer.address_id=address.address_id;

DELIMITER //
create procedure PopulateCustomerAddress()
begin 
declare c_custFullName varchar(100);
declare c_custAddressID int;
declare isCurCustDone boolean default false;
declare curname cursor for
	select CONCAT(customer.first_name,' ',customer.last_name) as fullname, customer.address_id from customer;
declare continue handler for not found set isCurCustDone=true;
open curname;
	getCustomerName : loop
		fetch curname into c_custFullName, c_custAddressID;
		if isCurCustDone then
			leave getCustomerName;
		end if;
		block2 : begin
		declare isCurAddrDone boolean default false;
        declare c_addr varchar(50);
		declare curaddr cursor for
			select address from address
			where c_custAddressID=address.address_id;
		declare continue handler for not found set isCurAddrDone=true;
		open curaddr;
		getAddress : loop
			fetch curaddr into c_addr;
			if isCurAddrDone then 
				leave getAddress;
			end if;
				insert into newtable(fullname, address) values(c_custFullName, c_addr);
		end loop getAddress;
		close curaddr;
		end block2;
	end loop getCustomerName;
close curname;
end //
DELIMITER ;

call PopulateCustomerAddress();

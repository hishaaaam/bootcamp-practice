--- Create database
create database amazon;

use amazon;

-- Products - pid, pname, price, stock, location (Mumbai or Delhi)
create table products
(
	pid int(3) primary key,
    pname varchar(50) not null,
    price int(10) not null,
    stock int(5),
    location varchar(30) check(location in ('Mumbai','Delhi'))
);
-- Customer - cid, cname, age, addr
create table customer
(
	cid int(3) primary key,
    cname varchar(30) not null,
    age int(3),
    addr varchar(50)
);

-- Orders - oid, cid, pid, amt
create table orders
(
	oid int(3) primary key,
    cid int(3),
    pid int(3),
    amt int(10) not null,
    foreign key(cid) references customer(cid),
    foreign key(pid) references products(pid)
);


-- Payment - pay_id, oid,amount, mode(upi, cerdit, debit), status
create table payment
(
	pay_id int(3) primary key,
    oid int(3),
    amount int(10) not null,
    mode varchar(30) check(mode in('upi','credit','debit')),
    status varchar(30),
    foreign key(oid) references orders(oid)
);

--- Insert values
insert into products values(1,'HP Laptop',50000,15,'Mumbai');
insert into products values(2,'Realme Mobile',20000,30,'Delhi');
insert into products values(3,'Boat earpods',3000,50,'Delhi');
insert into products values(4,'Levono Laptop',40000,15,'Mumbai');
insert into products values(5,'Charger',1000,0,'Mumbai');

insert into customer values(101,'Ravi',30,'fdslfjl');
insert into customer values(102,'Rahul',25,'fdslfjl');
insert into customer values(103,'Simran',32,'fdslfjl');
insert into customer values(104,'Purvesh',28,'fdslfjl');
insert into customer values(105,'Sanjana',22,'fdslfjl');

insert into orders values(10001,102,3,2700);
insert into orders values(10002,104,2,18000);
insert into orders values(10003,105,5,900);
insert into orders values(10004,101,1,46000);
insert into orders values(10005,102,2,17000);

insert into payment values(1,10001,2700,'upi','completed');
insert into payment values(2,10002,18000,'credit','completed');
insert into payment values(3,10003,900,'debit','in process');
insert into payment values(4,10004,46000,'upi','completed');
insert into payment values(5,10005,17000,'debit','pending');

ALTER TABLE payment
ADD CONSTRAINT chk_paymentmode CHECK (mode IN ('UPI', 'Credit', 'Debit', 'COD'));

ALTER TABLE products
ADD CONSTRAINT chk_productlocation CHECK (location IN ('Banglore', 'Delhi', 'Chennai', 'Mumbai'));

select sum(amount) as Total from payment where mode="UPI";
select avg(amount) as Average from payment;
select * from products where stock=0;

-- Join Orders and Products table
-- I want product details for all orders

select *
from orders
left join products on orders.pid = products.pid;

-- Display only oid,amt,pname from the joined table
select oid,amt,pname,orders.pid
from orders
left join products on orders.pid = products.pid;

-- For payment table also display order details
select *
from payment
left join orders on payment.oid = orders.oid;

-- Full Join - UNION of Left and Right Join
select *
from payment
left join orders on payment.oid = orders.oid
UNION
select *
from payment
right join orders on payment.oid = orders.oid;

select * from products;
-- We have order table. Want to also display details of products ordered
-- and details of customer who placed the order
select oid,amt,pname,stock,location,cname,age
from orders
left join products on orders.pid=products.pid
left join customer on orders.cid=customer.cid;

select *
from orders
left join products on orders.pid=products.pid 
where location = "Mumbai";

select *
from orders
left join payment on payment.mode = "UPI";

select location, count(*), avg(price) from  products group by location;

select mode, sum(amount) from payment group by mode;

select mode, sum(amount) as total_amount from payment group by mode having total_amount>3000 order by total_amount desc;

select * from orders where amt<(select avg(amt)from orders);

select * from products where price > (select avg(amt) from orders);

select * from customer where age > ( select avg(age) from customer);

select pid, sum(amt) from orders group by pid having sum(amt)>20000 ;



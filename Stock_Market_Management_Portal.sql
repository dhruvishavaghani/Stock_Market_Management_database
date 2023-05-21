drop table broker;
Create table broker(bname varchar(30), birthday date,bpassword varchar(20), city varchar(10),phone varchar(20),bid varchar(5) primary key);
Insert into broker(bname,birthday,bpassword,city,phone,bid) values('Anil shah','12-12-1978','1010','Ahemdabad','789654321','B103'),
('Sachin desai','23-07-1998','1212','Baroda','989765443','B104'),
('Harshvi shah','05-09-1976','1111','surat','986567899','B106');

drop table Admin_a;
Create table Admin_a(aname varchar(10), birthday date, apassword varchar(10), city varchar(10),
					 phone varchar(10), staffno varchar(5) primary key);
Insert into Admin_a(aname,birthday,apassword,city,phone, staffno) values
('yash patel','29-10-2003','1234','Nadiad','989876075','S101'), 
('Mala amin','30-11-2003','4567','Anand','7984634345','S102');

drop table customer;
select *from customer;
Create table customer(cname varchar(30), birthday date,cpassword varchar(30), city varchar(20),phone varchar(30),
					  cid varchar(5) primary key);
Insert into customer(cname,birthday,cpassword,city,phone,cid)values 
('tanvi patel','24-07-1998','1213','Ahemdabad','9897633221','C101'),
('asha parekh','24-07-1998','1213','baroda','9897633221','C102'),
('raj chavda','24-07-1998','1213','Rajkot','9897633221','C103'),
('tanya mackvan','24-07-1998','1213','Bhavnagar','9897633221','C104'),
('hit purohit','24-07-1998','1213','Gandhinagar','9897633221','C106'),
('aum pandya','24-07-1998','1213','Surendranagar','9897633221','C109'),
('ayush nanda','24-07-1998','1213','Ahemdabad','9897633221','C110'),
('shivam upadhyay','24-07-1998','1213','Bhavnagar','9897633221','C105'),
('Anusha desai','11-03-2008','1103','Nadiad','9427585868','C107'),
('riya parmar','24-07-1998','1213','Baroda','9897633221','C108');

drop table Promotion;
Create table Promotion(aid varchar(5) primary key,adate date not null,venue varchar(20));
insert into  Promotion(aid,adate,venue) values('a101','01-10-2003','Ahemdabad'),
                                                   ('a102','23-10-2005','Anand'),
                                                   ('a103','13-07-2008','Bhavnagar'),
                                                   ('a104','05-01-2003','Rajkot');
drop table Seminar;
Create table Seminar(aid varchar(5) primary key,adate date not null,venue varchar(20),fees numeric(7,2));
insert into  Seminar(aid,adate,venue,fees) values
                                                   ('a105','10-12-2002','Gandhinagar',700),
												   ('a106','29-09-2006','Surat',600),
												   ('a107','18-11-2006','Vadodara',550);
drop table Portfolio;
create table Portfolio(cid varchar(5) ,foreign key(cid) references customer,pid varchar(5) 
					   primary key,cashamount numeric(10));
insert into Portfolio (cid,pid,cashamount) values('C101','p101',3000),('C105','p102',10000),
('C107','p103',1700),('C104','p104',1500),('C103','p105',35000),('C109','p106',2800);
select * from Portfolio;

drop table order_o;
create table order_o (oid varchar(5) primary key, otype varchar(30),price numeric(10),
					  quantity numeric(10),ttime time,tquantity numeric(10),tprice numeric(10));
insert into order_o  (oid,otype,price,quantity,ttime,tquantity,tprice)values ('o101','market_order',1500,10,'10:01:50',2,3000),
                                                                             ('o102','limit_order',2000,12,'08:11:05',5,10000),
																			 ('o103','stop_order',1700,20,'11:40:35',1,1700),
																			 ('o104','stop_order',500,5,'01:15:55',3,1500),
																			 ('o105','market_order',3500,30,'06:37:45',10,35000),
																			 ('o106','limit_order',400,8,'10:23:39',7,2800),
																			 ('o107','market_order',10000,18,'02:01:07',1,10000),
																			 ('o108','buy stop_order',150,25,'12:55:01',20,3000);
select * from order_o;	
drop table qyt;
create table qyt (oid varchar(5) primary key,pid varchar(5),qdate date);
insert into qyt(oid,pid,qdate) values('o101','p105','12-2-2004'),('o103','p105','1-10-2003'),('o107','p107','27-07-2003'),
                                     ('o102','p101','25-12-1003'),('o104','p103','01-01-2004'),('o105','p101','17-10-2004'),
									 ('o106','p106','20-4-2003'),('o108','p104','4-11-1003');

drop table stock;
create table stock(symbol varchar(3) primary key, index_no numeric(5), price numeric(10),svalue decimal(5,3), lot numeric(5));
insert into stock(symbol,index_no,price,svalue,lot) values('AAC',50 ,17745, 9.38, 650),
('BCO',120 ,58532, 0.77, 3100),
('CAL',82 ,23800, 16.42, 950),
('DAM',100 ,25000, 11.92, 675),
('LCD',90 ,25500, 20.1, 600),
('FAF',75 ,19786, 10.45, 328);

drop table corporation;
create table corporation(CorpRegNo varchar(5) primary key, cpname varchar(20), city varchar(10), phone numeric(10));
insert into corporation(CorpRegNo,cpname,city,phone) values('cr101','COFORGE LTD','Pune',9825206453),
('cr289','ADANI ENTERPRISE','Mumbai',6351333078),
('cr303','SBI','Banglore',976543218),
('cr200','GLENMARK','Delhi',8324568931),
('cr150','NALCO','Ahmedabad',9998973576);

drop table issue;
create table issue(issue_id varchar(5) primary key, CorpRegNo varchar(5), symbol varchar(5), 
				   foreign key(CorpRegNo) references corporation(CorpRegNo), foreign key(symbol) references stock(symbol));
insert into issue(issue_id,CorpRegNo,symbol) values('i101','cr101','AAC'),
('i102','cr289','BCO'),
('i103','cr303','CAL'),
('i104','cr101','DAM'),
('i106','cr150','LCD'),
('i105','cr150','FAF');

drop table contain;
create table contain (symbol varchar(5), oid varchar(5) Primary key);
insert into contain (symbol,oid) values('AAC','o101'),('BCO','o102'),('DAM','o104'),
('AAC','o105'),('LCD','o106'),('FAF','o107'),('LCD','o108');

-- Queries :

--1.Display customer name who has placed order for type ‘market_order’.(Subquery)
select cname from customer where cid in (select cid from portfolio where pid in (select pid from qyt where oid in (select oid from order_o where otype='market_order')));

--2.Find order details with cash amount .(Join)
select cashamount,order_o oid,otype,price,quantity,ttime,tquantity,tprice from order_o inner join qyt on order_o.oid=qyt.oid inner join Portfolio on qyt.pid=Portfolio.pid;

-- 3.Display corporation details of stock with symbol ‘BCD’ or ‘DAM’. (Join)
select * from corporation inner join issue on corporation.CorpRegNo = issue.CorpRegNo inner join stock on issue.symbol=stock.symbol where stock.symbol='BCO' or stock.symbol='DAM';

-- 4.Display customer name with cash amount in range of 1000 to 2000.(join)
select cname from customer inner join Portfolio on customer.cid=Portfolio.cid where cashamount>1000 and cashamount<2000;

-- 5.Display stock details along with order id.(Join)
select oid,stock.symbol,index_no,price,svalue,lot from stock inner join contain on stock.symbol=contain.symbol;

--6.Display total price of each type of order.(Group By)
select sum(tprice),otype from order_o group by otype;

--7.Display cid where city is Ahemdabad and whose name start with ‘A’ . (like)
select cid from customer where city='Ahemdabad' and cname like ('a%');

--8.Display seminar id of the seminar occurring between date 5 to 20. (Date)
select aid from Seminar where date_part('day',adate)>5 and date_part('day',adate)<20;

--9.Display stock details ordered by symbol. (Ordered By)
select *from stock order by symbol;

-- 10.Display  5% of price as stock_price .(As)
select (price*0.05) as stock_price from stock;

-- 11.Funtion to display total order.(Function)
CREATE OR REPLACE function total_order()
RETURNS integer AS $total$
declare 
    total integer;
BEGIN 
    SELECT count(*) into total FROM order_o;
	RETURN total;
END
$total$ LANGUAGE plpgsql;

select total_order();

-- 12.Display stock having stock prices between range x and y.(Function)
Create function get_stock_count(x int, y int)  
returns int  
language plpgsql  
as  
$$  
Declare  
stock_count integer;  
Begin  
select count(*)  
into stock_count  
from  stock 
where svalue between x and y;  
return stock_count; 
End;  
$$; 

select get_stock_count(0,17);

-- 13.Display customer name with their city name(Cursor).

BEGIN;
declare c_cid cursor for
select cid from customer where cid>'C101';
fetch next from c_cid;
close c_cid;
 

-- 14.Trigger to insert new record into table seminar which wil be reflected on promotion.
CREATE OR REPLACE FUNCTION new_seminar() RETURNS TRIGGER AS $nseminar$
   BEGIN
      INSERT INTO Promotion(aid, adate,venue) VALUES (new.aid, new.adate,NEW.venue);
      RETURN NEW;
   END;
$nseminar$ LANGUAGE plpgsql;

create trigger new_insert
After INSERT 
ON Seminar
FOR EACH ROW
EXECUTE PROCEDURE new_seminar();

-- delete aid,adate,venue,fees from Seminar where aid='a110' or aid='a109' ;
INSERT INTO Seminar(aid,adate,venue,fees)
VALUES ('a112','18-12-2006','Vadodara',330);
select *from Seminar;
select *from Promotion;

15.
create function invaild_lot() returns trigger as $$
BEGIN
if NEW.lot <1300 then
raise exception 'Invaild lot';
end if;
return NEW;
END;
$$
LANGUAGE plpgsql;

create trigger check_lot
BEFORE INSERT OR UPDATE
ON stock
FOR EACH ROW
EXECUTE PROCEDURE invaild_lot();

update stock set lot=700 where symbol='BCO';

16.




























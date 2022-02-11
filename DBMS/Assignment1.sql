create table customer(customerID int not null primary key,
customerName varchar(50),
phone varchar(50),
city varchar(50),
salesRepID int);

desc customer

create table productdetails(productID int not null primary key,
prodName varchar(50),
quantAvailable int,
price int,
sellerID int unique);

desc productdetails

create table orders(orderID int not null primary key,
totalPrice int,
orderDate date,
deliveryDate date,
status varchar(10),
customerID int,
foreign key(customerID) references customer);

desc orders


create table payment(paymentID int not null primary key,
orderID int,
foreign key(orderID) references orders,
price int,
status varchar(10) not null);

desc payment


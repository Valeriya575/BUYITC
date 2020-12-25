--exec sp_MSforeachtable 'DROP TABLE ?'

CREATE TABLE cmContent_Article   
   (  
    articleid int identity (1,1) PRIMARY KEY,  
    title varchar(255) 
   ) ;  
GO  

SET IDENTITY_INSERT cmContent_Article ON
insert into cmContent_Article  (articleid, title) values (33, 'IBM NetXtr.II 1000 Exp.Eth.Adapter');
insert into cmContent_Article (articleid, title) values (181, 'HP DESIGNJET 130GP');
insert into cmContent_Article (articleid, title) values (205, 'HP DLTTAPE IV DATA CRTG(DLT40,70,80');
insert into cmContent_Article (articleid, title) values (206, 'HP DLT-TAPE čistina kaseta');
insert into cmContent_Article (articleid, title) values (207, 'HP DDS1 CARTRIDGE 90M 4 GB');

SET IDENTITY_INSERT cmContent_Article OFF
GO

CREATE TABLE cmContent_Merchant   
   (  
    merchantid int identity (1, 1) PRIMARY KEY,  
    title varchar(255) 
   ) ;  
GO
insert into cmContent_Merchant  (title) values ('DISS d.o.o.');
GO

CREATE TABLE cmContent_ArticlePrice    
   (  
    articleid int not null references cmContent_Article(articleid),  
    --merchantid int,
	merchantid int not null references cmContent_Merchant(merchantid),
	pricewotax decimal,
	discountpercent decimal,
	taxpercent decimal
   ) ;  
GO

insert into cmContent_ArticlePrice (articleid, merchantid, pricewotax, discountpercent, taxpercent) values (33, 1, 60.00000000, 0.00000000, 20.00000000);
insert into cmContent_ArticlePrice (articleid, merchantid, pricewotax, discountpercent, taxpercent) values (181, 1, 2228.94000000, 10.00000000, 20.00000000);
insert into cmContent_ArticlePrice (articleid, merchantid, pricewotax, discountpercent, taxpercent) values (205, 1, 37.51000000, 7.00000000, 20.00000000);
insert into cmContent_ArticlePrice (articleid, merchantid, pricewotax, discountpercent, taxpercent) values (206, 1, 55.57000000, 3.00000000, 20.00000000);
insert into cmContent_ArticlePrice (articleid, merchantid, pricewotax, discountpercent, taxpercent) values (207, 1, 3.81000000, 23.00000000, 20.00000000);
GO

CREATE TABLE cmContent_ArticleImage     
   (  
    articleid int not null references cmContent_Article(articleid),  
    imageurl varchar(255),
	dateentered datetime
   ) ;  
GO

insert into cmContent_ArticleImage (articleid, imageurl, dateentered) values (33, 'http://www.domain.com/images/ADI212.jpg', '2008-10-17 09:05:54.857');
insert into cmContent_ArticleImage (articleid, imageurl, dateentered) values (33, 'http://www.domain.com/images/YC4810A.jpg', '2008-09-02 08:22:24.000');
insert into cmContent_ArticleImage (articleid, imageurl, dateentered) values (181, 'http://www.domain.com/images/YC7791E.jpg', '2008-11-25 14:42:49.610');
insert into cmContent_ArticleImage (articleid, imageurl, dateentered) values (181, 'http://www.domain.com/images/YC4812A.jpg', '2008-09-02 08:22:24.763');
insert into cmContent_ArticleImage (articleid, imageurl, dateentered) values (181, 'http://www.domain.com/images/YQ7581A.jpg', '2008-09-02 08:24:43.263');
insert into cmContent_ArticleImage (articleid, imageurl, dateentered) values (205, 'http://www.domain.com/images/YC5141F.jpg', '2008-07-07 09:08:21.110');
insert into cmContent_ArticleImage (articleid, imageurl, dateentered) values (205, 'http://www.domain.com/images/NBI280.jpg', '2008-08-27 14:54:59.597');
insert into cmContent_ArticleImage (articleid, imageurl, dateentered) values (206, 'http://www.domain.com/images/YC5142A.jpg', '2008-07-07 09:08:21.173');
insert into cmContent_ArticleImage (articleid, imageurl, dateentered) values (206, 'http://www.domain.com/images/YQ7583A.jpg', '2008-09-02 08:24:44.827');
insert into cmContent_ArticleImage (articleid, imageurl, dateentered) values (207, 'http://www.domain.com/images/YC5706A.jpg', '2008-07-07 09:08:21.220');
insert into cmContent_ArticleImage (articleid, imageurl, dateentered) values (207, 'http://www.domain.com/images/40Y7734.jpeg','2008-08-27 14:54:59.067');
insert into cmContent_ArticleImage (articleid, imageurl, dateentered) values (207, 'http://www.domain.com/images/YC4811A.jpg', '2008-09-02 08:22:24.407');
insert into cmContent_ArticleImage (articleid, imageurl, dateentered) values (207, 'http://www.domain.com/images/YQ7582A.jpg', '2008-09-02 08:24:44.170');

GO

SELECT articleid AS article_id, title as article_title from cmContent_Article

SELECT title AS article_title from cmContent_Article

select title as merchant_title from cmContent_Merchant

select (pricewotax-((pricewotax*(discountpercent/100))+(pricewotax*(taxpercent/100)))) as pricewtax from cmContent_ArticlePrice 

select top 1 with ties
  articleid, imageurl as articleimageurl
from cmContent_ArticleImage 
order by row_number() over (partition by articleid order by dateentered desc)


select top 1 with ties
  articleid, imageurl, dateentered as articleimagedateentered
from cmContent_ArticleImage 
order by row_number() over (partition by articleid order by dateentered desc)





CREATE TABLE cmContent_Value (
    valueid int PRIMARY KEY IDENTITY(1,1),
    title varchar(255),
);

insert into cmContent_Value (title) values ('Prva');
insert into cmContent_Value (title) values ('Druga');
insert into cmContent_Value (title) values ('Tretja');
insert into cmContent_Value (title) values ('Četrta');
insert into cmContent_Value (title) values ('Peta');
GO

CREATE FUNCTION dbo.cmFunction_ValueHorizontal()
RETURNS varchar(255)
AS BEGIN
    RETURN (SELECT (select STRING_AGG (title, ', ') AS title FROM cmContent_Value) + '.'); 
	
END
GO

select dbo.cmFunction_ValueHorizontal()
GO

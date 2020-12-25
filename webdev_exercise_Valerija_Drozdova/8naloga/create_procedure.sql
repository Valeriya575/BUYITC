CREATE OR ALTER PROCEDURE cmSP_TableValuedParam 
@Parameter Type_cmSP_TableValuedParam READONLY
AS
declare @fullNames varchar(255)
set @fullNames = '';
SELECT @fullNames = @fullNames + nameT + ' ' + surnameT + '. ' FROM @Parameter;
set @fullNames = replace(@fullNames,',','')
set @fullNames = replace(@fullNames,'. ',', ')
set @fullNames = substring(@fullNames, 1, (len(@fullNames) - 1))
print @fullNames

INSERT INTO TableValuedParam
SELECT * FROM @Parameter
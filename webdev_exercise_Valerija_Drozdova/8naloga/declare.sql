DECLARE @VarType AS Type_cmSP_TableValuedParam
 
INSERT INTO @VarType
VALUES ( 'Miran,', 'tepeš'
       )
INSERT INTO @VarType
VALUES ( 'Boris,', 'Kobal'
       )
INSERT INTO @VarType
VALUES ( 'Vasja', 'Octeni'
       )
    
    
EXECUTE cmSP_TableValuedParam @VarType

--SELECT * FROM TableValuedParam
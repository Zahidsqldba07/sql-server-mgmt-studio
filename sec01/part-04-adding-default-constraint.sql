select * from tblGender
select * from tblPerson

Insert into tblPerson --dont need to supply Gender since null is allowed
(ID, Name, Email) Values (7, 'Rich', 'r@r.com');

------------------------------------------------
ALTER TABLE tblPerson 
ADD CONSTRAINT DF_tblPerson_GenderId
DEFAULT 3 FOR GENDERID

------------------------------------------------
Insert into tblPerson
(ID, Name, Email) Values (8, 'Mike', 'mike@r.com');

------------------------------------------------
Insert into tblPerson
(ID, Name, Email, GenderId) Values (9, 'Sara', 's@r.com', 1);

------------------------------------------------
Insert into tblPerson
(ID, Name, Email, GenderId) Values (10, 'Johnny', 'j@r.com', NULL);

--if you supply a value (even if null) the default wont be used
--but if you dont pass a value for genderid, the default will kick in

---------------------------------------------------------------------
--ALTERING AN EXISTING COLUMN TO ADD A DEFAULT CONSTRAINT:
--ALTER TABLE {TABLE_NAME}
--ADD CONSTRAINT {CONSTRAINT_NAME}
--DEFAULT {DEFAULT_VALUE} FOR {EXISTING_COLUMN_NAME}

---------------------------------------------------------------------
--ADDING A NEW COLUMN WITH A DEFAULT VALUE TO AN EXISTING TABLE:
--ALTER TABLE {TABLE_NAME}
--ADD {COLUMN_NAME}{DATA_TYPE} {NULL |NOT NULL}
--CONSTRAINT {CONSTRAINT_NAME} DEFAULT {DEFAULT_VALUE}

---------------------------------------------------------------------
--DROPPING A CONSTRAINT:
--ALTER TABLE {TABLE_NAME}
--DROP CONSTRAINT {CONSTRAINT_NAME}


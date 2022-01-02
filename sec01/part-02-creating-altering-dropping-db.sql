create database Sample2
--ldf and mdf created
-----------------------------------------------
alter database Sample2 modify name = Sample3

----------------------------------------------
sp_renameDB 'Sample3', 'Sample4'

----------------------------------------------
drop database Sample4 --should not be in use when dropping

----------------------------------------------
alter database Sample4 set SINGLE_USER With Rollback Immediate
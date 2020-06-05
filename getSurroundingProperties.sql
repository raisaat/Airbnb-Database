CREATE OR REPLACE PROCEDURE GetSurroundingProperties(PropertyID IN INT) IS

zip INT;
recordproperty PROPERTYLISTING%rowtype;
 propid INT;
 propname varchar(20);
 CURSOR cprop IS
    SELECT PID,PROPERTYNAME 
    FROM PROPERTYLISTING
    WHERE ZIPCODE =zip;
 BEGIN
  SELECT ZIPCODE into zip  FROM PROPERTYLISTING  WHERE PID=PropertyID;
  open cprop;
   LOOP
        FETCH cprop INTO propid,propname;
        EXIT WHEN cprop%NOTFOUND;
        dbms_output.put_line(propid||propname);
    end loop;
  close cprop;
 END;
 
 set serveroutput on size 30000;
exec GetSurroundingProperties(1);
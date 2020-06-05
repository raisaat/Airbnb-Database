SET SERVEROUTPUT ON;
create or replace
PROCEDURE GetMinimumBedroomNumber(bedCnt IN INT) AS beds INT;

recordproperty PROPERTYLISTING%rowtype;
 propId INT;
 propName varchar(20);
 
CURSOR properties IS
  SELECT PID, PROPERTYNAME
  FROM PROPERTYLISTING
  WHERE BEDROOMCNT >= bedCnt;
 
BEGIN
 
  open properties;
  LOOP
	FETCH properties INTO propId, propName;
	EXIT WHEN properties%NOTFOUND;
	dbms_output.put_line(propId||propName);
  end loop;
close properties;
END;
create or replace TRIGGER Update_Bedroom_Count
AFTER INSERT ON Bedroom
FOR EACH ROW
BEGIN
	UPDATE PropertyListing	
	SET BedroomCnt = BedroomCnt + 1
	WHERE PID = :new.PropertyID;
END;
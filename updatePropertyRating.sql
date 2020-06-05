create or replace TRIGGER Update_Property_Rating
AFTER INSERT ON ReviewForProperty
FOR EACH ROW
BEGIN
	UPDATE PropertyListing	
	SET AvgRatings = (AvgRatings * NumOfRatings + :new.Overall_Rating)/(NumOfRatings + 1)
	WHERE PID = :new.PID;
	UPDATE PropertyListing	
	SET NumOfRatings = NumOfRatings + 1
	WHERE PID = :new.PID;
END;
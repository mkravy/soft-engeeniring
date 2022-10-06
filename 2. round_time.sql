CREATE OR REPLACE Function ROUND_TIME
   ( time_in IN DATE )
   RETURN DATE
IS
   new_time DATE;
 
BEGIN
    SELECT round( (time_in - trunc(time_in)) * 48 )/ 48 + trunc(time_in) INTO new_time FROM dual;
    RETURN new_time;
END;
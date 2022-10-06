CREATE OR REPLACE Function GET_MD5
   ( name_in IN varchar2 )
   RETURN varchar2
IS
   md5_out varchar2(100);
 
BEGIN
    SELECT STANDARD_HASH(name_in) INTO md5_out FROM dual;
    RETURN md5_out;
END;
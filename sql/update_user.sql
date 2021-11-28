DELIMITER //
DROP FUNCTION IF EXISTS regist_user;
CREATE FUNCTION regist_user(name VARCHAR(20), mail VARCHAR(255), passwd VARCHAR(40)) RETURNS INT DETERMINISTIC
BEGIN
 DECLARE cnt, ret INT;
 SELECT COUNT(*) INTO cnt FROM user WHERE user_name = name;
 IF cnt = 0 THEN
  INSERT INTO user (user_name, email, password, created_at) values(name, mail, passwd, NOW());
  SET ret = 0;
  RETURN ret;
 END IF;
 SET ret = 1;
 RETURN ret;
END;
//

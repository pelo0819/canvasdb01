DELIMITER //
DROP PROCEDURE IF EXISTS regist_user;
CREATE PROCEDURE regist_user(IN name VARCHAR(20), IN mail VARCHAR(255), IN passwd VARCHAR(40), OUT ret INT)
BEGIN
 DECLARE cnt INT;
 SELECT COUNT(*) INTO cnt FROM user WHERE user_name = name;
 IF cnt = 0 THEN
  INSERT INTO user (user_name, email, password, created_at) values(name, mail, passwd, NOW());
  SET ret = 0;
 ELSE
  SET ret = 1;
 END IF;
END;
//

SELECT * FROM user_login.GetUsers

use user_login;

select * from users;

-- Change Delimiter
DELIMITER //
-- Create Store Procedure
CREATE PROCEDURE GetUsers()
BEGIN
	SELECT * FROM user_login.users;
END//

-- Change Delimiter again
DELIMITER ;



DROP PROCEDURE GetUsers;

CALL GetUses

/* USERS (APPRENTICE) WITH SCORES AND DATES */

DELIMITER //
-- Create Store Procedure
CREATE PROCEDURE GetScores()
BEGIN
	select name AS 'Name', category_id AS 'Week_Quiz',(right_answer+wrong_answer+unanswered) AS '#_Questions', right_answer AS 'Right', wrong_answer AS 'Wrong', unanswered AS 'Unanswer',   ROUND(((right_answer / (right_answer + wrong_answer + unanswered)) * 100),0) Score, date_format(date, "%m/%d/%y") AS Date
	from users u, scores s
	WHERE u.id = s.user_id
	AND 
	name IN('Pam Meade','Alan Wilson','Shannon Miller','Michael Miller', 'Michaela Scott','Amani Johnson', 'Fritz Thelusma', 'Aaliyah Melton','Antwana Wadlington', 'Steven L Moreland', 'Christine','craig nickel')
	GROUP BY name, category_id
	ORDER BY name, category_id
	LIMIT 1200;
END//

-- Change Delimiter again
DELIMITER ;

CALL GetScores();

DROP PROCEDURE GetScores;
-

-- CERTIFICATES

DELIMITER //
-- Create Store Procedure
CREATE PROCEDURE GetCertificates()
BEGIN
select u.name AS 'Name', certName AS 'Cert_Name', certType AS 'Cert_Type', certVendor AS 'Vendor', date_format(date_complete, "%m/%d/%y") AS Date, certLink AS 'Cert_Link', position AS Position
	from users u, certificates c
	WHERE u.id = c.userID
	ORDER BY u.name
	LIMIT 100;
    
END//

-- Change Delimiter again
DELIMITER ;

CALL GetCertificates();

DROP PROCEDURE GetCertificates;

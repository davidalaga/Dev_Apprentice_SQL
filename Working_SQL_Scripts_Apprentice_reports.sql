/*will  not show repeated names filter by the lastest date *  USE THIS!!!!!*/

select name AS 'Name', category_id AS 'Week_Quiz', count(*) AS 'Times Taken'
from users u, scores s
where u.id = s.user_id
GROUP BY name, category_id
HAVING MAX(date_format(date, "%m/%d/%y"))
ORDER BY category_id
LIMIT 1000;

use user_login;
select * from users;

/* USERS (APPRENTICE) WITH SCORES AND DATES */

select name AS 'Name', category_id AS 'Week_Quiz',(right_answer+wrong_answer+unanswered) AS '#_Questions', right_answer AS 'Right', wrong_answer AS 'Wrong', unanswered AS 'Unanswer',   ROUND(((right_answer / (right_answer + wrong_answer + unanswered)) * 100),0) Score, date_format(date, "%m/%d/%y") AS Date
from users u, scores s
WHERE u.id = s.user_id
AND 
name IN('Pam Meade','Alan Wilson','Shannon Miller','Michael Miller', 'Michaela Scott','Amani Johnson', 'Fritz Thelusma', 'Aaliyah Melton','Antwana Wadlington', 'Steven L Moreland', 'Christine Ash', 'Craig Nickel')
GROUP BY name, category_id
ORDER BY name, category_id
LIMIT 1200;
-- ORDER BY name;

use user_login;


/*rollup can not do ORDER BY with ROLLUP*/

use user_login;

select name AS 'Name', category_id AS 'Week_Quiz', count(*) AS 'Times Taken'
from users u, scores s
where u.id = s.user_id
GROUP BY name, category_id
WITH ROLLUP
HAVING MAX(date_format(date, "%m/%d/%y"))
-- ORDER BY category_id
LIMIT 800;

/* MAYBE COUNT ONLY TIMES THE NAME APPEARS */

select name AS 'Name', category_id AS 'Week_Quiz', count(*) AS 'Times Taken'
from users u, scores s
where u.id = s.user_id
-- AND name IN('Alan Wilson')
GROUP BY ROLLUP name, category_id
HAVING MAX(date_format(date, "%m/%d/%y"))
-- ORDER BY category_id
LIMIT 1200;

/*  one person */

select name AS 'Name', category_id AS 'Week_Quiz',(right_answer+wrong_answer+unanswered) AS '# Questions', right_answer AS 'Right', wrong_answer AS 'Wrong', unanswered AS 'Unanswer',   ROUND(((right_answer / (right_answer + wrong_answer + unanswered)) * 100),0) Score, date_format(date, "%m/%d/%y") AS Date
from users u, scores s
WHERE u.id = s.user_id
AND 
name IN('Shannon Miller','Michael Miller', 'Michaela Scott','Amani Johnson', 'Fritz Thelusma', 'Aaliyah Melton','Antwana Wadlington', 'Steven L Moreland', 'Christine')
GROUP BY name, category_id
ORDER BY name, category_id
LIMIT 1000;

   
    select u.name AS 'Name', certName AS 'Cert_Name', certType AS 'Cert_Type', certVendor AS 'Vendor', date_format(date_complete, "%m/%d/%y") AS Date, certLink AS 'Cert_Link', position AS Position
	from users u, certificates c
	WHERE u.id = c.userID
    AND certVendor = 'GCP'
	ORDER BY u.name, c.certType
	LIMIT 100;
    
    
/* Store proc for certificates */

select  u.id, u.name AS 'Name', certName AS 'Cert_Name', certType AS 'Cert_Type', certVendor AS 'Vendor', date_format(date_complete, "%m/%d/%y") AS Date, certLink AS 'Cert_Link', position AS Position
	from users u, certificates c
	WHERE u.id = c.userID
    ORDER BY u.name
	LIMIT 1000;
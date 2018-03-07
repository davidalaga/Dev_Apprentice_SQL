SELECT * FROM user_login.certificates;

select  u.id, u.name AS 'Name', certName AS 'Cert_Name', certType AS 'Cert_Type', certVendor AS 'Vendor', date_format(date_complete, "%m/%d/%y") AS Date, certLink AS 'Cert_Link', position AS Position
	from users u, certificates c
	WHERE u.id = c.userID
    ORDER BY u.name
	LIMIT 1000;
    
    
    select u.name AS 'Name', certName AS 'Cert_Name', certType AS 'Cert_Type', certVendor AS 'Vendor', date_format(date_complete, "%m/%d/%y") AS Date, certLink AS 'Cert_Link', position AS Position
	from users u, certificates c
	WHERE u.id = c.userID
    AND certType = 'accredidation'
	ORDER BY u.name, c.certType
	LIMIT 100;
    
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
    
    
    
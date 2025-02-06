
-- Retrieve users that are from Canada and created an account between 2023-11-01 to 2024-08-31
SELECT
	users.id AS user_id,
	users.email AS 'email',
	users.created_at AS 'register_date',
    personal.birthdate,
    personal.gender 
FROM
	accounts.users AS users
	INNER JOIN accounts.addresses on users.id = addresses.user_id
	LEFT JOIN accounts.personal_data AS personal ON personal.user_id = users.id
WHERE
	addresses.country = 'CA'
	AND users.created_at BETWEEN '2023-11-01 00:00:00' AND '2024-08-31 23:59:59'
    -- users from the developers team
	AND users.id NOT IN('853f3844-8012-47f0-8db4-d06e001ee8f2',
	'd3f188b7-d448-42e1-a813-941eee30baf4','d030cea4-20d6-48c8-b334-2295cbd38227',
    '29cd7504-c5af-4dec-8bc3-6e4cbc2901dd',
     '73aa88bf-00f1-41dc-b775-ef3fbccfddd5','ffb2be10-0772-4ac9-9fe8-ea9e1588b811')

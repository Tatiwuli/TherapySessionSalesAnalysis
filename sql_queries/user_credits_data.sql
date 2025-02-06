-- Query that retrieves the users' credits status

SELECT
	users.id AS user_id,
	product_purchases.credit_status AS 'has_credits'
FROM
	accounts.users AS users
	INNER JOIN accounts.addresses on users.id = addresses.user_id
    LEFT JOIN payments.product_purchases on users.id = product_purchases.user_id
WHERE
	addresses.country = 'CA'
	AND users.created_at BETWEEN '2023-11-01 00:00:00' AND '2024-08-31 23:59:59'
    -- users from the developers team
	AND users.id NOT IN('853f3844-8012-47f0-8db4-d06e001ee8f2',
	'd3f188b7-d448-42e1-a813-941eee30baf4','d030cea4-20d6-48c8-b334-2295cbd38227',
    '29cd7504-c5af-4dec-8bc3-6e4cbc2901dd',
     '73aa88bf-00f1-41dc-b775-ef3fbccfddd5','ffb2be10-0772-4ac9-9fe8-ea9e1588b811')



-- Query that retrieve doctors_id from the users' sessions 

SELECT
    doctors.id AS 'doctor_id',
    appointments.id AS session_id
FROM
    schedulings.appointments
INNER JOIN accounts.users ON users.id = appointments.user_id
INNER JOIN accounts.addresses ON users.id = addresses.user_id
LEFT JOIN schedulings.scheduling_ratings AS rating ON rating.scheduling_id COLLATE utf8mb4_general_ci = appointments.id
 WHERE
	addresses.country = 'CA'
	AND users.created_at BETWEEN '2023-11-01 00:00:00' AND '2024-08-31 23:59:59'
    -- users from the developers team
	AND users.id NOT IN('853f3844-8012-47f0-8db4-d06e001ee8f2',
	'd3f188b7-d448-42e1-a813-941eee30baf4','d030cea4-20d6-48c8-b334-2295cbd38227',
    '29cd7504-c5af-4dec-8bc3-6e4cbc2901dd',
     '73aa88bf-00f1-41dc-b775-ef3fbccfddd5','ffb2be10-0772-4ac9-9fe8-ea9e1588b811')




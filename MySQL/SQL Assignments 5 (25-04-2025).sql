USE Udaanous;

-- Basic Select

SELECT * FROM logins;
SELECT * FROM Users;

-- 1.	Monthly Active Users (MAU) – Count of distinct users who logged in during each month over the last 12 months.

SELECT Date_format(L.login_date,"%Y-%M") AS Month ,count(Distinct U.User_id) AS Active_user FROM Logins AS L
JOIN Users AS U ON L.User_id = U.user_id
WHERE L.login_date BETWEEN '2023-01-01' AND '2024-04-30'
GROUP BY  Month
ORDER BY Active_user DESC;


-- Check

SELECT MIN(login_date), MAX(login_date) FROM Logins;
SELECT COUNT(*) FROM Users;
SELECT * FROM Logins WHERE login_date IS NULL OR user_id IS NULL;

-- 2.	1-Month Retention Rate – For each signup month, calculate the percentage of users who signed up in that month and also logged in again in the following month.

SELECT
  DATE_FORMAT(u.signup_date, '%Y-%M') AS signup_month,
  COUNT(DISTINCT u.user_id) AS signup_users,
  COUNT(DISTINCT CASE
    WHEN l.login_date >= DATE_ADD(DATE_FORMAT(u.signup_date, '%Y-%m-01'), INTERVAL 1 MONTH)
     AND l.login_date < DATE_ADD(DATE_FORMAT(u.signup_date, '%Y-%m-01'), INTERVAL 2 MONTH)
    THEN u.user_id
    ELSE NULL
  END) AS retained_users,
  ROUND(
    COUNT(DISTINCT CASE
      WHEN l.login_date >= DATE_ADD(DATE_FORMAT(u.signup_date, '%Y-%m-01'), INTERVAL 1 MONTH)
       AND l.login_date < DATE_ADD(DATE_FORMAT(u.signup_date, '%Y-%m-01'), INTERVAL 2 MONTH)
      THEN u.user_id
      ELSE NULL
    END) / COUNT(DISTINCT u.user_id) * 100, 2
  ) AS retention_rate
FROM users AS u
LEFT JOIN logins AS l ON u.user_id = l.user_id
WHERE u.signup_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY signup_month
ORDER BY signup_month DESC;




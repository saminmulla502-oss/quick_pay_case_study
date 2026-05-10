
-- Q1
SELECT status, COUNT(*) AS transaction_count
FROM transactions
GROUP BY status;

-- Q2
SELECT merchant_name, SUM(amount_usd) AS captured_gmv
FROM transactions
WHERE status = 'SUCCESS'
GROUP BY merchant_name;

-- Q3
SELECT merchant_name, SUM(amount_usd) AS captured_gmv
FROM transactions
WHERE status = 'SUCCESS'
GROUP BY merchant_name
ORDER BY captured_gmv DESC
LIMIT 10;

-- Q4
SELECT transaction_date, SUM(amount_usd) AS daily_gmv,
COUNT(*) AS successful_transactions
FROM transactions
WHERE status = 'SUCCESS'
GROUP BY transaction_date;

-- Q5
SELECT merchant_name,
SUM(CASE WHEN status='CHARGEBACK' THEN 1 ELSE 0 END)*100.0/COUNT(*) AS chargeback_ratio
FROM transactions
GROUP BY merchant_name
HAVING chargeback_ratio > 1;

-- Q6
SELECT region, AVG(risk_score) AS avg_risk_score, COUNT(*) AS txn_count
FROM transactions
GROUP BY region
HAVING AVG(risk_score) > 50 AND COUNT(*) > 20;

-- Q7
SELECT user_id, transaction_date, COUNT(*) AS failed_txns
FROM transactions
WHERE status IN ('FAILED','CHARGEBACK')
GROUP BY user_id, transaction_date
HAVING COUNT(*) >= 3;

-- Q8
SELECT merchant_name,
COUNT(*) AS chargeback_count,
COUNT(DISTINCT user_id) AS affected_users,
SUM(amount_usd) AS chargeback_amount
FROM transactions
WHERE status='CHARGEBACK'
GROUP BY merchant_name;

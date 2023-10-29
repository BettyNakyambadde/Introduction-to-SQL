-- A query that pulls all the data from the accounts table, and all the data from the orders table.
SELECT orders.*, accounts.*
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;

-- A query that pulls standard_qty, gloss_qty, and poster_qty from the orders table, and the website and the primary_poc from the accounts table.
SELECT orders.standard_qty, orders.gloss_qty, orders.poster_qty, accounts.website, accounts.primary_poc 
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

--A query that provides a table for all web_events associated with account name walmart 
SELECT a.primary_poc, w.occurred_at, w.channel, a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE a.name = 'Walmart';

-- A query that provides a table that provides region for each sales_rep along with their associated accounts.
SELECT r.name, s.region_id, s.name, a.name
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
ORDER BY a.name;

--A query that provides the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order
SELECT r.name, a.name, o.total_amt_usd
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id;

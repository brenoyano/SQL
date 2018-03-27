SELECT company, product_name, date_received, date_sent
FROM consumer_complaints
WHERE date_received = date_sent;
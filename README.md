<img src="https://github.com/brenoyano/SQL/blob/master/Img/2000px-Applications-database.svg.png" width="65">
<h3>This repository have the code and analysis used during the challanges of Super Data Science SQL & Database Design A-Z course.</h3>

<h4>Challenge One:</h4>

<ul>From the database provided you will:
  <li>How many complaints were received and sent on the same day;</li>
<li>Extract the complaints received in New York;</li>
<li>Extract the complaints received in the states of New York and California;</li>
<li>Extract all the rows with the word "credit" in the product;</li>
<li>Extract all the rows with the word "late" in the issue field.</li>
</ul>

For the first challenge item i decided to do something more interative so, for that i did the following query on Tableau 10.5
SELECT company, product_name, issue
FROM consumer_complaints
WHERE date_sent = date_received

After that i created a Dashboar so the user can not only see how many complaints were done, but also control which company, product and type of issue that was rceived.
<img src="https://github.com/brenoyano/SQL/blob/master/Img/Dashboard.PNG" width="900">
If you want to see this dashboard and interect with it you can access it by clicking <a href="https://public.tableau.com/profile/brenoyano#!/vizhome/SQLChallenge/Painel1">Here</a> 


The second and third part (Extract the complaints received in New York / new york and california) were also simple because the only diference was that in WHERE were used state_name = 'NY' and WHERE = state_name = 'NY' OR state name = 'CA'
SELECT company, product_name, issue, state_name
FROM consumer_complaints
WHERE state_name = 'NY' OR state_name = 'CA'

For the fourth and fifth part was used wild cards.
SELECT company, product_name, issue, state_name
FROM consumer_complaints
WHERE LOWER(product_name) LIKE '%credit%'

SELECT company, product_name, issue, state_name
FROM consumer_complaints
WHERE LOWER(issue) LIKE '%late%'

References
1º Challenge Source: http://www.consumerfinance.gov/data-research/consumer-complaints/

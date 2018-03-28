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

<h4> Challenge 2 </h4>

You are an analytics consultant helping a console games company conduct market research. You have been suppied a dataset consisting of two files:
<ol>
  <li> A historic list of all console games released between 1980 and 2015.</li>
  <li> A historic list of all console plataforms (such as Wii, Play Station, Xbox) and information about them</li>
  </ol>
You have been tasked  to upload the dataset into a Database and perform the following analytics:

<ul>
  <li>Calculate what %  of Global Sales were made in North America</li>
  <li>Extract a view of console game titles ordered by platform name in ascending order and year of release in descending order</li>
  <li>For each game title extract the first four letters of the publisher's name</li>
  <li>Display all consoles platforms which were released either just before Black Friday or just before Christmas (in any year)</li>
  <li>Order the platforms by thier longevity in ascending order (i.e. the platform which was available for the longest at the bottom)</li>
  <li>Demonstrate how to deal with the Game_Year column if the client wants to convert it to a different data type</li>
  <li>Provide recommendation on how to deal with missing data in the file</li>
  
  <h4>Solution for the Second Challenge</h4>
  First of all, after the creation of the two tables console_games and console_date, for the first task was created a new column called global_sales with the the code bellow:
  
  ALTER TABLE console_games
  ADD COLUMN global_sales float8;
  
  Second it were summed the values of each continent sales to get the Global Sales value for each game:
  UPDATE console_games
  SET global_sales = na_sales + eu_sales + jp_sales + other_sales
  
  Third a new column called global_na_sales_percentage was created and populated to show the percentage of Global Sales were made in North America by game:
  ALTER TABLE console_games
  ADD COLUMN global_na_sales_percentage float8;
  
  UPDATE console_games
  SET global_na_sales_percentage = na_sales/global_sales * 100
  WHERE global_sales > 0;
  

# ABSTRACT
#### Assignmnt requirement
There must be three sources:\
    1. A web scraper\
    2. A web API\
    3. Raw text, csv, xml, or excel data\
You must create a conceptual database model (10 points)\
You must download and reformat the data to fit a conceptual database model. (10 points)
You must audit the quality and estimate the amount of data you’ll gather.\
- Audit Validity/ Accuracy \
- Audit Completeness\
- Audit Consistency/Uniformity \

You must clean the data or show that it doesn’t need cleaning (10 points)\
Write a report explaining all of the files, the tests and their results and code. (30 points)

#### Topic
In our project, we are going to build a data base for NBA data.
Data will be obtained from 3 sources according to the requirements.\
We will audit the data and clean it. The a conceptual database schema will be built and the physical data base will be built later.



# CONCLUSIONS
The overall data quality is good. There are lots of missing value in players' total regular stats, 
especially the 3 pointers. This is caused by the changes in rules in NBA history. Offensive and defensive rebound are also introduced later.
The database will have six entities such as player_id, allstar_games and player_total_stats. The detail of their relationship will be introduced in the ERD. 



# CONTRIBUTIONS
#### Zeyu ZHANG: 
- Requested player name and id list from nba.com with nba_api.
- Requested player total status from nba.com with nba_api.
- Find the raw data of player information from kaggle.com.
- Scraped allstar game records with team, year and some other information.
- Scraped all the player list and their game stats from multiple websites(50+) and stored them in one csv file for future usage.
- Audited and cleaned the web scraped data and added key columns to those data. Assigned the correct ID to players that have the same name.
- Design and Drew the ERD for the conceptual database schema.

#### Xuan SHEN:
- Requested player draft history list from nba.com with nba_api.
- Requested player shooting data from nba.com with nba_api.
- Drew the shooting chart for some of the players.
- Audited player id data and solved some missing value problem.
- Audited player total stats data. Fixed the multiple missing value problem
- Audited player draft history. Matched their ID(all missing) with player ID based on name and college.
- Provided advices on the ERD.
            












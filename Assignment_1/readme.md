# ABSTRACT
### Assignmnt requirement
There must be three sources:\
    1. A web scraper\
    2. A web API\
    3. Raw text, csv, xml, or excel data\
You must create a conceptual database model (10 points)\
You must download and reformat the data to fit a conceptual database model. (10 points)
You must audit the quality and estimate the amount of data you’ll gather.
- Audit Validity/ Accuracy 
- Audit Completeness
- Audit Consistency/Uniformity 

You must clean the data or show that it doesn’t need cleaning (10 points)\
Write a report explaining all of the files, the tests and their results and code. (30 points)

### Topic
In our project, we are going to build a data base for NBA data.
Data will be obtained from 3 sources according to the requirements.\
We will audit the data and clean it. The a conceptual database schema will be built and the physical data base will be built later.

# Project and Structure
Details of the code and file structure will be explained in this section.
### Data origin
#### Api
The first data source is acquired with nba_api. This api is a community build api that covered almost every enpoints for nba.com.\
This part of **code** is stored in **/Assignment_1/api** \
The player id/name and draft history can directly be requested as a list from nba.com where player stats need be requested for each player.
Basic data operations are operated with pandas and three csv files are created to stored the data at **/Assignment_1/api/raw_data** including :
- player_id.csv
- player_regulat_totalstats.csv
- player_draft_history.csv

#### Download Data
Second data source is from directly download according to the assignment requirements.\
Source of data is kaggle.com and the detail information can be found in references.\
The file is untouched with rename of columns to maintain the uniformity of naming with all capitals.\
The data is stored at **/Assignment_1/direct_download/raw_data**

#### Web Scraper
Data is scraped from Real GM. We are looking for the all-star data of NBA. There are two parts of data we are looking for: all-star game info and the players detailed stats.
Two python script is designed to scrape the game info first and them follow the game info to scrape the details with repect to each game.

The code is stored at **/Assignment_1/scraper**

To scrape the game info, we need to request the source code of the page. All the information we need is stored in a table and we need to find it with its class 'table'.
 The rows of table are separated with 'tr' and columns with 'td'. Data in each cell is looped through and extracted into the prepared dataframe then stored in **/Assignment_1/scrape/raw_data/**\
Player stats is basically the same except there are two tables contain data from each team that are in the all star that year. To solve this problem, we nee use find_next_sibling to find the next table of correct class.

### Conceptual Database Model
The structure of database is designed and drew with mySQL workbench and saved in **/Assignment_1/database_design** and exported as a pdf file for easy access.

There are total six entities in this database where their source is explained in the previous part. The database has 3 1 to 1 relationships and 2 1 to many relationships.\
The first entity is called player_id. The primary key of this entity is PLAYER_ID. Other attributes is inculded such as FIRST_NAME and LAST_NAME.\
Player_draft_history table has a one to one relationship with player_id. The primary key for draft history is DRAFT_ID while PLAYER_ID from player_id table is the foreign key.
Player_id is requested for those who has a stats record where draft history contains every players including those who never played in the NBA. For this reason Their might be some records that do not appeared in player_id table.\
For player_stats, it's also a one to one relationship with player_id. PK is RECORD_ID where FK is PLAYER_ID from player_id.\
Player_id and allstar_roaster has a one to many relationship. Some of the player may not appears in allstar games at all, but there are players appeared many times.\
PK of allstar_roaster is RECORD_ID where FK are PLAYER_ID from player_id and GAME_ID from allstar_games. Allstar_games is another entity taht has the one to many relationship with allstar_roaster.

 
Detail of the structure, PK/FK design and columons information can be found in the ERD.

### Data Auditing and Cleaning
The data auditing is performed in jupyter notebook. The detail and result can be found at **/Assignment_1/data_process**. Each csv file is audited and cleaned in an individual notebook.\
In general, there are missing data need be dealt with. Some of them have already talked about during the data section such as three pointers and offensive/ defensive rebounds. \
Scraped data had a great quality. Only some formatting changes need be done during the scraping process. However, we need add a unique id, GAME_ID and RECORD_ID, to them to match the ERD.\
This involved some effort to deal with the duplicated name. Using multiple checking values is essential. Adding a few players into the player_id with their unique id is also needed to make sure every record have a PLAYER_ID.
  
Final data is stored with their original name and final at the end. Files are stored at **/Assignment_1/data_process/final_data/**\
These are the data that will eventually fill our database.


# CONCLUSIONS
The overall data quality is good. There are lots of missing value in players' total regular stats, 
especially the 3 pointers. This is caused by the changes in rules in NBA history. Offensive and defensive rebound are also introduced later.
The database will have six entities such as player_id, allstar_games and player_total_stats. The detail of their relationship will be introduced in the ERD. 



# CONTRIBUTIONS
#### Zeyu ZHANG NUID 001495690: 
- Requested player name and id list from nba.com with nba_api.
- Requested player total status from nba.com with nba_api.
- Find the raw data of player information from kaggle.com.
- Scraped allstar game records with team, year and some other information.
- Scraped all the player list and their game stats from multiple websites(50+) and stored them in one csv file for future usage.
- Audited and cleaned the web scraped data and added key columns to those data. Assigned the correct ID to players that have the same name.
- Design and Drew the ERD for the conceptual database schema.

#### Xuan SHEN NUID 001422135:
- Requested player draft history list from nba.com with nba_api.
- Requested player shooting data from nba.com with nba_api.
- Drew the shooting chart for some of the players.
- Audited player id data and solved some missing value problem.
- Audited player total stats data. Fixed the multiple missing value problem
- Audited player draft history. Matched their ID(all missing) with player ID based on name and college.
- Provided advices on the ERD.
            












# ABSTRACT
### Assignmnt requirement
In this assignment, you are assumed to be working for a company called Nerd Analytics and that you are
completely in charge of the database. There are 2 parts:
##### Part 1
Your submission must include:
- A domain (e.g. games, film, databases, cartoons, etc.)
- Conceptual models (entities) for a tweet/post, a Social Media user, a person, and a company.
- Conceptual models (entities) that represent consumers, producers and companies in your chosen domain.
- Conceptual models (entities) for at least two things specific to the domain (e.g. a game, a film, a
song, etc.)
- Relationships that connect the entities.
- Appropriate attributes and keys.
- ER diagrams that illustrate the entire conceptual model.
- The ER diagrams can use standard ER symbols or UML.
- 7 following questions.
    1. What are the ranges, data types and format of all of the attributes in your entities?
    2. When should you use an entity versus attribute? (Example: address of a person could be
modeled as either)
    3. When should you use an entity or relationship, and placement of attributes? (Example: a
manager could be modeled as either)
    4. How did you choose your keys? Which are unique?
    5. Did you model hierarchies using the “ISA” design element? Why or why not?
    6. Were there design alternatives? What are their tradeoffs: entity vs. attribute, entity vs.
    relationship, binary vs. ternary relationships?
    7. Where are you going to find real-world data to populate your model?
##### Part 2
Your submission must include:
- Updated ER diagrams that illustrate the entire conceptual model in a form that directly maps to
SQL. You need to either: incorporate the feedback you are given or respond as to why it isn’t
needed.
- SQL and diagram for the physical model that represents the entire conceptual/physical model.
- SQL that express the queries you are asked to write. Including:\
    a. What user posted this (e.g. tweet, facebook post, IG post, etc.)?\
    b. When did the user post this (e.g. tweet, facebook post, IG post, etc.)?\
    c. What posts has this user posted in the past 24 hours?\
    d. How many post has this user posted in the past 24 hours?\
    e. What keywords/ hashtags are popular?\
    f. What posts are popular?
- At least 5 (10 if two people) distinct use cases of queries that are particular to your domain.
- SQL expressions that express the 5 (10 if two people) use cases of queries that you write.
### Topic and Data
My domain on assignment 2 is about NBA data. Part of my data is from last assignment where I requested with nba_api and scraped from Real GM. 
Other data is also required for this assignment. Tweets data is acquired with tweepy and I also dowmloaded about 10,000 entries of NBA game details 
about all 30 teams since 1983.


 


# References
#### [tweepy](https://tweepy.readthedocs.io/en/v3.5.0/index.html)
Last accessed on Feb.13.2019
#### [Twitter Developer](https://developer.twitter.com/en/docs)
Last accessed on Feb.13.2019
#### [Twitter Developer Doc](https://developer.twitter.com/en/docs)
[Tweet Management](https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/tweet-object.html)\
[List Management](https://developer.twitter.com/en/docs/accounts-and-users/create-manage-lists/api-reference/get-lists-members)\
[Timeline](https://developer.twitter.com/en/docs/tweets/timelines/overview)\
Last accessed on Feb.13.2019
#### [NBA players' twitter](https://www.basketball-reference.com/friv/twitter.html)
Last accessed on Feb.18.2019
#### [Pandas documentation](https://pandas.pydata.org/pandas-docs/stable/index.html)
Last accessed on Jan.22.2019
#### [MySQL Mannul](https://dev.mysql.com/doc/refman/8.0/en/load-data.html)
Last accessed on Feb.19.2019
#### Tweepy example
MINING FOR TWEETS by ALEXANDER GALEA: [Link](https://galeascience.wordpress.com/2016/03/18/collecting-twitter-data-with-python/)\
Last accessed on Feb.13.2019\
Tutorial example by Prof.Brown: [Link](https://github.com/nikbearbrown/INFO_6210/blob/master/Week_2/NBB_%20BeautifulSoup.ipynb)\
Last accessed on Feb.13.2019\
Dump all tweets as CSV of given twitter handle using #Tweepy by arulrajnet: [Link](https://gist.github.com/arulrajnet/0b71842b573d81c7bc23)\
Last accessed on Feb.13.2019
#### Python tutorial
Python Tutorial from : [Link](https://www.w3schools.com/python/python_operators.asp)\
Last accessed on Jan.19.2019

from bs4 import BeautifulSoup
import requests
import lxml
import pandas as pd
import os

# Get current working directory
cwd = os.getcwd()

# Manually enter the ulr to scrape the 2018 nba all star players list
allstar_wiki_url = 'https://en.wikipedia.org/wiki/2018_NBA_All-Star_Game'

# Requested the source code from previous url and stored as text file
result = requests.get(allstar_wiki_url).text

# Make soup object
soup = BeautifulSoup(result,'lxml')

# Find the table with class of multicol. Filter all the links left
# This was found with inspection of page source code
player_table = soup.find('table',{'class':'multicol'})
links = player_table.findAll('a')

# Empty list for refining the product
temp = []
# Get all the link titles. This include players' full name and there team
# However there will be some None value that need be removed
for link in links:
    temp.append (link.get('title'))

# Remove all the None value in list
temp = [i for i in temp if i is not None]

# Separate the name and team
player_name = []
player_team = []

for i in range(0,len(temp)):

    # Odd index contains players' mane. Even index contains team.
    if i % 2 == 0:
        player_name.append(temp[i])
    else:
        player_team.append(temp[i])

# Modify the list to dataframe and add column names
player_name_df = pd.DataFrame(player_name,columns=['fule_name'])
player_team_df = pd.DataFrame(player_team,columns=['team'])


# Combine the data
allstar_players_df = pd.concat([player_name_df, player_team_df], axis=1)


# csv file path
csv_path = cwd + '/allstar_players.csv'

# Save the allstar players
allstar_players_df.to_csv(csv_path)

print('File saved as', csv_path)
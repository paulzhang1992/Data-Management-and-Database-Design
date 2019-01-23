from bs4 import BeautifulSoup
import requests
import pandas as pd
import os

# Get current working directory
cwd = os.getcwd()

# Manually enter the ulr to scrape nba allstar game list
allstar_wiki_url = 'https://basketball.realgm.com/nba/allstar/game'

# Requested the source code from previous url and stored as text file
result = requests.get(allstar_wiki_url).text

# Make soup object
soup = BeautifulSoup(result,'lxml')

# Find the table with class of basketball.
# This was found with inspection of page source code
table_classes = {"class": ["basketball"]}
allstar_table = soup.find('table',table_classes)

# Rows are marked with tr, value of each columns are separated td
rows = allstar_table.findAll('tr')

# Initiate shape dataframe to count the dimension of the table. Loop detail explained in the next loop.
shape = [0,0]
for row in rows:
    shape[1] += 1
    columns = row.find_all('td')
    shape [0] =0
    for column in columns:
        shape [0] += 1

# Initiate allstar_list to store the data
allstar_list = pd.DataFrame(columns=range(0,shape[0]), index = range(0,shape[1]))

row_n=0
for row in rows:
        column_n = 0
        # Within each row look for each element
        columns = row.find_all('td')
        for column in columns:
            # Write the content at designated location
            allstar_list.iat[row_n, column_n] = column.get_text()
            column_n += 1
        row_n += 1

# After reviewing the data frame, the first row is showing the columns label
# Year 1999 does not have a allstar game
allstar_list = allstar_list.drop(index = 0)

allstar_list.columns = ['DATE','WINNING_TEAM', 'WINNING_SCORE', 'LOSING_TEAM', 'LOSING_SCORE', 'VENUE',	'MVP']

# csv file path
csv_path = cwd + '/allstar_games.csv'

# Save the allstar players
allstar_list.to_csv(csv_path)

print('File saved as', csv_path)

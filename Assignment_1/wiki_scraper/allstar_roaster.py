from bs4 import BeautifulSoup
import requests
import pandas as pd
import os
import time

# Get current working directory
cwd = os.getcwd()

allstar_games=pd.read_csv(cwd+'/allstar_games.csv')

year = pd.DatetimeIndex(allstar_games['DATE']).year

player_allstar_list = pd.DataFrame(columns=range(0,16), index = [0])
for i in range (0,year.shape[0]):

    # Manually enter the ulr to scrape the 2018 nba all star players list
    allstar_url = 'https://basketball.realgm.com/nba/allstar/Boxscore/Main/'+str(year[i])

    # Requested the source code from previous url and stored as text file
    result = requests.get(allstar_url).text

    # Make soup object
    soup = BeautifulSoup(result,'lxml')

    # Find the table with class of multicol. Filter all the links left
    # This was found with inspection of page source code
    table_classes = {'class': ['tablesaw',  'swipe', 'sortable']}
    player_table1 = soup.find('table',table_classes)
    player_table2 = player_table1.find_next_sibling('table',table_classes)

    rows = player_table1.find_all('tr')
    # Initiate shape dataframe to count the dimension of the table. Loop detail explained in the next loop.
    shape = [0,0]
    for row in rows:
        shape[1] += 1
        columns = row.find_all('td')
        shape [0] =0
        for column in columns:
            shape [0] += 1

    # Initiate allstar_list to store the data
    player_allstar_list1 = pd.DataFrame(columns=range(0,shape[0]), index = range(0,shape[1]))
    row_n=0
    for row in rows:
            column_n = 0
            # Within each row look for each element
            columns = row.find_all('td')
            for column in columns:
                # Write the content at designated location
                player_allstar_list1.iat[row_n, column_n] = column.get_text()
                column_n += 1
            row_n += 1
    player_allstar_list1 = player_allstar_list1 [1:-3]
    player_allstar_list1['YEAR']=year[i]
    player_allstar_list = player_allstar_list.append(player_allstar_list1)
    rows = player_table2.find_all('tr')
    # Initiate shape dataframe to count the dimension of the table. Loop detail explained in the next loop.
    shape = [0, 0]
    for row in rows:
        shape[1] += 1
        columns = row.find_all('td')
        shape[0] = 0
        for column in columns:
            shape[0] += 1

    # Initiate allstar_list to store the data
    player_allstar_list2 = pd.DataFrame(columns=range(0, shape[0]), index=range(0, shape[1]))
    row_n = 0
    for row in rows:
        column_n = 0
        # Within each row look for each element
        columns = row.find_all('td')
        for column in columns:
            # Write the content at designated location
            player_allstar_list2.iat[row_n, column_n] = column.get_text()
            column_n += 1
        row_n += 1
    player_allstar_list2 = player_allstar_list2[1:-3]
    player_allstar_list2['YEAR'] = year[i]
    player_allstar_list = player_allstar_list.append(player_allstar_list2)
    time.sleep(0.1)
    print('Year '+str(year[i])+' done')



player_allstar_list.columns = ['FULL_NAME','STATUS','POSITION','MIN','FGM-A','FG3M-A','FTM-A','FIC','OREB','DREB','REB','AST','PF','STL','TOV','BLK','PTS','YEAR']



# csv file path
csv_path = cwd + '/allstar_roaster.csv'

# Save the allstar players
player_allstar_list.to_csv(csv_path)

print('File saved as', csv_path)

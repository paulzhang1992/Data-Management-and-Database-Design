import csv
from nba_api.stats.static import players

# Retrieving nba players info
nba_players = players.get_players()

# ie {'id': 2544, 'full_name': 'LeBron James', 'first_name': 'LeBron', 'last_name': 'James'}

# Define the output csv file path
players_tab = "/home/paul/PycharmProjects/Data-Management-and-Database-Design/" \
              "Assignment_1/raw_data/players_tab.csv"

# Write the csv file with nba player info
with open(players_tab, 'w') as f:
    # retrieve the headers in dictionaries
    headers = sorted([k for k, v in nba_players[0].items()])
    csv_data = [headers]


    for d in nba_players:
        csv_data.append([d[h] for h in headers])
    # Fill the csv
    writer = csv.writer(f)
    writer.writerows(csv_data)
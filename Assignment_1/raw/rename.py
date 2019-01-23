import pandas as pd
import os

# Get current working directory
cwd = os.getcwd()

player_info=pd.read_csv(cwd+'/player_info.csv')

player_info.columns = ['NAME','YEAR_START','YAR_END',"POSITION",'HEIGHT','WEIGHT','BIRTH_DATE','COLLEGE']

# csv file path
csv_path = cwd + '/player_info.csv'

# Save the allstar players
player_info.to_csv(csv_path)

print('File saved as', csv_path)
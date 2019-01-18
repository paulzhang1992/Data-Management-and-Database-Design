# Refrences Used For this Project Is Listed Below

#nba_api 
by swar on https://github.com/swar/nba_api
last accessed on Jan 17 2019

#List of dict to csv
Inspired by Matthew Flaschen's code
on https://stackoverflow.com/questions/3086973/how-do-i-convert-this-list-of-dictionaries-to-a-csv-file
    keys = toCSV[0].keys()
    with open('people.csv', 'wb') as output_file:
        dict_writer = csv.DictWriter(output_file, keys)
        dict_writer.writeheader()
        dict_writer.writerows(toCSV)
        

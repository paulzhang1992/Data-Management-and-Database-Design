from auth import Authentication
from tweet_procress import TweetProcress
import pandas as pd


def team_tweet():
    # Created data frame to store the tweets
    tweets_team = pd.DataFrame(columns=["CREATED_AT", "TWEET_ID", "TWEET", "USER_ID", "USER_NAME", "RETWEET_COUNT",
                                      "FAVORITE_COUNT", "HASHTAGS"])
    # Requesting NBA team info from a twitter list from NBA official twitter
    nba_teams = api.list_members('NBA', 'nbateams',count=30)
    team_twitter = pd.DataFrame(columns=["ACCOUNT_ID", "TEAM", "TWITTER_ACC"])
    temp_team = team_twitter.copy()
    '''
    Iterate through the members and extract useful information
    1. account id for each team
    2. team name inculding city and name for each team
    3. screen name for accecc the team twitter page
    '''
    for member in nba_teams:
        temp_team.at[0, "ACCOUNT_ID"] = member.id
        temp_team.at[0, "TEAM"] = member.name
        temp_team.at[0, "TWITTER_ACC"] = member.screen_name
        team_twitter = team_twitter.append(temp_team)
    # Store the list to csv
    team_twitter = team_twitter.reset_index(drop=True)
    # Iterate through each team and scrape their tweets
    for i in range(0, team_twitter.shape[0]):
        account = team_twitter.at[i, "TWITTER_ACC"]
        # Use TweetProcress to modify the team tweet object
        current_team = TweetProcress()
        current_team_tweets = current_team.request_tweet(screen_name=account, count=200, pages=25)
        # returns the tweet data frame
        tweets_team = tweets_team.append(current_team_tweets)
        file = "Tweet "+team_twitter.at[i,"TEAM"]+".csv"
        # Store tweets for each team
        current_team_tweets.to_csv("rawData//team//"+file, index=False)
        print(file+" is done")
    # One single csv contains all the tweets
    tweets_team.to_csv("rawData//team//tweets_team.csv", index=False)


def player_tweet():
    # Created data frame to store the tweets
    tweets_player = pd.DataFrame(columns=["CREATED_AT", "TWEET_ID", "TWEET", "USER_ID", "USER_NAME", "RETWEET_COUNT",
                                      "FAVORITE_COUNT", "HASHTAGS"])
    # Open the csv contains selected 20 players from NBA
    player_df = pd.read_csv("rawData//player//top20_player.csv")
    # Iterate through each player and scrape their tweets
    for i in range(0, player_df.shape[0]):
        account = player_df.at[i, "TWITTER_ACC"]
        current_player = TweetProcress()
        current_player_tweets = current_player.request_tweet(screen_name=account, count=200, pages=20)
        tweets_player = tweets_player.append(current_player_tweets)
        file = "Tweet "+player_df.at[i,"FULL_NAME"]+".csv"
        current_player_tweets.to_csv("rawData//player//"+file, index=False)
        print(file+" is done")
    # One single csv contains all the tweets
    tweets_player.to_csv("rawData//player//tweets_player.csv", index=False)

def fan_tweet():


if __name__ == "__main__":
    #team_tweet()
    #player_tweet()
    fan_tweet()









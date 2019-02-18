from auth import Authentication
from tweet_procress import TweetProcress
import pandas as pd


def team_tweet():
    tweets_team = pd.DataFrame(columns=["CREATED_AT", "TWEET_ID", "TWEET", "USER_ID", "USER_NAME", "RETWEET_COUNT",
                                      "FAVORITE_COUNT", "HASHTAGS"])
    nba_teams = api.list_members('NBA', 'nbateams',count=30)
    team_twitter = pd.DataFrame(columns=["ACCOUNT_ID", "TEAM", "TWITTER_ACC"])
    temp_team = team_twitter.copy()
    for member in nba_teams:
        temp_team.at[0, "ACCOUNT_ID"] = member.id
        temp_team.at[0, "TEAM"] = member.name
        temp_team.at[0, "TWITTER_ACC"] = member.screen_name
        team_twitter = team_twitter.append(temp_team)
    team_twitter = team_twitter.reset_index(drop=True)
    for i in range(0, team_twitter.shape[0]):
        account = team_twitter.at[i, "TWITTER_ACC"]
        current_team = TweetProcress()
        current_team_tweets = current_team.request_tweet(screen_name=account, count=200, pages=25)
        tweets_team = tweets_team.append(current_team_tweets)
        file = "Tweet "+team_twitter.at[i,"TEAM"]+".csv"
        current_team_tweets.to_csv("rawData//team//"+file, index=False)
        print(file+" is done")
    tweets_team.to_csv("rawData//team//tweets_team.csv", index=False)


def player_tweet():
    tweets_player = pd.DataFrame(columns=["CREATED_AT", "TWEET_ID", "TWEET", "USER_ID", "USER_NAME", "RETWEET_COUNT",
                                      "FAVORITE_COUNT", "HASHTAGS"])
    player_df = pd.read_csv("rawData//player//top20_player.csv")
    for i in range(0, player_df.shape[0]):
        account = player_df.at[i, "TWITTER_ACC"]
        current_player = TweetProcress()
        current_player_tweets = current_player.request_tweet(screen_name=account, count=200, pages=20)
        tweets_player = tweets_player.append(current_player_tweets)
        file = "Tweet "+player_df.at[i,"FULL_NAME"]+".csv"
        current_player_tweets.to_csv("rawData//player//"+file, index=False)
        print(file+" is done")
    tweets_player.to_csv("rawData//player//tweets_player.csv", index=False)


if __name__ == "__main__":
    # team_tweet()
    player_tweet()









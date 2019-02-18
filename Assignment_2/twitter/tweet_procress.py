import pandas as pd
import tweepy
from auth import Authentication


class TweetProcress:
    def __init__(self):
        self.auth = Authentication()
        self.api = Authentication.load_api(self.auth)

    """
    Info we are extracting from tweets
    1. created_at        "created_at":"Wed Aug 27 13:08:45 +0000 2008"
    2. id                tweet id
    3. text              tweet
    4. user.id           user ID
    5. user.name         user name
    6. place.country     country "United States" (might be None)
        # might not include
    7. reply_count       number of replies
        # has some issue
    8. retweet_count     number of retweets
    9. favorite_count    number of likes
    10.entities          dict including hashtags (.entities["hashtags"][0]["text"] for hashtags text)
    """

    def request_tweet(self, screen_name, count, pages):
        tweets_df = pd.DataFrame(columns=["CREATED_AT", "TWEET_ID", "TWEET", "USER_ID", "USER_NAME", "RETWEET_COUNT",
                                          "FAVORITE_COUNT", "HASHTAGS"])
        temp_tweet = tweets_df.copy()
        for pages in tweepy.Cursor(self.api.user_timeline, screen_name=screen_name,count=count).pages(pages):
            for tweet in pages:
                hashtags = []
                temp_tweet.at[0, "CREATED_AT"] = tweet.created_at
                temp_tweet.at[0, "TWEET_ID"] = tweet.id
                temp_tweet.at[0, "TWEET"] = tweet.text
                temp_tweet.at[0, "USER_ID"] = tweet.user.id
                temp_tweet.at[0, "USER_NAME"] = tweet.user.name
                temp_tweet.at[0, "RETWEET_COUNT"] = tweet.retweet_count
                temp_tweet.at[0, "FAVORITE_COUNT"] = tweet.favorite_count
                # Get the numbers of hashtags
                length = len(tweet.entities["hashtags"])
                for i in range(0, length):
                    # Get the text of each hashtag and add to the hashtags list
                    hashtag = tweet.entities["hashtags"][i]["text"]
                    hashtags.append(hashtag)
                    temp_tweet.at[0, "HASHTAGS"] = hashtags
                tweets_df = tweets_df.append(temp_tweet)
        return tweets_df

import tweepy


class Authentication:

    def __init__(self):
        # __consumer_key,__consumer_secret,__access_token,__access_token_secret
        self.__consumer_key = ""
        self.__consumer_secret = ""
        self.__access_token = ""
        self.__access_token_secret = ""

    def get_consumer_key(self):
        return self.__consumer_key

    def get_consumer_secret(self):
        return self.__consumer_secret

    def get_access_key(self):
        return self.__access_token

    def get_access_secret(self):
        return self.__access_token_secret

    def load_api(self):
        auth = tweepy.OAuthHandler(self.__consumer_key, self.__consumer_secret)
        auth.set_access_token(self.__access_token, self.__access_token_secret)
        return tweepy.API(auth)


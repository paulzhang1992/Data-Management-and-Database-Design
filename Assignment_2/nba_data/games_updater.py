import datetime
from nba_api.stats.endpoints import scoreboardv2
from nba_api.stats.endpoints import boxscoretraditionalv2
import pandas as pd
import re


"""
Request stats each day for yesterday's games:
    - NBA stats
    1. games_by_team                # Current goal
    2. game_details                 # New table
    3. player_total_stats           # To-Do
    - Twitter
    4. tweets                       # To-Do
    5. hashtags                     # To-Do With tweets

Update the date base with data:
    1. everyday stats
    2. total stats
    3. twitter
"""


class StatsFinder:
    def __init__(self):
        self.__yesterday__ = datetime.datetime.now() - datetime.timedelta(1)
        self.__game_date__ = str(self.__yesterday__.year) + "-" + str(self.__yesterday__.month) + "-" + str(self.__yesterday__.day)
        self.__games__ = pd.DataFrame(columns=[])
        self.__pattern__ = r"^\d{4}-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])$"

    def set_date(self, date=""):
        """
        Set the date to desired date. The default date is set to previous day of current date.
        :param date: String. Default empty. Format of date need be in "yyyy-mm-dd"
        :return: void
        """
        if re.match(self.__pattern__, date):
            self.__game_date__ = re.match(self.__pattern__, date)
        else:
            print("Set date fail. Please use yyyy-mm-dd for date.")

    def get_date(self):
        return self.__game_date__

    def game_finder(self):
        """
        Use set_date to look for games on different date
        :return: pandas series of game ids on select day
        """
        score_board = scoreboardv2.ScoreboardV2(game_date=self.__game_date__)
        game_id = pd.DataFrame(score_board.get_data_frames()[0]).loc[:, "GAME_ID"]
        return game_id

    @staticmethod
    def game_stats(ids=pd.Series):
        """
        Request game stats with nba_api
        :param ids:  pandas series contains game id string. ie "0021800926"
        :return:    To do. Return pandas data frame with team game stats
        """
        for gid in ids:
            box_score = boxscoretraditionalv2.BoxScoreTraditionalV2(game_id=gid)
            team_stats = box_score.get_data_frames()[1]
            print(team_stats)
        return 0

    @staticmethod
    def player_stats(ids=pd.Series):
        """
        Request game stats details of each player with nba_api
        :param ids: pandas series contains game id string. ie "0021800926"
        :return:     To do. Return pandas data frame with each player's game stats
        """
        for gid in ids:
            box_score = boxscoretraditionalv2.BoxScoreTraditionalV2(game_id=gid)
            players_stats = box_score.get_data_frames()[0]
            print(players_stats)
        return 0


class SQLUpdater:
    def __init__(self):
        self.__ip_address__ = ""
        self.__database__ = ""
        self.__user_name__ = ""
        self.__password__ = ""


def main():
    today_game = StatsFinder()
    return today_game


if __name__ == '__main__':
    test = main()
    test_game_id = test.game_finder()
    test.game_stats(test_game_id)
    test.player_stats(test_game_id)


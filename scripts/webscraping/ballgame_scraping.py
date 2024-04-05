import sys
import os
from selenium import webdriver
from selenium.webdriver.common.by import By

def help():
  print("Ballgame Stat Scraper")
  print("  European baseball and softball stats web scrapper")
  print("  ")
  print("  To execute:")
  print("  python ballgame_scraping.py [-b] [--batch] [-h] [--help]")

def start_web(year, sport, category, stat):
  # https://www.baseballsoftball.be/en/events/2023-baseball-d1/stats/general/all/batting
  # https://www.fibs.it/en/events/2023-serie-a-baseball/stats/general/all/batting
  # https://stats.knbsbstats.nl/en/events/2023-hoofdklasse-honkbal/stats/general/all/batting
  # https://www.rfebs.es/es/events/2023-spanish-baseball-league/stats/general/all/batting
  # https://stats.baseboll-softboll.se/en/events/2023-elitserien-baseboll/stats/general/all/batting
  # https://stats.britishbaseball.org.uk/en/events/2023-nbl/stats/general/all/batting
  # https://www.baseballsoftball.at/de/events/baseball-bundesliga-2023/stats/general/all/batting

  dir_path = os.path.dirname(os.path.realpath(__file__))

  statistics = ('https://www.baseballsoftball.be/en/events/'
        + f'{year}-{sport}-{category}/stats/general/all/{stat}')

  driver.get(statistics)
  # s = randint(10, 15)
  # print(f'*** Sleeping for {s} seconds to let the page to load')
  # sleep(s)
  xp_results_table = '//*[@class = "table-condensed table table-bordered table-hover"]'
  xp_results_table = '/html/body/div[1]/div/div[3]/div[2]/div[1]/div[1]/div[2]/div[4]/div[2]/table/tbody'

  # ID = "id"
  # NAME = "name"
  # XPATH = "xpath"
  # LINK_TEXT = "link text"
  # PARTIAL_LINK_TEXT = "partial link text"
  # TAG_NAME = "tag name"
  # CLASS_NAME = "class name"
  # CSS_SELECTOR = "css selector"


  bootstrap_table = driver.find_elements(By.CLASS_NAME, '')
  # player_containers = driver.find_elements(By.XPATH, xp_results_table)
  print(f"*** There are {len(bootstrap_table)} tables returned")
  print(bootstrap_table)

def main():
  driver = webdriver.Chrome()
  return driver


if __name__ == "__main__":
  print("Ballgame Stats Scraper")

  # check if the script is receiving parameters
  parameters = sys.argv
  batch = False
  if len(parameters) > 1:
      if sys.argv[1] in ("-h", "--help"):
          help()
          exit()
      elif sys.argv[1] in ("-b", "--batch"):
          batch = True

  year = '2023'
  sport = 'baseball'
  category = 'd1'
  stat = 'batting'

  driver = main()
  start_web(year, sport, category, stat)

#    driver.quit()

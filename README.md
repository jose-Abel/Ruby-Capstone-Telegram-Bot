![](https://img.shields.io/badge/Microverse-blueviolet)


# Ruby Capstone Telegram Bot

The Microverse Capstone project for the Ruby module called "Build your own Bot" where I have to build a bot from one platform either Slack, Twitter or Telegram. I've choosen to build a bot from Telegram that gives me the price of the top 10 crypto currencies by making an API call to the coinmarketcap API and providing the latest news, tweets and reddits post by using the gem crypto-news-api.

![screenshot](./app_screenshot_1.png)

![screenshot](./app_screenshot_2.png)

![screenshot](./app_screenshot_3.png)

![screenshot](./app_screenshot_4.png)


For this implementation of a Telegram Bot I created 2 classes and the main file where it runs the connection to the Bot. The files are:

- The Crypto Info class that initializes with the url for the coinmarketcap API, that has hte read and write getter methods. It has the public method top_10_listings in charge of calling the private method latest_listings and taking the hash that comes from that call and by creating a new array it gets the information needed from that hash and pass it to the new array, returninng the new array as output. The latest_listings private method is in charge of defining the endpoint for the API call and pass it onto the get_request private method that makes the API call.

- The Crypto News this class was build with the API from crypto-news-api gem, initializes defining the environment variable for API key. It has the public methods top_news, top_news_by_coin, top_tweets_by_coin, top_reddits_by_coin, latest_reddit_tweets_by_coin, and the private methods top_5 and helper_method. The top_news method calls the getTopNews from the gem, and pass the resulting hash to the private method top_5, for top_news_by_coin methods does the same as the previous method, calling the getTopNewsByCoin from the gem but it takes a coin as an argument. The top_tweets_by_coin method calls the getTopTweetsByCoin from the gem and through a while loop it gets the data needed from the returning hash and save it into an array to output that array. The previous methodology is the same applied in the methods top_reddits_by_coin and latest_reddit_tweets_by_coin. Lastly, the private method helper_method abstract some functionality that is applied to top_news and top_news_by_coin methods.

- The main file has the connection to the Bot Client from Telegram. It opens the connection and through a case when conditional it instantiate an object form the other classes and call the respective method depending in the user command choice.

## To run the Bot

In order to run this bot, first create a .env file in the root of this project. Assigned 3 variable for the 3 API keys in the .env file, the API keys are the telegram token, the coinmarketcap API key and the crypto-news-api key. This keys has to be stored in variables with the following names TELEGRAM_TOKEN_KEY for the telegram token, COINMARKETCAP_API for the coinmarketcap API key and CRYPTO_NEWS for the crypto news API key. Then visit the Telegram channel "pricetop10crypto" and run the command /start.

This Telegram Bot has the following commands:

/start : Run the program starting the bot

/price : Show the price of the top 10 cryptocurrencies

/topnews : Show the top 3 news of all of the cryptocurrencies combined

/tncbitcoin : Show the top 3 news of bitcoin 

/tncethereum : Show the top 3 news of ethereum 

/tnctether : Show the top 3 news of tether 

/tncripple : Show the top 3 news of ripple

/ttcbitcoin : Show the top 3 tweets of bitcoin

/ttcethereum : Show the top 3 tweets of ethereum

/ttctether : Show the top 3 tweets of tether

/ttcripple : Show the top 3 tweets of ripple

/trcbitcoin : Show the top 3 reddit posts of bitcoin

/trcethereum : Show the top 3 reddit posts of ethereum

trctether : Show the top 3 reddit posts of tether

/trcripple : Show the top 3 reddit posts of ripple

/ltrcbitcoin : Show the latest 3 reddit comments and tweets posts of bitcoin

/ltrcethereum : Show the latest 3 reddit comments and tweets posts of ethereum

/ltrctether : Show the latest 3 reddit comments and tweets posts of tether

/ltrcripple : Show the latest 3 reddit comments and tweets posts of ripple


## Built With
- Ruby programming language
- VsCode
- Telegram channel BotFather

### Ruby standards libraries:
- uri
- net/http

### Gem libraries:
- bundler
- dotenv
- json
- telegram-bot-ruby
- crypto-news-api

### Documentations
- https://docs.ruby-lang.org/
- https://core.telegram.org/bots/api
- https://coinmarketcap.com/api/documentation/v1/
- https://www.rubydoc.info/gems/crypto-news-api/
- https://hackernoon.com/how-to-create-a-telegram-bot-using-ruby-n7ag32c1

## Author

- 👤GitHub: [Jose Abel Ramirez](https://github.com/jose-Abel)
- Linkedin: [Jose Abel Ramirez Frontany](https://www.linkedin.com/in/jose-abel-ramirez-frontany-7674a842/)

## Getting Started
You can clone this code anytime and run it with the Ruby interpreter in the Windows console or Unix terminal by typing 'ruby bin/main.rb' or it can run in Unix OS by typing 'bin/main.rb' in the terminal, without the 'ruby' interpreter command, since the main file has the shebang instruction at the top that makes it an executable file.

### Setup
You can either copy the code with git clone or with any other method and run it on your local environment. The commands to clone it and then run the game are:
- git clone https://github.com/jose-Abel/Ruby-Capstone-Telegram-Bot.git
- cd Ruby-Capstone-Telegram-Bot
- bin/main.rb (if you are in Linux or Mac)
- ruby bin/main.rb (for Windows)

### Run tests
Run the tests for the linters.yml and rubocop and everything pass. The instructions to setup this tests are at this repository: [Rubocop instructions](https://github.com/microverseinc/linters-config/tree/master/ruby)

For the linters, this tests runs once you make a PR, if you have it in the respective folder. In order to have this tests, after cloning this project:
 - cd Ruby-Capstone-Telegram-Bot
- From the root of this project create the folders .github/workflows
- Add a copy of [.github/workflows/tests.yml](https://github.com/microverseinc/linters-config/blob/master/ruby/.github/workflows/tests.yml) to the .github/workflows

To download rubocop and run the tests on your local environment, this are the commands to type in the Linux, Mac terminal or Windows cmd:
- gem 'rubocop'
- cd Ruby-Capstone-Telegram-Bot
- copy this file [.rubocop.yml](https://github.com/microverseinc/linters-config/blob/master/ruby/.rubocop.yml) in the root directory of the project
- type in the terminal 'rubocop'

The commands to install and run rspecs in the Linux, Mac terminal or Windows cmd are:

- gem install rspec
- cd Ruby-Capstone-Telegram-Bot
- rspec --init
After creating the tests, to run them from the root directory:
- rspec

### Acknowledgments
Appreciate the Ruby Team, and a special acknowledgment to Microverse for pushing us further into accomplishing our goals.


## 📝 License
This project is MIT licensed.


## Show your support
Give a ⭐️ if you like this project!
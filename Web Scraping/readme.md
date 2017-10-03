# Web Scraping

## Original web page

We wanted to capture the game schedule information of the Brooklyn Nets on ESPN.com.



We first downloaded the HTML source code of the page:

Then we applied regular expressions to capture the date, opponent, home and time information.


For example, we used the below regular expression to obtain the opponent informatio:

```
opponent_game <- "([A-Za-z]+)?\\s?[A-Za-z]+</a></li></ul></td><td>[0-9]{1,2}:[0-9]{1,2}\\sPM"
opponent_log <- grepl(nets1718, pattern = opponent_game)
matches_opponent <- gregexpr(opponent_game, nets1718[opponent_log])
opponent_list <- regmatches(nets1718[home_log], matches_opponent)
head(opponent_list)
opponent <- unlist(opponent_list)
opponent <- gsub("</a></li></ul></td><td>[0-9]{1,2}:[0-9]{1,2}\\sPM","",opponent)
```

The first 10 rows of our dataframe perfectly matches the information of the first 10 games as seen from the
web browser.

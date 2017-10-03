# Web Scraping

## Original web page

We wanted to capture the game schedule information of the Brooklyn Nets on ESPN.com.

![netsschedule](https://user-images.githubusercontent.com/29837880/31142550-9d55d9cc-a848-11e7-802f-fd0d2b16d9ba.PNG)

We first downloaded the HTML source code of the page:

![sourcecode](https://user-images.githubusercontent.com/29837880/31142539-9780b530-a848-11e7-928a-c9ccd3d5ef81.PNG)

## Information capture

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
## Dataframe created

Finally we created a dataframe storing time, opponent, date and home game information.

![dataframe](https://user-images.githubusercontent.com/29837880/31142538-97772f60-a848-11e7-8822-5d2bdca09e1c.PNG)

The first 10 rows of our dataframe perfectly match the information of the first 10 games as seen from the
web browser.

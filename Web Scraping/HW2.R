nets1718 <- readLines("NetsSchedule.html", warn = FALSE)
length(nets1718)
sum(nchar(nets1718))
max(nchar(nets1718))

#They are playing first against Indiana on Wed, October 18 at 7:00pm
#They are playing last against Boston on Wed, April 11 at 8:00pm

date_game <- "[A-Z][a-z]{2},\\s[A-Z][a-z]{2}\\s[0-9]{1,2}"
length((grep(nets1718,pattern = date_game)))
date_log <- grepl(nets1718,pattern = date_game)
matches_date <- gregexpr(date_game, nets1718[date_log])
head(matches_date,1)
date_list <- regmatches(nets1718[date_log], matches_date)
date <- unlist(date_list)
head(date,4)

time_game <- "[0-9]{1,2}:[0-9]{1,2}\\sPM"
length((grep(nets1718, pattern = time_game)))
time_log <- grepl(nets1718, pattern = time_game)
matches_time <- gregexpr(time_game, nets1718[time_log])
time_list <- regmatches(nets1718[time_log], matches_time)
time <- unlist(time_list)

home_game <- "class=\"game-status\">(vs|@)"
length((grep(nets1718, pattern = home_game)))
home_log <- grepl(nets1718, pattern = home_game)
matches_home <- gregexpr(home_game, nets1718[home_log])
home_list <- regmatches(nets1718[home_log], matches_home)
head(home_list)
home <- unlist(home_list)
home <- gsub("class=\"game-status\">","",home)
home <- as.numeric(home == "vs")

opponent_game <- "([A-Za-z]+)?\\s?[A-Za-z]+</a></li></ul></td><td>[0-9]{1,2}:[0-9]{1,2}\\sPM"
length((grep(nets1718, pattern = opponent_game)))
opponent_log <- grepl(nets1718, pattern = opponent_game)
matches_opponent <- gregexpr(opponent_game, nets1718[opponent_log])
opponent_list <- regmatches(nets1718[home_log], matches_opponent)
head(opponent_list)
opponent <- unlist(opponent_list)
opponent <- gsub("</a></li></ul></td><td>[0-9]{1,2}:[0-9]{1,2}\\sPM","",opponent)
head(opponent)
head(data.frame(date, time, opponent, home),10)

Workout01
================
Lucy Brooke
3/10/2019

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    ## # A tibble: 5 x 4
    ## # Groups:   name, total, made [5]
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Kevin Durant     915   495      54.1
    ## 2 Andre Iguodala   371   192      51.8
    ## 3 Klay Thompson   1220   575      47.1
    ## 4 Stephen Curry   1250   584      46.7
    ## 5 Draymond Green   578   245      42.4

    ## # A tibble: 5 x 4
    ## # Groups:   name, total, made [5]
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Andre Iguodala   210   134      63.8
    ## 2 Kevin Durant     643   390      60.7
    ## 3 Stephen Curry    563   304      54.0
    ## 4 Klay Thompson    640   329      51.4
    ## 5 Draymond Green   346   171      49.4

    ## # A tibble: 5 x 4
    ## # Groups:   name, total, made [5]
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Klay Thompson    580   246      42.4
    ## 2 Stephen Curry    687   280      40.8
    ## 3 Kevin Durant     272   105      38.6
    ## 4 Andre Iguodala   161    58      36.0
    ## 5 Draymond Green   232    74      31.9

**Introduction**
================

Stephen Curry's name -- even to the most casual of NBA basketball fans -- never fails to conjure up an image of a three-pointer swishing through the net. He is widely regarded as one of the greats, a [record breaker](https://www.basketball-reference.com/leaders/fg3_season.html), and according to Basketball Reference, he's a [point guard](https://www.basketball-reference.com/players/c/curryst01.html). But according to his data, does he play like a point guard?

This report primarily compares the shooting data of two players on the NBA team the Golden State Warriors: Stephen Curry and Klay Thompson.

**Background**
==============

The Golden State Warriors have dominated the NBA in recent years. The season that this dataset was created (2016-17), the team won the NBA championships. In 2017-18, they placed second; in the 2018-19 season, they won again. Unsurprisingly, all the players in this report are considered to be some of the best currently playing.

As this report involves player positions and/or expected responsibilities on the court, here is a quick breakdown.

[Andre Iguodala](https://www.basketball-reference.com/players/i/iguodan01.html) is a **small forward**.

[Draymond Green](https://www.basketball-reference.com/players/g/greendr01.html) is a **power forward**.

[Kevin Durant](https://www.basketball-reference.com/players/d/duranke01.html) is a **small forward/power forward/shooting guard**. For the season in question, he played as a [power forward](https://www.basketball-reference.com/teams/GSW/2017.html).

[Klay Thompson](https://www.basketball-reference.com/players/t/thompkl01.html) is a **shooting guard**. Notably, a shooting guard "is a scoring position and is often be filled by the team's best outside shooter" (<https://www.basketballforcoaches.com/basketball-positions/>), although a great shooting guard should be able to make shots from anywhere on the court.

[Stephen Curry](https://www.basketball-reference.com/players/c/curryst01.html) is a **point guard**. A traditional point guard is responsible for distributing the ball to those in scoring positions, like a shooting guard. However, a point guard should also have a good outside/3pt shot. (<https://www.basketballforcoaches.com/basketball-positions/>)

**Data/Analysis**
=================

Here are shot charts for all five of the players considered from the Golden State Warriors.

![Shot charts for all five players.](https://raw.githubusercontent.com/stat133-sp19/hw-stat133-lucybrooke/master/workout01/images/gsw-shot-charts.png)

When taking a closer look, Thompson and Curry's shot charts seem practically interchangeable. Curry understandably sees a higher concentration of shots outside the three-point line; but other than that, they seem to be filling the same role.

![Shot data for Klay Thompson, a shooting guard.](https://raw.githubusercontent.com/stat133-sp19/hw-stat133-lucybrooke/master/workout01/images/klay-thompson-shot-chart.png) ![Shot data for Stephen Curry, a point guard.](https://raw.githubusercontent.com/stat133-sp19/hw-stat133-lucybrooke/master/workout01/images/stephen-curry-shot-chart.png)

``` r
overall_shooting_perc
```

    ## # A tibble: 5 x 4
    ## # Groups:   name, total, made [5]
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Kevin Durant     915   495      54.1
    ## 2 Andre Iguodala   371   192      51.8
    ## 3 Klay Thompson   1220   575      47.1
    ## 4 Stephen Curry   1250   584      46.7
    ## 5 Draymond Green   578   245      42.4

For overall shooting percentages, Thompson and Curry are -- surprisingly or unsurprisingly -- not at the top of the list. They do have, however, very similar values. Klay Thompson is squarely in the middle with roughly a 47.1% success rate, and Stephen Curry is right below him with a 46.7%.

Perhaps even more interestingly, both players took almost exactly the same number of total shots; Curry ended the season with a whopping 1250, Thompson with 1220.

The fact that Curry, who as a point guard is supposed to be distributing/creating scoring chances for other players/moving the ball down the court, is taking essentially the same number of scoring chances as a shooting guard suggests that Curry is not playing a traditional point guard role.

``` r
two_pt_shooting_perc %>%
  arrange(desc(total))
```

    ## # A tibble: 5 x 4
    ## # Groups:   name, total, made [5]
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Kevin Durant     643   390      60.7
    ## 2 Klay Thompson    640   329      51.4
    ## 3 Stephen Curry    563   304      54.0
    ## 4 Draymond Green   346   171      49.4
    ## 5 Andre Iguodala   210   134      63.8

Here, the total 2pt field goals taken by Curry represent a more standard breakdown of points -- Durant and Thompson take the most 2pt shots, while Curry stays more outside.

``` r
three_pt_shooting_perc
```

    ## # A tibble: 5 x 4
    ## # Groups:   name, total, made [5]
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Klay Thompson    580   246      42.4
    ## 2 Stephen Curry    687   280      40.8
    ## 3 Kevin Durant     272   105      38.6
    ## 4 Andre Iguodala   161    58      36.0
    ## 5 Draymond Green   232    74      31.9

When the data is limited to three point shots, the similarity of the roles Thompson and Curry are playing continues to stand out. Ideally both a traditional point guard and a shooting guard should have a strong outside shot, so the similarity here should not be too unusual. Funnily enough, even though Curry has a reputation for excelling at 3-pointers, Thompson beats him for accuracy (but Curry still has him -- and everybody -- for total number of threes).

**Conclusion**
==============

From the shot charts and breakdowns of shooting data, it seems that Stephen Curry is eschewing a traditional point guard role in favor of a style of play that mixes elements of point guard and shooting guard.

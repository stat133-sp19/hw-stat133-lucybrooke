data-dictionary
================
Lucy Brooke
3/10/2019

Data Dictionary
===============

### Variable Descriptions

-   **name**: the name of the player. Data type: character.

-   **team\_name**: the name of the team that the player is on; in this set, all players on the Golden State Warriors. Data type: character.

-   **game\_date**: the date a game was played, in the traditional United States format Month/Day/Year. Data type: character.

-   **season**: a year denoting the sporting season in which games are played. Data type: numeric.

-   **period**: an NBA game is divided in 4 periods of 12 mins each. For example, a value for period = 1 refers to the first period (the first 12 mins of the game). Data type: numeric.

-   **minutes\_remaining** and **seconds\_remaining**: the amount of time in minutes and seconds, respectively, that remained to be played in a given period. Data type: numeric.

-   **shot\_made\_flag**: whether a shot was made (y) or missed (n). Data type: character.

-   **action\_type**: the basketball moves used by players, either to pass by defenders to gain access to the basket, or to get a clean pass to a teammate to score a two pointer or three pointer. Data type: character.

-   **shot\_type**: whether a shot is a 2-point field goal, or a 3-point field goal. Data type: character.

-   **shot\_distance**: distance to the basket (measured in feet). Data type: integer.

-   **opponent**: the name of the team playing against the Golden State Warriors. Data type: character.

-   **x** and **y**: the court coordinates (measured in inches) where a shot occurred. Data type: integer.

Created Variables
-----------------

-   **minutes**: a number giving the minute when a shot occurred; minimum value: 1 minute; maximum value: 48 minutes. Data type: numeric.

-   **total**: total number of shots taken by a player. Data type: integer.

-   **made**: total number of shots made by a player. Data type: integer.

-   **perc\_made**: percentage of shots taken that were made. Example format: 51.361. Data type: integer.

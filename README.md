# Tournament_Results
Introduction

This is a python module that uses the PostgreSQL database to keep track of players and matches in a game tournament using swiss system

Code Templates

tournament.py - This file provides access to database via a library of functions required for tournament game.
tournament_test.py - This is a client program for testing implementaion of code which uses functions written in the tournament.py module.
tournament.sql - This file describes the database schema.
Functions in tournament.py

registerPlayer(name)
Adds a player to the tournament by putting an entry in the database. The database assigns a unique ID number to the player.

countPlayers()
Returns the number of currently registered players.

deletePlayers()
Clear out all the player records from the database.

reportMatch(winner, loser)
Stores the outcome of a single match between two players in the database.

deleteMatches()
Clear out all the match records from the database.

playerStandings()
Returns a list of (id, name, wins, matches) for each player, sorted by the number of wins each player has.

swissPairings()
This function generates and returns a list of pairings according to the Swiss system. This function use playerStandings() to find the ranking of players.

Instructions

Set Up Database
Set up database using following command:

 $ psql -f tournament.sql
 
Run Module

$ python tournament_test.py 
Contact GitHub 

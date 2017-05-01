-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

Drop database if exists tournament;

Drop table if exists player cascade;

Drop table if exists match cascade;

Drop view if exists result;

create database tournament;

\c tournament;

create table player(id serial PRIMARY KEY,
					name text);


create table match(match_id serial PRIMARY KEY,
					winner Integer,
					loser Integer,
					Foreign key (winner) references player (id),
					Foreign key (loser) references player (id));


create view result as select player.id, player.name,
	COALESCE((select count(winner) from match where player.id = match.winner),0) as wins,
	COALESCE((select count(*) from match where player.id = match.winner or player.id = match.loser),0) as matches
	from player left join match on player.id = match.winner group by player.id order by wins desc;
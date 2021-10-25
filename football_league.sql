PRAGMA foreign_keys = ON;


CREATE TABLE tournaments (
  	tournament_id INTEGER NOT NULL PRIMARY KEY,
	tournament_name TEXT
);




CREATE TABLE teamType (
  	teamtype_id INTEGER NOT NULL PRIMARY KEY
);

CREATE TABLE teams (
	team_id INTEGER NOT NULL PRIMARY KEY,
  	team_name TEXT,
  	teamtype_id TEXT,
  	tournament_id TEXT,
  	FOREIGN KEY (teamtype_id) REFERENCES TeamType(teamtype_id),
  	FOREIGN KEY (tournament_id) REFERENCES Tournaments(tournament_id)
  	
);

CREATE TABLE players (
	player_id INTEGER NOT NULL PRIMARY KEY,
  	first_name TEXT,
  	last_name TEXT,
  	team_id INTEGER NOT NULL,
  	FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE coaches (
	coach_id INTEGER NOT NULL PRIMARY KEY,
  	first_name TEXT,
  	last_name TEXT,
  	team_id INTEGER NOT NULL,
  	FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);



--create
INSERT INTO tournaments (tournament_id, tournament_name) VALUES (1, "National");
INSERT INTO tournaments (tournament_id, tournament_name) VALUES (2, "World");

INSERT INTO teamType (teamtype_id) VALUES (1);

INSERT INTO teams (team_id, team_name, teamtype_id, tournament_id) VALUES(1, "some UK team", 1, 1);

INSERT INTO players (player_id, first_name, last_name, team_id) VALUES(1, "Julien", "Mahe-Crenn", 1);

INSERT INTO players (player_id, first_name, last_name, team_id) VALUES(2, "Daniel", "Hope", 1);

INSERT INTO coaches VALUES (1, "Myles", "Gordon", 1);


--read all
SELECT * FROM tournaments;
SELECT * FROM teamType;
SELECT * FROM teams;
SELECT * FROM players;
SELECT * FROM coaches;

--update
UPDATE coaches SET first_name="Heather", last_name="Paterson" WHERE coach_id=1;
--select specific coach
SELECT first_name, last_name FROM coaches WHERE coach_id=1;

--finding the name of the team that is linked to the coach
SELECT teams.team_name FROM coaches JOIN teams ON coaches.team_id = teams.team_id WHERE coaches.last_name="Paterson";

--finding the name of the team that is linked to the players
SELECT teams.team_name FROM players JOIN teams ON players.team_id = teams.team_id WHERE players.last_name="Hope";


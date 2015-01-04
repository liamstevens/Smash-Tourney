INSERT INTO `match` (`timestamp`, location, software_id, winner_id, winner_ratio) VALUES
	('2015-01-03 16:48:00', 'The Bungalow', 1, 1, 0.6);

SET @matchid = LAST_INSERT_ID();


# First game

INSERT INTO game (stage_id, match_id, winner_id) VALUES
	(48, @matchid, 1);

SET @gameid = LAST_INSERT_ID();

INSERT INTO player_game (player_id, character_id, game_id, character_elo) VALUES 
	(1, 47, @gameid, (1450 + 4));

INSERT INTO player_game (player_id, character_id, game_id, character_elo) VALUES 
	(2, 40, @gameid, (1450 - 4));



# Second game

INSERT INTO game (stage_id, match_id, winner_id) VALUES
	(68, @matchid, 2);

SET @gameid = LAST_INSERT_ID();

INSERT INTO player_game (player_id, character_id, game_id, character_elo) VALUES 
	(1, 18, @gameid, (1450 - 4));

INSERT INTO player_game (player_id, character_id, game_id, character_elo) VALUES 
	(2, 40, @gameid, (1450 - 4  + 4));



# Third game

INSERT INTO game (stage_id, match_id, winner_id) VALUES
	(71, @matchid, 1);

SET @gameid = LAST_INSERT_ID();

INSERT INTO player_game (player_id, character_id, game_id, character_elo) VALUES 
	(1, 47, @gameid, (1450 + 4 + 4));

INSERT INTO player_game (player_id, character_id, game_id, character_elo) VALUES 
	(2, 40, @gameid, (1450 - 4  + 4 - 4));



# Player ELO

INSERT INTO player_elo (player_id, match_id, elo_rating) VALUES
	(1, @matchid, (1582+2));

INSERT INTO player_elo (player_id, match_id, elo_rating) VALUES
	(2, @matchid, (1515-2));
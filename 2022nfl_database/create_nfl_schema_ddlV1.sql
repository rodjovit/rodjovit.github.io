USE ramosr39;
-- USE sys; -- @home DB server

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS nfl_conference;
DROP TABLE IF EXISTS nfl_division;
DROP TABLE IF EXISTS nfl_team;
DROP TABLE IF EXISTS nfl_qb;
DROP TABLE IF EXISTS nfl_wr;
DROP TABLE IF EXISTS nfl_conference_division;
DROP TABLE IF EXISTS nfl_division_team;
DROP TABLE IF EXISTS nfl_team_qb;
DROP TABLE IF EXISTS nfl_team_wr;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE nfl_conference
(
	conference_id		INT				PRIMARY KEY AUTO_INCREMENT,
    conference_name		VARCHAR(10) 	NOT NULL,
    conference_winloss	DECIMAL(5,3)	NOT NULL DEFAULT '0'
);

CREATE TABLE nfl_division
(
	conference_id		INT 			NOT NULL,
	division_id			INT				PRIMARY KEY AUTO_INCREMENT,
    conference_name		VARCHAR(10)		REFERENCES nfl_conference(conference_name),
    division_name		VARCHAR(10)		NOT NULL,
    division_winloss	DECIMAL(5,3)	NOT NULL DEFAULT '0',
    FOREIGN KEY (conference_id) REFERENCES nfl_conference(conference_id)
);

CREATE TABLE nfl_team
(
	conference_id		INT 			NOT NULL,
    division_id			INT				NOT NULL,
    conference_name		VARCHAR(10)		REFERENCES nfl_conference(conference_name),
    division_name		VARCHAR(10)		REFERENCES nfl_division(division_name),
	team_id				INT				PRIMARY KEY AUTO_INCREMENT,
    team_city			VARCHAR(20)		NOT NULL,
    team_mascot			VARCHAR(20)		NOT NULL,
    team_winloss		DECIMAL(3,3)	NOT NULL DEFAULT '0',
    FOREIGN KEY (conference_id) REFERENCES nfl_conference(conference_id),
	FOREIGN KEY (division_id) REFERENCES nfl_division(division_id)
);

CREATE TABLE nfl_qb
(
	conference_id		INT 			NOT NULL,
    division_id			INT 			NOT NULL,
    team_id				INT 			NOT NULL,
    conference_name		VARCHAR(10)		REFERENCES nfl_conference(conference_name),
    division_name		VARCHAR(10)		REFERENCES nfl_division(division_name),
    team_city			VARCHAR(20)		REFERENCES nfl_team(team_city),
    team_mascot			VARCHAR(20)		REFERENCES nfl_team(team_mascot),
	qb_id				INT 			PRIMARY KEY AUTO_INCREMENT,
    qb_first_name		VARCHAR(30)		NOT NULL,
    qb_last_name		VARCHAR(30)		NOT NULL,
    qb_pass_yards		INT				NOT NULL DEFAULT '0',
    qb_rush_yards		INT 			NOT NULL DEFAULT '0',
    qb_pass_att			INT				NOT NULL DEFAULT '0',
    qb_comps			INT				NOT NULL DEFAULT '0',
    qb_comp_pct			DECIMAL(4,1)	NOT NULL DEFAULT '0',
    qb_yards_per_comp	FLOAT			NOT NULL DEFAULT '0',
    qb_winloss			DECIMAL(5,3)	NOT NULL DEFAULT '0',
	FOREIGN KEY (conference_id) REFERENCES nfl_conference(conference_id),
	FOREIGN KEY (division_id) REFERENCES nfl_division(division_id),
    FOREIGN KEY (team_id) REFERENCES nfl_team(team_id)
);

CREATE TABLE nfl_wr
(
	conference_id		INT 			NOT NULL,
    division_id			INT 			NOT NULL,
    team_id				INT 			NOT NULL,
	conference_name		VARCHAR(10)		REFERENCES nfl_conference(conference_name),
    division_name		VARCHAR(10)		REFERENCES nfl_division(division_name),
    team_city			VARCHAR(20)		REFERENCES nfl_team(team_city),
    team_mascot			VARCHAR(20)		REFERENCES nfl_team(team_mascot),
	wr_id				INT 			PRIMARY KEY AUTO_INCREMENT,
    wr_first_name		VARCHAR(30)		NOT NULL,
    wr_last_name		VARCHAR(30)		NOT NULL,
    wr_yards			INT				NOT NULL DEFAULT '0',
    wr_targets			INT				NOT NULL DEFAULT '0',
    wr_receptions		INT				NOT NULL DEFAULT '0',
    wr_tds				INT				NOT NULL DEFAULT '0',
    wr_catch_pct		DECIMAL(4,1)	NOT NULL DEFAULT '0',
    wr_yards_per_rec	DECIMAL(4,1)	NOT NULL DEFAULT '0',
    wr_winloss			DECIMAL(5,3)	NOT NULL DEFAULT '0',
	FOREIGN KEY (conference_id) REFERENCES nfl_conference(conference_id),
	FOREIGN KEY (division_id) REFERENCES nfl_division(division_id),
    FOREIGN KEY (team_id) REFERENCES nfl_team(team_id)
);

CREATE TABLE nfl_conference_division
(
	conference_id		INT 			REFERENCES nfl_conference (conference_id),
    division_id			INT 			REFERENCES nfl_division (division_id),
    conference_name		VARCHAR(10)		NOT NULL REFERENCES nfl_conference (conference_name),
    division_name		VARCHAR(10)		NOT NULL REFERENCES nfl_division (division_name),
    PRIMARY KEY (conference_id,division_id),
    CONSTRAINT conference_id_fk FOREIGN KEY (conference_id) REFERENCES nfl_conference(conference_id),
    CONSTRAINT division_id_fk FOREIGN KEY (division_id) REFERENCES nfl_division(division_id)
);

CREATE TABLE nfl_division_team
(
	conference_id		INT 			REFERENCES nfl_conference (conference_id),
	division_id			INT 			REFERENCES nfl_division (division_id),
    team_id				INT 			REFERENCES nfl_team (team_id),
    conference_name		VARCHAR(10)		NOT NULL REFERENCES nfl_conference (conference_name),
    division_name		VARCHAR(10)		NOT NULL REFERENCES nfl_division (division_name),
    team_city			VARCHAR(20)		NOT NULL REFERENCES nfl_team (team_city),
    team_mascot			VARCHAR(20)		NOT NULL REFERENCES nfl_team (team_mascot),
    PRIMARY KEY(division_id,team_id),
    FOREIGN KEY (division_id) REFERENCES nfl_division(division_id),
    CONSTRAINT team_id_fk FOREIGN KEY (team_id) REFERENCES nfl_team(team_id)
);

CREATE TABLE nfl_team_qb
(
	conference_id		INT				REFERENCES nfl_conference (conference_id),
    division_id			INT 			REFERENCES nfl_division (division_id),
	team_id				INT 			REFERENCES nfl_team (team_id),
    conference_name		VARCHAR(10)		NOT NULL REFERENCES nfl_conference (conference_name),
    division_name		VARCHAR(10)		NOT NULL REFERENCES nfl_division (division_name),
    team_city			VARCHAR(20)		NOT NULL REFERENCES nfl_team (team_city),
    team_mascot			VARCHAR(20)		NOT NULL REFERENCES nfl_team (team_mascot),
    qb_id				INT 			AUTO_INCREMENT REFERENCES nfl_qb (qb_id),
    qb_first_name		VARCHAR(30)		NOT NULL REFERENCES nfl_qb (qb_first_name),
    qb_last_name		VARCHAR(30)		NOT NULL REFERENCES nfl_qb (qb_last_name),
    PRIMARY KEY (team_id,qb_id),
    FOREIGN KEY (team_id) REFERENCES nfl_team(team_id),
    CONSTRAINT qb_id_fk FOREIGN KEY (qb_id) REFERENCES nfl_qb(qb_id)
);

CREATE TABLE nfl_team_wr
(
	conference_id		INT				REFERENCES nfl_conference (conference_id),
    division_id			INT 			REFERENCES nfl_division (division_id),
	team_id				INT 			REFERENCES nfl_team (team_id),
    conference_name		VARCHAR(10)		NOT NULL REFERENCES nfl_conference (conference_name),
    division_name		VARCHAR(10)		NOT NULL REFERENCES nfl_division (division_name),
    team_city			VARCHAR(20)		NOT NULL REFERENCES nfl_team (team_city),
    team_mascot			VARCHAR(20)		NOT NULL REFERENCES nfl_team (team_mascot),
    wr_id				INT				AUTO_INCREMENT REFERENCES nfl_wr (wr_id),
    wr_first_name		VARCHAR(30)		NOT NULL REFERENCES nfl_wr (wr_first_name),
    wr_last_name		VARCHAR(30)		NOT NULL REFERENCES nfl_wr (wr_last_name),
    PRIMARY KEY (team_id,wr_id),
    FOREIGN KEY (team_id) REFERENCES nfl_team(team_id),
    CONSTRAINT wr_id_fk FOREIGN KEY (wr_id) REFERENCES nfl_wr(wr_id)
);
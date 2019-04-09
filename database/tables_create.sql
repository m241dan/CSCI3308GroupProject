/*
Just creates the basic tables for the database (project_db)
*/

CREATE TABLE IF NOT EXISTS Enjoyer (
	user_id serial PRIMARY KEY,
	first_name VARCHAR(128),
	last_name VARCHAR(128),
	user_name VARCHAR(128) NOT NULL,
	email VARCHAR(128),
	password CHAR(60)
);

CREATE TABLE IF NOT EXISTS Achievement (
	achievement_id serial PRIMARY KEY,
	achievement_name VARCHAR(128) NOT NULL,
	points SMALLINT NOT NULL,
	description VARCHAR(128) NOT NULL
);

CREATE TABLE IF NOT EXISTS EnjoyerAchievement (
	achievement_id serial NOT NULL,
	user_id serial NOT NULL,
	achieved_date DATE NOT NULL,

	PRIMARY KEY(achievement_id, user_id),
	FOREIGN KEY (achievement_id) REFERENCES Achievement (achievement_id),
	FOREIGN KEY (user_id) REFERENCES Enjoyer (user_id)
);

CREATE TABLE IF NOT EXISTS Exercise (
	exercise_id serial PRIMARY KEY,
	exercise_name VARCHAR(128) NOT NULL,
	reps SMALLINT,
	sets SMALLINT, 
	weight SMALLINT,
	distance REAL
);

CREATE TABLE IF NOT EXISTS ExerciseIntent (
	workout_intent_id serial PRIMARY KEY,
	user_id serial NOT NULL,
	workout_date DATE NOT NULL,
	exercise_id serial NOT NULL,

	FOREIGN KEY (user_id) REFERENCES Enjoyer (user_id),
	FOREIGN KEY (exercise_id) REFERENCES Exercise (exercise_id)
);

CREATE TABLE IF NOT EXISTS ExerciseActual (
	workout_actual_id serial PRIMARY KEY,
	user_id serial NOT NULL,
	workout_date DATE NOT NULL,
	exercise_id serial NOT NULL,

	FOREIGN KEY (user_id) REFERENCES Enjoyer (user_id),
	FOREIGN KEY (exercise_id) REFERENCES Exercise (exercise_id)
);
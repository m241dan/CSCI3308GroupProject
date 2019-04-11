/* 
Testing functionality
*/


/*
Insert information into the tables
*/
INSERT INTO Enjoyer(first_name, user_name)
VALUES
('Dominic', 'IronMan61693'),
('Amber', 'IvoryDarling')
;

INSERT INTO Achievement(achievement_name, description, points)
VALUES 
('Awesome', 'You are particularly amazing!', 200),
('300','Lifted 300lbs', 300),
('db','Wrote a database', 100)
;


INSERT INTO Exercise(exercise_name, reps, weight, sets)
VALUES
('squat', 6, 135, 4),
('squat', 2, 225, 2),
('squat', 1, 335, 1),
('deadlift', 4, 450, 1),
('deadlift', 3, 385, 2),
(''bench'', 10, 800, 1),
(''bench'', 8, 225, 1)
;

INSERT INTO Exercise(exercise_name, distance)
VALUES
('run', 5.2);

/* 
Give users achievements
*/
INSERT INTO EnjoyerAchievement(user_id, achievement_id, achieved_date)
VALUES 
((SELECT user_id FROM Enjoyer WHERE user_name = 'IronMan61693'),
 (SELECT achievement_id FROM Achievement WHERE achievement_name = 'db'),
 '2019-03-12')
;


INSERT INTO EnjoyerAchievement(user_id, achievement_id, achieved_date)
VALUES 
((SELECT user_id FROM Enjoyer WHERE user_name = 'IvoryDarling'),
 (SELECT achievement_id FROM Achievement WHERE achievement_name = 'Awesome'),
 '2019-03-12'),
((SELECT user_id FROM Enjoyer WHERE user_name = 'IronMan61693'),
 (SELECT achievement_id FROM Achievement WHERE achievement_name = '300'),
 '2019-03-12')
;

/*
Give users some intended and actual workouts
*/
INSERT INTO ExerciseIntent(user_id, exercise_id, workout_date)
VALUES
((SELECT user_id FROM Enjoyer WHERE user_name = 'IronMan61693'),
 (SELECT exercise_id FROM Exercise WHERE exercise_name = 'run') ,
 '2019-03-12')
 ;

INSERT INTO ExerciseIntent(user_id, exercise_id, workout_date)
VALUES
((SELECT user_id FROM Enjoyer WHERE user_name = 'IronMan61693'),
 (SELECT exercise_id FROM Exercise WHERE exercise_name = 'squat' AND weight = 335 ),
 '2019-03-12'),
((SELECT user_id FROM Enjoyer WHERE user_name = 'IronMan61693'),
 (SELECT exercise_id FROM Exercise WHERE exercise_name = 'squat' AND (weight = 225)),
 '2019-03-12'),
((SELECT user_id FROM Enjoyer WHERE user_name = 'IronMan61693'),
 (SELECT exercise_id FROM Exercise WHERE exercise_name = 'deadlift' AND (weight = 450)),
 '2019-03-12')	,
((SELECT user_id FROM Enjoyer WHERE user_name = 'IronMan61693'),
 (SELECT exercise_id FROM Exercise WHERE exercise_name = ''bench'' AND (weight > 300)),
 '2019-03-12')
;

INSERT INTO ExerciseIntent(user_id, exercise_id, workout_date)
VALUES
((SELECT user_id FROM Enjoyer WHERE user_name = 'IronMan61693'),
 (SELECT exercise_id FROM Exercise WHERE exercise_name = 'squat' AND weight = 335 ),
 '2019-03-10'),
((SELECT user_id FROM Enjoyer WHERE user_name = 'IronMan61693'),
 (SELECT exercise_id FROM Exercise WHERE exercise_name = 'deadlift' AND (weight = 450)),
 '2019-03-10')	
;

INSERT INTO ExerciseIntent(user_id, exercise_id, workout_date)
VALUES
((SELECT user_id FROM Enjoyer WHERE user_name = 'IronMan61693'),
 (SELECT exercise_id FROM Exercise WHERE exercise_name = ''bench'' AND weight > 335 ),
 '2019-03-11')	
;

INSERT INTO ExerciseIntent(user_id, exercise_id, workout_date)
VALUES
((SELECT user_id FROM Enjoyer WHERE user_name = 'IronMan61693'),
 (SELECT exercise_id FROM Exercise WHERE exercise_name = ''bench'' AND weight > 335 ),
 '2019-03-09')	
;

INSERT INTO ExerciseActual(user_id, exercise_id, workout_date)
VALUES
((SELECT user_id FROM Enjoyer WHERE user_name = 'IronMan61693'),
 (SELECT exercise_id FROM Exercise WHERE exercise_name = 'squat' AND (weight = 225)),
 '2019-03-12'),
((SELECT user_id FROM Enjoyer WHERE user_name = 'IronMan61693'),
 (SELECT exercise_id FROM Exercise WHERE exercise_name = 'squat' AND (weight = 135 )),
 '2019-03-12'),
((SELECT user_id FROM Enjoyer WHERE user_name = 'IronMan61693'),
 (SELECT exercise_id FROM Exercise WHERE exercise_name = 'deadlift' AND (weight = 385)),
 '2019-03-12')	,
((SELECT user_id FROM Enjoyer WHERE user_name = 'IronMan61693'),
 (SELECT exercise_id FROM Exercise WHERE exercise_name = ''bench'' AND (weight < 300)),
 '2019-03-12')
;
/* Print all of IronMan61693 achievements */
SELECT A.* 
FROM Achievement A
INNER JOIN EnjoyerAchievement EA ON (EA.achievement_id = A.achievement_id)
INNER JOIN Enjoyer E ON (E.user_id = EA.user_id)
WHERE E.user_id = (SELECT user_id FROM Enjoyer WHERE user_name = 'IronMan61693')
;

/* Print IronMan61693 workout intent for today */
SELECT W.*
FROM Exercise W
INNER JOIN ExerciseIntent EI ON (EI.exercise_id = W.exercise_id)
INNER JOIN Enjoyer E ON (E.user_id = EI.user_id)
WHERE E.user_id = (SELECT user_id FROM Enjoyer WHERE user_name = 'IronMan61693')
AND EI.workout_date = '2019-03-12'
;

/* Print IronMan61693 workout for what he actually did for today */
SELECT W.*
FROM Exercise W
INNER JOIN ExerciseActual WA ON (WA.exercise_id = W.exercise_id)
INNER JOIN Enjoyer E ON (E.user_id = WA.user_id)
WHERE E.user_id = (SELECT user_id FROM Enjoyer WHERE user_name = 'IronMan61693')
AND WA.workout_date = '2019-03-12'
;

/* Select exercise intent by date, gives back date, include date and over range */
SELECT W.exercise_name, W.reps, W.sets,W.weight, W.distance, to_char(EI.workout_date, 'DD-MM-YYYY') AS workout_date
FROM Exercise W
INNER JOIN ExerciseIntent EI ON (EI.exercise_id = W.exercise_id)
INNER JOIN Enjoyer E ON (E.user_id = EI.user_id)
WHERE E.user_id = (SELECT user_id FROM Enjoyer WHERE user_name = 'IronMan61693')
AND (EI.workout_date >= date_trunc('week', date '2019-03-12') - INTERVAL '1days'
     AND EI.workout_date < date_trunc('week', date '2019-03-12') + INTERVAL '6days')
ORDER BY EI.workout_date
;

/* Select exercise intent by date, gives back day of the week, include date and over range */
SELECT W.exercise_name, W.reps, W.sets,W.weight, W.distance, to_char(EI.workout_date, 'DAY') AS workout_date
FROM Exercise W
INNER JOIN ExerciseIntent EI ON (EI.exercise_id = W.exercise_id)
INNER JOIN Enjoyer E ON (E.user_id = EI.user_id)
WHERE E.user_id = (SELECT user_id FROM Enjoyer WHERE user_name = 'IronMan61693')
AND (EI.workout_date >= date_trunc('week', date '2019-03-12') - INTERVAL '1days'
     AND EI.workout_date < date_trunc('week', date '2019-03-12') + INTERVAL '6days')
ORDER BY EI.workout_date
;

/* Insert into intent table creating exercise if needed test vals*/
INSERT INTO ExerciseIntent(user_id, exercise_id, workout_date) VALUES(
  (SELECT user_id FROM Enjoyer WHERE email = 'dominic.pontious@gmail.com'),
  (  WITH s AS (SELECT exercise_id FROM Exercise WHERE exercise_name = 'bench' AND reps = 3 AND sets = 2 AND weight = 245 AND distance = 0 AND duration = 0),
   	 i AS (INSERT INTO Exercise(exercise_name, reps, sets, weight, distance, duration) SELECT 'bench', 3, 2, 245, 0, 0
      WHERE NOT EXISTS (SELECT exercise_id FROM Exercise WHERE exercise_name = 'bench' AND reps = 3 AND sets = 2 AND weight = 245 AND distance = 0 AND duration = 0)
      RETURNING exercise_id )
     SELECT exercise_id FROM i UNION ALL SELECT exercise_id FROM s
  ),
  '2019-04-10'
);

WITH s AS (SELECT workout_intent_id FROM ExerciseIntent WHERE user_id = (SELECT user_id FROM Enjoyer WHERE email = 'dominic.pontious@gmail.com') AND exercise_id = 1 AND workout_date = '2019-04-10'),
i AS (INSERT INTO ExerciseIntent(user_id, exercise_id, workout_date) SELECT 
  (SELECT user_id  FROM Enjoyer WHERE email = 'dominic.pontious@gmail.com'),
  1,
  '2019-04-10' 
WHERE NOT EXISTS (SELECT workout_intent_id FROM ExerciseIntent WHERE user_id = (SELECT user_id FROM Enjoyer WHERE email = 'dominic.pontious@gmail.com') AND exercise_id = 1 AND workout_date = '2019-04-10')
	RETURNING workout_intent_id)
SELECT workout_intent_id FROM i UNION ALL SELECT workout_intent_id FROM s
;


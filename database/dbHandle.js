const local_config = {
	user: 'postgres',
	host: 'localhost',
	port: 5432,
	database: 'project_db',
	password: 'pwd'
};
const heroku_db_config = process.env.DATABASE_URL;
var config = local_config;

const { Pool, Client } = require('pg');
if(typeof(heroku_db_config) != 'undefined'){
	console.log('heroku')
	config = heroku_db_config;

}
const pool = new Pool(config)


function getAchievements(id, callback)
{
	const user_id = id;

	var query_string =  'SELECT A.*' +
		' FROM Achievement A' +
		' INNER JOIN EnjoyerAchievement EA ON (EA.achievement_id = A.achievement_id)' +
		' INNER JOIN Enjoyer E ON (E.user_id = EA.user_id)' +
		' WHERE E.user_id = (SELECT user_id FROM Enjoyer WHERE user_name = $1)' +
		';' ;

	pool.query(query_string, [user_id], (err, results) => {
		if (err) {
			console.log(err);
			callback(true);
			return;
		}
		callback(false, results);
	});
}

function getWorkoutIntentByDate(id, date, callback){
	const user_id = id;
	const workout_date = date;
	const pass_me = [user_id, workout_date];

	var query_string =  "SELECT W.exercise_name, W.reps, W.sets,W.weight, W.distance, W.duration, to_char(EI.workout_date, 'Day') AS workout_date" +
						" FROM Exercise W" +
						" INNER JOIN ExerciseIntent EI ON (EI.exercise_id = W.exercise_id)" +
						" INNER JOIN Enjoyer E ON (E.user_id = EI.user_id)" +
						" WHERE E.user_id = (SELECT user_id FROM Enjoyer WHERE email = $1)" +
						" AND (EI.workout_date >= date_trunc('week', $2::timestamp + INTERVAL '1days')- INTERVAL '1days'" +
						"      AND EI.workout_date < date_trunc('week', $2::timestamp + INTERVAL '1days') + INTERVAL '6days')" +
						" ORDER BY EI.workout_date" +
						";"

	pool.query(query_string, pass_me, (err, results) => {
		if (err) {
			console.log(err);
			callback(true);
			return;
		}
		callback(false, results);
	});
}

function getUserInfo(id,callback)
{
	pool.query('SELECT name,height,weight FROM enjoyer WHERE userid=$1', [id], function(err,result){

        if(err)
        {
            console.log(err);
        }
		callback(err,result);
	})
}

function getUserByEmail(email,callback)
{
	pool.query('SELECT COUNT(*) from enjoyer where email=$1;', [email], (err, result) => {
		if( err )
		{
			console.log(err)
		}
		callback(err,result);
	})
}

function insertUser(first_name, last_name, user_name, email, password){

	pool.query('INSERT INTO enjoyer (first_name, last_name, user_name, email, password) VALUES ( $1, $2, $3, $4, $5 );',
		[first_name, last_name, user_name, email, password], (err,results)=>{
		if(err)
		{
			console.log(err);
		}
	})

}

function insertIntentWorkout(email, exer_name, dist, rep, set, wght, dur, date){
	// exercise_name, reps, sets, weight, distance, duration, workout_date
	query_exercise_id = 'WITH s AS (SELECT exercise_id FROM Exercise WHERE exercise_name = $1 AND reps = $2 AND sets = $3 AND weight = $4 AND distance = $5 AND duration = $6),' +
		   				' i AS (INSERT INTO Exercise(exercise_name, reps, sets, weight, distance, duration) SELECT $1, $2, $3, $4, $5, $6' +
		      			' WHERE NOT EXISTS (SELECT exercise_id FROM Exercise WHERE exercise_name = $1 AND reps = $2 AND sets = $3 AND weight = $4 AND distance = $5 AND duration = $6)' +
		    			'  RETURNING exercise_id )' +
		    			' SELECT exercise_id FROM i UNION ALL SELECT exercise_id FROM s;'
		    	

	query_insert =  'WITH s AS (SELECT workout_intent_id FROM ExerciseIntent WHERE user_id = (SELECT user_id FROM Enjoyer' +
					' WHERE email = $2) AND exercise_id = $1 AND workout_date = $3), '+
					' i AS (INSERT INTO ExerciseIntent(user_id, exercise_id, workout_date) SELECT' + 
 					' (SELECT user_id FROM Enjoyer WHERE email = $2),' +
					' $1, $3 ' +
					' WHERE NOT EXISTS (SELECT workout_intent_id FROM ExerciseIntent WHERE user_id = (SELECT user_id FROM Enjoyer' +
					' WHERE email = $2) AND exercise_id = $1 AND workout_date = $3)' +
					' RETURNING workout_intent_id)' +
					' SELECT workout_intent_id FROM i UNION ALL SELECT workout_intent_id FROM s' +
					';'

	pass_me_one = [exer_name, rep, set, wght, dist, dur]
	// , dist, rep, set, wght, dur

	pool.query (query_exercise_id, pass_me_one, (err,ex_id)=>{
		pass_me_two = [ex_id.rows[0].exercise_id, email, date]
		pool.query(query_insert, pass_me_two, (err,results)=>{
			if(err)
			{
				console.log(err)
			}
		})
	})
	

}




module.exports = {
	getAchievements,
	getWorkoutIntentByDate,
	insertUser,
	getUserInfo,
	getUserByEmail,
	insertIntentWorkout
};

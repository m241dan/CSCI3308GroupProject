
const Pool = require('pg').Pool;
const pool = new Pool({
	host: 'localhost',
	port: 5432,
	database: 'project_db',
	user: 'postgres',
	password: 'pwd'
});


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

	var query_string =  "SELECT W.exercise_name, W.reps, W.sets,W.weight, W.distance, to_char(EI.workout_date, 'Day') AS workout_date" +
						" FROM Exercise W" +
						" INNER JOIN ExerciseIntent EI ON (EI.exercise_id = W.exercise_id)" +
						" INNER JOIN Enjoyer E ON (E.user_id = EI.user_id)" +
						" WHERE E.user_id = (SELECT user_id FROM Enjoyer WHERE user_name = $1)" +
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
	pool.query('SELECT name,height,weight FROM enjoyer WHERE userid=id', [id], function(err,result){

        if(err)
        {
            console.log(err);
        }
		callback(err,result);
	})
}

function insertUser(user_id, first_name, last_name, user_name, email){

	var insert_statement="INSERT INTO enjoyer(user_id, first_name, last_name, user_name, email) VALUES('" + user_id + "','" +
		first_name + "','" + last_name + "','" + user_name +"','" + email + "');";

	pool.query(insert_statement, (err,results)=>{
		if(err)
		{
			console.log(err);
			callback(true);
			return;
		}
		callback(false,results);
	})

}

module.exports = {
	getAchievements,
	getWorkoutIntentByDate,
	insertUser,
	getUserInfo
};


const Pool = require('pg').Pool;
const pool = new Pool({
	host: 'localhost',
	port: 5432,
	database: 'project_db',
	user: 'postgres',
	password: 'pwd'
});


const getAchievments = (request, response) => {
	// const id = parseInt(request.params.id)
	const id = 'IronMan61693';

	var query_string =  'SELECT A.*' +
						' FROM Achievement A' +
						' INNER JOIN EnjoyerAchievement EA ON (EA.achievement_id = A.achievement_id)' +
						' INNER JOIN Enjoyer E ON (E.user_id = EA.user_id)' +
						' WHERE E.user_id = (SELECT user_id FROM Enjoyer WHERE user_name = $1)' +
						';' ;
	pool.query(query_string, [id], (error, results) => {
		if (error) {
			throw error
		}
		response.status(200).json(results.rows)
	})
};

function getAchievements2(callback)
{
	const id = 'IronMan61693';

	var query_string =  'SELECT A.*' +
		' FROM Achievement A' +
		' INNER JOIN EnjoyerAchievement EA ON (EA.achievement_id = A.achievement_id)' +
		' INNER JOIN Enjoyer E ON (E.user_id = EA.user_id)' +
		' WHERE E.user_id = (SELECT user_id FROM Enjoyer WHERE user_name = $1)' +
		';' ;

	pool.query(query_string, [id], (err, results) => {
		if (err) {
			console.log(err);
			callback(true);
			return;
		}
		callback(false, results);
	});
}
function getuserinfo(id,callback)
{
pool.query('SELECT name,height,weight FROM enjoyer WHERE userid=id', [id], function(err,result)=>{

		if(err)
		{
			console.log(err);
			
		}
		callback(err,result);

	}
	


}
function insertuser(user_id, first_name, last_name, user_name, email){

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

};



module.exports = {
	getAchievments,
	getAchievements2
};




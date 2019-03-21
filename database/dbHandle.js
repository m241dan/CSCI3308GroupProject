
const Pool = require('pg').Pool
const pool = new Pool({
	host: 'localhost',
	port: 5432,
	database: 'project_db',
	user: 'postgres',
	password: 'pwd'
})


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
}

module.exports = {
	getAchievments
}




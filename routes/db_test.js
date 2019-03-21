var express = require('express');
var router = express.Router();

var db = require('../database/dbHandle')

/*
Test code direct input db
*/

/**********************
  Database Connection information
  host: This defines the ip address of the server hosting our database.  We'll be using localhost and run our database on our local machine (i.e. can't be access via the Internet)
  port: This defines what port we can expect to communicate to our database.  We'll use 5432 to talk with PostgreSQL
  database: This is the name of our specific database.  From our previous lab, we created the football_db database, which holds our football data tables
  user: This should be left as postgres, the default user account created when PostgreSQL was installed
  password: This the password for accessing the database.  You'll need to set a password USING THE PSQL TERMINAL THIS IS NOT A PASSWORD FOR POSTGRES USER ACCOUNT IN LINUX!
**********************/






/* GET dbTest page. */
router.get('/', function(req, res, next) {
	db.getAchievements2( (err, results) => {
		res.render('dbtest',{
			my_title: "dbtest",
			achievement_data: results.rows
		});
	})

});

module.exports = router;


  


var express = require('express');
var router = express.Router();

var db = require('../database/dbHandle')






/* GET dbTest page. */
router.get('/', function(req, res, next) {
	
	db.getWorkoutIntentByDate('IronMan61693' , '2019-03-10', (err, results) => {
		res.render('dbtest_date',{
			my_title: "dbtest_date",
			data: results.rows
		});
	})

});

module.exports = router;

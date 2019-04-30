var express = require('express');
var router = express.Router();

var db = require('../database/dbHandle')


/* GET home page. */
router.get('/', function(req, res, next) {
    if (req.isAuthenticated() ){
		res.render('add_workout', {
			title: "F.I.T. Fam - Add Workout"
		});
    }
    else {
    	res.redirect('/login');
    }
    
});



router.post('/', function(req, res){
	if (req.body.workoutType == 'Cardio'){
		exer_name = req.body.cardioType;
		dist = Number(req.body.distance);
		rep = '0';
		set = '0';
		wght = '0';
		dur = '0';
		date = req.body.date;
	}
	if (req.body.workoutType == 'Weight'){
		exer_name = req.body.wExcerciseName;
		dist = '0';
		rep = Number(req.body.weightReps);
		set = Number(req.body.weightSets);
		wght = Number(req.body.weightAmt);
		dur = '0';
		date = req.body.date;
	}
	if (req.body.workoutType == 'Flexibility'){
		exer_name = req.body.flexType;
		dist = '0';
		rep = '0';
		set = '0';
		wght = '0';
		dur = Number(req.body.duration);
		date = req.body.date;
	}
	db.insertIntentWorkout(req.user[0].email, exer_name, dist, rep, set, wght, dur, date);
	res.redirect('/');
})

module.exports = router;

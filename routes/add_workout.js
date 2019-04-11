var express = require('express');
var router = express.Router();

var db = require('../database/dbHandle')


/* GET home page. */
router.get('/', function(req, res, next) {
    // res.write('This is /add_workout');
    // res.end();
    if (req.isAuthenticated() ){
    	// console.log('email in get');
	    // console.log(req.user['NULL'].email);
		res.render('add_workout', {
			title: "F.I.T. Fam - Add Workout"
		});
    }
    else {
    	res.redirect('/login');
    }
    
});



router.post('/', function(req, res){
	// console.log('email check!');
	// console.log(req.user['NULL'].email);
	console.log(req.body)
	if (req.body.workoutType == 'Cardio'){
		exer_name = req.body.cardioType;
		dist = Number(req.body.distance);
		rep = '0';
		set = '0';
		wght = '0';
		dur = '0';
		date = req.body.date;
		// console.log('Cardio checked')
	}
	if (req.body.workoutType == 'Weight'){
		exer_name = req.body.wExcerciseName;
		dist = '0';
		rep = Number(req.body.weightReps);
		set = Number(req.body.weightSets);
		wght = Number(req.body.weightAmt);
		dur = '0';
		date = req.body.date;
		// console.log('Weight training checked')
	}
	if (req.body.workoutType == 'Flexibility'){
		exer_name = req.body.flexType;
		dist = '0';
		rep = '0';
		set = '0';
		wght = '0';
		dur = Number(req.body.duration);
		date = req.body.date;
		// console.log('flexibility')
	}
	db.insertIntentWorkout(req.user[0].email, exer_name, dist, rep, set, wght, dur, date);
	res.redirect('/');
})

module.exports = router;

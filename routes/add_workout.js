var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
    // res.write('This is /add_workout');
    // res.end();
    res.render('add_workout', {
  	title: "F.I.T. Fam - Add Workout"
  });
});

module.exports = router;

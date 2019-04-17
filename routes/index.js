var express = require('express');
var router = express.Router();

var db = require('../database/dbHandle')

/* GET home page. */
router.get('/', function(req, res, next) {
    if( req.isAuthenticated() )
    {
        var cur_date = new Date()
        db.getWorkoutIntentByDate(req.user[0].email , cur_date, (err, results) => {
            res.render('index', {
                title: "F.I.T. Fam",
                first_name: req.user[0].firstName,
                workout_data: results.rows
            });
            console.log( results.rows )
        });
        console.log( req.user )
    }
    else {
        res.redirect('/login');
    }
});

module.exports = router;

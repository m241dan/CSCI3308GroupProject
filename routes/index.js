var express = require('express');
var router = express.Router();

var db = require('../database/dbHandle')
var cur_date = new Date()
var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']

/* GET home page. */
router.get('/', function(req, res, next) {
    if( req.isAuthenticated() )
    {
        db.getWorkoutIntentByDate(req.user[0].email , cur_date, (err, results) => {
            var format_date = cur_date.getDate() + " " + months[cur_date.getMonth()] + " " + cur_date.getFullYear()
            res.render('index', {
                title: "F.I.T. Fam",
                first_name: req.user[0].firstName,
                current_date: format_date,
                workout_data: results.rows
            });
        });
    }
    else {
        res.redirect('/login');
    }
});


router.post('/', function(req, res){
    var new_date = req.body.date.replace(/-/g,",")

    if (req.body.date != ''){
        cur_date = new Date(new_date) 
    }
    

    res.redirect('/');
})



module.exports = router;

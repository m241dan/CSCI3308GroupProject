var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
   req.logout();
   req.flash('success', "See you again soon!");
   res.redirect('/login');
});

module.exports = router;
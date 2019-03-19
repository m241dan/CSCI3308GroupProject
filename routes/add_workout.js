var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
    res.write('This is /add_workout');
    res.end();
});

module.exports = router;

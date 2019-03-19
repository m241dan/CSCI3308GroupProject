var express = require('express');
var router = express.Router();

/* GET home page. */
router.post('/', function(req, res, next) {
    res.write('This is /login');
    res.end();
});

module.exports = router;

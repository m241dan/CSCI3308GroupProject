var express = require('express');
var router = express.Router();

/* GET home page. */
router.post('/', function(req, res, next) {
    res.write('This is /registration');
    res.end();
});

module.exports = router;

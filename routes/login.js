var express = require('express');
var router = express.Router();
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;
const bcrypt = require('bcrypt');
const uuidv4 = require('uuid/v4');
const { Pool, Client } = require('pg');
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    port: 5432,
    database: 'project_db',
    password: 'pwd'
});

passport.use('local', new LocalStrategy({passReqToCallback: true}, (req, username, password, done) => {
    loginAttempt();
    // console.log( "email:" + username );
    // console.log( "password: " + password );

    async function loginAttempt() {
        console.log( "attempting to connect" );
        const client = await pool.connect();
        try {
            await client.query('BEGIN');
            var currentAccountData = await JSON.stringify(
                client.query('SELECT user_id, first_name, last_name, user_name, email, password from enjoyer where email = $1',
                    [username], function (err, result) {
                    // console.log( "getting here...");
                        if (err) {
                            return done(err);
                        }
                        if (result.rows[0] == null) {
                            //error popup? bad login or something
                            return done(null, false);
                        }
                        else
                        {
                            // console.log( "Hash: " + bcrypt.hash(req.body.password, 5 ) );
                            bcrypt.compare(password, result.rows[0].password, (err, check) => {
                                if (err) {
                                    console.log('Error occured while checking password')
                                    return done();
                                } else if (check) {
                                    return done(null, [{
                                        email: result.rows[0].email,
                                        firstName: result.rows[0].first_name
                                    }]);
                                } else {
                                    console.log("Incorrect login details");
                                    req.flash('failure', 'Bad username or password!');
                                    return done(null, false);
                                }
                            });
                        }
                    })
            )
        } catch (e) {
            throw e
        }
    }
}));

// passport.use(new LocalStrategy( (username, password, cb) => {
//
// });

passport.serializeUser(function(user, done) {
    // console.log('serialize');
    done(null, user);
});
passport.deserializeUser(function(user, done) {
    // console.log('deserialize');
    done(null, user);
});

router.get('/', function(req, res, next) {
    if( req.isAuthenticated() ) {
        res.redirect('/');
    }
    else {
        res.render('login', {
            title: "F.I.T. Fam - Login",
            messages: {success: req.flash('success'), failure: req.flash('failure')}
        });
    }
});

router.post('/', passport.authenticate('local', {successRedirect: '/',
                                                                 failureRedirect: '/login',
                                                                 failureFlash: false}), (req, res) => {
    if( req.body.remember )
    {
        req.session.cookie.maxAge= 30 * 24 * 60 * 60 * 1000;
    }
    else
    {
        req.session.cookie.expires = false;
    }
    res.redirect('/');

});

module.exports = router;

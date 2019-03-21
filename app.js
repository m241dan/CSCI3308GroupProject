var createError                   = require('http-errors');
var express                       = require('express');
var path                          = require('path');
var cookieParser                  = require('cookie-parser');
var logger                        = require('morgan');
var indexRouter                   = require('./routes/index');
var accountRouter                 = require('./routes/account');
var accountAwardsRouter           = require('./routes/account_awards');
var accountSettingsRouter         = require('./routes/account_settings');
var accountSummaryRouter          = require('./routes/account_summary');
var accountSummaryFilteredRouter  = require('./routes/account_summary_filtered')
var addWorkoutRouter              = require('./routes/add_workout');
var createWorkoutRouter           = require('./routes/create_workout');
var loginRouter                   = require('./routes/login');
var registrationRouter            = require('./routes/registration');
var dbTestRouter				  = require('./routes/db_test');
var app                           = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/account', accountRouter);
app.use('/account_awards', accountAwardsRouter);
app.use('/account_settings', accountSettingsRouter);
app.use('/account_summary', accountSummaryRouter);
app.use('/account_summary_filtered', accountSummaryFilteredRouter);
app.use('/add_workout', addWorkoutRouter);
app.use('/create_workout', createWorkoutRouter);
app.use('/login', loginRouter);
app.use('/register', registrationRouter);
app.use('/db_test', dbTestRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;

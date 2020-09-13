var createError = require("http-errors");
var express = require("express");
var path = require("path");
var cookieParser = require("cookie-parser");
var logger = require("morgan");
var cors = require("cors");

var indexRouter = require("./routes/index");
var usersRouter = require("./routes/users");
var staffRouter = require("./routes/staff");
var registerRouter = require("./routes/register");
var testAPIRouter = require("./routes/testAPI");
var publicholidaysRouter = require("./routes/publicholidays");
var groupsRouter = require("./routes/groups");
var rosterRouter = require("./routes/roster");
var wagesRouter = require("./routes/wages"); //02/09: GJ Added this router

var app = express();

// app.use(express.static(__dirname));
app.use(express.static(path.join(__dirname, "build")));

// app.get("*", (req, res) => {
//   res.sendFile(path.join(__dirname + "/build/index.html"));
// });

// -app.get("/", function (req, res) {
//   +app.get("/*", function (req, res) {
//     res.sendFile(path.join(__dirname, "build", "index.html"));
//   });
// });
// app.get("/", function (req, res) {
//   res.sendFile(path.join(__dirname, "build", "index.html"));
// });
app.use(function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );
  next();
});

// view engine setup
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "jade");

app.use(cors());
app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "build")));

app.use("/", indexRouter);
app.use("/users", usersRouter);
app.use("/staff", staffRouter);
app.use("/testAPI", testAPIRouter);
app.use("/register", registerRouter);
app.use("/pubholidays", publicholidaysRouter);
app.use("/groups", groupsRouter);
app.use("/roster", rosterRouter);
app.use("/wages1", wagesRouter); //02/09: GJ Added this router
app.get("/*", function (req, res) {
  res.sendFile(path.join(__dirname, "build", "index.html"));
});
// before using this one
// +app.get("/*", function (req, res) {
//   res.sendFile(path.join(__dirname, "build", "index.html"));
// });

//added by shailesh
// app.get("/*", function (req, res) {
//   res.sendFile(path.join(__dirname, "build", "index.html"));
// });

app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render("error");
});

module.exports = app;

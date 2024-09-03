var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  const currentTimeObj = new Date()
  const currentTime = currentTimeObj.toISOString().split("T")[1].split(".")[0]
  res.status(200).send({"time":currentTime})
});

module.exports = router;

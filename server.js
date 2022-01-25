const express = require("express");
const cors = require("cors");


const app = express();

var corsOptions = {
  origin: "http::8081"
};

app.use(cors(corsOptions));

// parse requests of content-type - application/json
app.use(express.json());

// parse requests of content-type - application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: true }));

// simple route
app.get("/", (req, res) => {
  res.json({ message: "OLUR GİBİ." });
});

require("./app/routes/doktor.routes.js")(app);

require("./app/routes/hasta.routes.js")(app);
// set port, listen for requests
require("./app/routes/mesaj.routes.js")(app);
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});

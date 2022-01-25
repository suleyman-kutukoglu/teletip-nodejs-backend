module.exports = app => {
    const doktorlar = require("../controllers/doktor.controller.js");
  
    var router = require("express").Router();
  
    // Create a new Doktor
    router.post("/doktorlar", doktorlar.create);
  
    // Retrieve all Doktors
    router.get("/doktorlar", doktorlar.findAll);
     
    router.get("/doktorlar/anabilimdali", doktorlar.findAnabilimdali);

    router.get("/doktorlar/uzmanlik", doktorlar.findUzmanlik);
  
    // Retrieve a single Doktor with id
    router.get("/doktorlar/:doktor_ID", doktorlar.findOne);
  
    // Update a Doktor with id
    router.put("/doktorlar/:doktor_ID", doktorlar.update);
  
    // Delete a Doktor with id
    router.delete("/:id", doktorlar.delete);
  
    // Delete all Doktors
    router.delete("/", doktorlar.deleteAll);
  
    app.use('/api', router);
  };

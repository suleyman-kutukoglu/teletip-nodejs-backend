module.exports = app => {
    const hastalar = require("../controllers/hasta.controller.js");
  
    var router = require("express").Router();
  
    // Create a new Hasta
    router.post("/hastalar", hastalar.create);
  
    // Retrieve all Hastas
    router.get("/hastalar", hastalar.findAll);
  
    // Retrieve all published Hastas
    router.get("/published", hastalar.findAllPublished);
  
    // Retrieve a single Hasta with id
    router.get("/hastalar/:hasta_ID", hastalar.findOne);
  
    // Update a Hasta with id
    router.put("/hastalar/:hasta_ID", hastalar.update);
  
    // Delete a Hasta with id
    router.delete("/:id", hastalar.delete);
  
    // Delete all Hastas
    router.delete("/", hastalar.deleteAll);
  
    app.use('/api', router);
  };

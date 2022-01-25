module.exports = app => {
    const mesajlar = require("../controllers/mesaj.controller.js");
  
    var router = require("express").Router();
  
    // Create a new Mesaj
    router.post("/mesajlar", mesajlar.create);
  
    // Retrieve all Mesajs
    router.get("/mesajlar", mesajlar.findAll);
  
    // Retrieve all published Mesajs
    router.get("/published", mesajlar.findAllPublished);
  
    // Retrieve a single Mesaj with id
    router.get("/mesajlar/:mesaj_ID", mesajlar.findOne);
  
    // Update a Mesaj with id
    router.put("/mesajlar/:mesaj_ID", mesajlar.update);
  
    // Delete a Mesaj with id
    router.delete("/:id", mesajlar.delete);
  
    // Delete all Mesajs
    router.delete("/", mesajlar.deleteAll);
  
    app.use('/api', router);
  };

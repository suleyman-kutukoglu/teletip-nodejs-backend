const sql = require("./db.js");

// constructor
const Doktor = function(doktor) {
  this.doktor_ISIM = doktor.doktor_ISIM;
  this.doktor_SOYISIM = doktor.doktor_SOYISIM;
  this.doktor_MAIL = doktor.doktor_MAIL;
  this.doktor_SIFRE = doktor.doktor_SIFRE;
};

Doktor.create = (newDoktor, result) => {
  sql.query("INSERT INTO Doktorlar SET ?", newDoktor, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    console.log("created doktor: ", { id: res.insertId, ...newDoktor});
    result(null, { id: res.insertId, ...newDoktor});
  });
};

Doktor.findById = (doktor_ID, result) => {
  sql.query(`SELECT * FROM Doktorlar WHERE doktor_ID = ${doktor_ID}`, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    if (res.length) {
      console.log("found doktor: ", res[0]);
      result(null, res[0]);
      return;
    }

    // not found Doktor.with the id
    result({ kind: "not_found" }, null);
  });
};

Doktor.getAll = (doktor, result) => {
  let query = "SELECT * FROM Doktorlar";

  if (doktor) {
    query += ` WHERE doktor_AD LIKE '%${doktor}%'`;
  }

  sql.query(query, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }

    console.log("doktors: ", res);
    result(null, res);
  });
};


Doktor.getAllAnabilimdali = (doktor, result) => {
  let query = "SELECT * FROM DB_HASTANE_TELETIP.AnaBilim;";


  sql.query(query, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }

    console.log("Doktorlar ve anabilimdallari: ", res);
    result(null, res);
  });
};


Doktor.getAllUzmanlik = (doktor, result) => {
  let query = "SELECT * FROM DB_HASTANE_TELETIP.UZMANLIK;";


  sql.query(query, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }

    console.log("Doktorlar ve uzmanliklari: ", res);
    result(null, res);
  });
};



Doktor.updateById = (doktor_ID, doktor, result) => {
  sql.query(
    "UPDATE Doktorlar SET doktor_ISIM = ?, doktor_SOYISIM = ?, doktor_MAIL = ?, doktor_SIFRE = ? WHERE doktor_ID = ?",
    [doktor.doktor_ISIM, doktor.doktor_SOYISIM, doktor.doktor_MAIL, doktor.doktor_SIFRE, doktor_ID],
    (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(null, err);
        return;
      }

      if (res.affectedRows == 0) {
        // not found Doktor.with the id
        result({ kind: "not_found" }, null);
        return;
      }

      console.log("updated doktor: ", { doktor_ID: doktor_ID, ...doktor });
      result(null, { doktor_ID: doktor_ID, ...doktor });
    }
  );
};

Doktor.remove = (id, result) => {
  sql.query("DELETE FROM doktors WHERE id = ?", id, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }

    if (res.affectedRows == 0) {
      // not found Doktor.with the id
      result({ kind: "not_found" }, null);
      return;
    }

    console.log("deleted doktor with id: ", id);
    result(null, res);
  });
};

Doktor.removeAll = result => {
  sql.query("DELETE FROM doktors", (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }

    console.log(`deleted ${res.affectedRows} doktors`);
    result(null, res);
  });
};

module.exports = Doktor;

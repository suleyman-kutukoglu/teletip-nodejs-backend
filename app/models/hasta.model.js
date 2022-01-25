const sql = require("./db.js");

// constructor
const Hasta = function(hasta) {
  this.hasta_ISIM = hasta.hasta_ISIM;
  this.hasta_SOYISIM = hasta.hasta_SOYISIM;
  this.hasta_MAIL = hasta.hasta_MAIL;
  this.hasta_SIFRE = hasta.hasta_SIFRE;
};

Hasta.create = (newHasta, result) => {
  sql.query("INSERT INTO Hastalar SET ?", newHasta, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    console.log("created hasta: ", { id: res.insertId, ...newHasta});
    result(null, { id: res.insertId, ...newHasta});
  });
};

Hasta.findById = (hasta_ID, result) => {
  sql.query(`SELECT * FROM Hastalar WHERE hasta_ID = ${hasta_ID}`, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }

    if (res.length) {
      console.log("found hasta: ", res[0]);
      result(null, res[0]);
      return;
    }

    // not found Hasta.with the id
    result({ kind: "not_found" }, null);
  });
};

Hasta.getAll = (hasta, result) => {
  let query = "SELECT * FROM Hastalar";

  if (hasta) {
    query += ` WHERE hasta_AD LIKE '%${hasta}%'`;
  }

  sql.query(query, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }

    console.log("hastas: ", res);
    result(null, res);
  });
};

Hasta.getAllPublished = result => {
  sql.query("SELECT * FROM hastas WHERE published=true", (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }

    console.log("hastas: ", res);
    result(null, res);
  });
};

Hasta.updateById = (hasta_ID, hasta, result) => {
  sql.query(
    "UPDATE Hastalar SET hasta_ISIM = ?, hasta_SOYISIM = ?, hasta_MAIL = ?, hasta_SIFRE = ? WHERE hasta_ID = ?",
    [hasta.hasta_ISIM, hasta.hasta_SOYISIM, hasta.hasta_MAIL, hasta.hasta_SIFRE, hasta_ID],
    (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(null, err);
        return;
      }

      if (res.affectedRows == 0) {
        // not found Hasta.with the id
        result({ kind: "not_found" }, null);
        return;
      }

      console.log("updated hasta: ", { hasta_ID: hasta_ID, ...hasta });
      result(null, { hasta_ID: hasta_ID, ...hasta });
    }
  );
};

Hasta.remove = (id, result) => {
  sql.query("DELETE FROM hastas WHERE id = ?", id, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }

    if (res.affectedRows == 0) {
      // not found Hasta.with the id
      result({ kind: "not_found" }, null);
      return;
    }

    console.log("deleted hasta with id: ", id);
    result(null, res);
  });
};

Hasta.removeAll = result => {
  sql.query("DELETE FROM hastas", (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }

    console.log(`deleted ${res.affectedRows} hastas`);
    result(null, res);
  });
};

module.exports = Hasta;

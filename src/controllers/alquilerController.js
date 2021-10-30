const controller = {};

controller.list = (req, res) => {
  req.getConnection((err, conn) => {
    conn.query("SELECT * FROM alquiler", (err, alquileres) => {
      if (err) {
        res.json(err);
      }
      console.log(alquileres);
      res.render("alquileres", {
        data: alquileres
      });
    });
  });
};

controller.save = (req, res) => {
  const data = req.body;
  req.getConnection((err, conn) => {
    conn.query("INSERT INTO alquiler(id_alquiler, id_cliente, id_camara, fecha_alquiler) VALUES ("+
    data.alquiler+", "+data.cliente+", "+data.camara+", '"+data.fecha+"');", (err, alquiler) => {
    //conn.query("INSERT INTO alquiler set ?", [data], (err, alquiler) => {

      console.log(alquiler);
      res.redirect("/");
      //res.send(data.fecha);
    });
  });
}

controller.edit = (req, res) => {
  const id = req.params;
  req.getConnection((err, conn) => {
    conn.query("SELECT * FROM alquiler WHERE id = ?", [id], (err, alquiler) => {
      res.render("alquiler_edit", {
        data: alquiler[0]
      });
    });
  });
//res.send(id);
};

controller.update = (req, res) => {
  //const id = req.params;
  //const newAlquiler = req.body;
  //req.getConnection((err, conn) => {
  //  conn.query("UPDATE alquiler set ? WHERE id_alquiler = ?", [newAlquiler, id], (err, rows) => {
  //    res.redirect("/");
  //  });
  //});
  res.send("cbdcds bdf");
};

controller.delete = (req, res) => {
  const id = req.params.id;
  req.getConnection((err, conn) => {
    conn.query("DELETE FROM alquiler WHERE id_alquiler = ?", [id], (err, rows) => {
    //conn.query("DELETE FROM alquiler WHERE id_alquiler = "+id, (err, rows) => {
        res.redirect("/");
    });
  });
  //console.log(req.params.id);
  //res.send("works");
}

//{"alquiler":"4","cliente":"2","camara":"1","fecha":"2021-10-20"}

module.exports = controller;

import 'package:api_web/main.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class AgregarUsuario extends StatefulWidget {
  @override
  _AgregarUsuarioState createState() => _AgregarUsuarioState();
}

class _AgregarUsuarioState extends State<AgregarUsuario> {
  TextEditingController controlNombre = new TextEditingController();
  TextEditingController controlTelefono = new TextEditingController();
  TextEditingController controlEmail = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("AGREGAR USUARIO"),
      ),
      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new TextField(
                controller: controlNombre,
                decoration: new InputDecoration(labelText: "Nombre"),
              ),
              new TextField(
                controller: controlTelefono,
                decoration: new InputDecoration(labelText: "Apellido"),
              ),
              new TextField(
                controller: controlEmail,
                decoration: new InputDecoration(labelText: "Usuario"),
              ),
              new ElevatedButton(
                child: new Text("Agregar Usuario"),
                onPressed: () {
                  agregarUsuario();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> new ListaUsuarios()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void agregarUsuario() {
    var url = "https://marcaweb.net/pruebas/api.php";
    http.post(Uri.parse(url), body: {
      "nombre": controlNombre.text,
      "apellido": controlTelefono.text,
      "usuario": controlEmail.text,
    });
  }
}

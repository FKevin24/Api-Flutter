import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class EditarUsuario extends StatefulWidget {
  final List lista;
  int index;

  EditarUsuario({required this.lista, required this.index});

  @override
  _EditarUsuarioState createState() => _EditarUsuarioState();
}

class _EditarUsuarioState extends State<EditarUsuario> {
  TextEditingController controlNombre = new TextEditingController();
  TextEditingController controlTelefono = new TextEditingController();
  TextEditingController controlEmail = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("EDITAR USUARIO"),
      ),
      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("ID: " + widget.lista[widget.index]['id']),
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
                child: Text("Editar Usuario"),
                onPressed: () {
                  editarUsuario();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void editarUsuario() {
    var url = "https://marcaweb.net/pruebas/api.php";
    http.put(Uri.parse(url), body: {
      "id": widget.lista[widget.index]['id'],
      "nombre": controlNombre.text,
      "apellido": controlTelefono.text,
      "usuario": controlEmail.text,
    });
  }
}

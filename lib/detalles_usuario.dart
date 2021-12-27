import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'editar_usuario.dart';

class DetallesUsuario extends StatefulWidget {
  int index;
  List lista;

  DetallesUsuario({required this.index, required this.lista});

  @override
  _DetallesUsuarioState createState() => _DetallesUsuarioState();
}

class _DetallesUsuarioState extends State<DetallesUsuario> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("DETALLES DEL USUARIO"),
      ),
      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Center(
          child: Column(
            children: <Widget>[
              new Text(
                "Nombre: " + widget.lista[widget.index]['nombre'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              new Text(
                "ID Usuario: " + widget.lista[widget.index]['id'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              new Text(
                "Telefono: " + widget.lista[widget.index]['apellido'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              new Text(
                "Email: " + widget.lista[widget.index]['usuario'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              new ElevatedButton(
                child: Text("EDITAR"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (BuildContext context) => new EditarUsuario(
                        lista: widget.lista,
                        index: widget.index,
                      ),
                    ),
                  );
                },
              ),
              new ElevatedButton(
                child: Text("BORRAR"),
                onPressed: () {
                  var url = "https://marcaweb.net/pruebas/api.php";
                  http.post(Uri.parse(url),
                      body: {"id": widget.lista[widget.index]['id']});

                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

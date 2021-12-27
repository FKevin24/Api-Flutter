import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'agregar_usuario.dart';
import 'detalles_usuario.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ListaUsuarios(),
    );
  }
}

class ListaUsuarios extends StatefulWidget {
  @override
  _ListaUsuariosState createState() => _ListaUsuariosState();
}

class _ListaUsuariosState extends State<ListaUsuarios> {
  Future<List<dynamic>> obtenerUsuarios() async {
    var response = await http
        .get(Uri.parse("https://marcaweb.net/pruebas/api.php"))
        .timeout(Duration(seconds: 5));
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      obtenerUsuarios();
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("LISTA DE USUARIOS"),
      ),
      body: new FutureBuilder<List>(
        future: obtenerUsuarios(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
            children: _listUsers(snapshot.data),
          );
        }
      ),
      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new AgregarUsuario(),
        )),
      ),
    );
  }

  List<Widget> _listUsers(List? data)
}




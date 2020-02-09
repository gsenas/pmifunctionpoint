import 'package:flutter/material.dart';
import 'package:pmifunctionpoint/departamentostab.dart';
import 'package:pmifunctionpoint/empleadostab.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'globals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Punto Función: Ejemplo",
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          secondaryHeaderColor: Colors.deepPurple,
        ),
        debugShowCheckedModeBanner: false,
        home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  void _loadEmpleados() async {
    int totalEmpleados = Departamento.totalHeadCountDeseado(departamentos);

    final response = await http
        .get('https://randomuser.me/api/?nat=es&results=$totalEmpleados');
    final json = jsonDecode(response.body);
    List<Empleado> _empleados = [];
    for (var jsonUser in json['results']) {
      _empleados.add(Empleado.fromJson(jsonUser));
    }

    setState(() {
      for (Empleado e in _empleados) {
        try {
          e.asignarDepartamentoAzar(departamentos, _empleados);
        } catch (e) {
          print('Excepción capturada: ' + e.toString());
        }
      }
      empleados = _empleados;
      loading = false;
    });
    print(empleados.length.toString() + " empleados generados");
  }

  @override
  void initState() {
    _loadEmpleados();

    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
        title: Text("Punto Función: Ejemplo"),
        backgroundColor: Colors.deepPurple,
      ),
      // Set the TabBar view as the body of the Scaffold
      body: TabBarView(
        children: <Widget>[DepartamentosTab(), EmpleadosTab()],
        controller: controller,
      ),
      bottomNavigationBar: Material(
        color: Colors.deepPurple,
        child: TabBar(
          indicatorColor: Colors.orange,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.grey,
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.business),
              text: "Departamentos",
            ),
            Tab(icon: Icon(Icons.people), text: "Empleados"),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}

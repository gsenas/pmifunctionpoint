import 'package:flutter/material.dart';
import 'package:pmifunctionpoint/tabs/departamentos.dart';
import 'package:pmifunctionpoint/tabs/empleados.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Punto Función: Ejemplo",
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          secondaryHeaderColor: Colors.deepOrange,
        ),
        home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
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
    return Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
        title: Text("Ejemplo de recuento Punto Función"),
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
            Tab(
              icon: Icon(Icons.people),
              text: "Empleados"
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}


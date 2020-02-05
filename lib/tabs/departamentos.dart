import 'package:flutter/material.dart';
import '../globals.dart';

class DepartamentosTab extends StatefulWidget {
  DepartamentosTab({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DepartamentosTabState createState() => _DepartamentosTabState();
}

class _DepartamentosTabState extends State<DepartamentosTab> {
  final List<String> _departamentos = <String>[
    "Dirección",
    "Ventas",
    "I+D",
    "Financiero",
    "Producción",
    "Informática",
    "Legal",
    "Marketing",
    "Recursos Humanos",
    "Formación",
    "Soporte"
  ];

  final List<int> _departamentosHC = <int>[
    3,
    15,
    12,
    6,
    55,
    10,
    5,
    12,
    7,
    2,
    4
  ];

  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildAlfabeto(),
    floatingActionButton: FloatingActionButton(
    backgroundColor: Colors.deepOrange,
    //onPressed: _incrementCounter,
    tooltip: 'Increment',
    child: Icon(Icons.add)
    ));
  }

  Widget _buildAlfabeto() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext _context, int i) {
          // Add a one-pixel-high divider widget before each row
          // in the ListView.
          if (i.isOdd) {
            return new Divider();
          }

          final int index = i ~/ 2;

          if (index >= _departamentos.length) {
            return null;
          }

          return _buildRow(_departamentos[index],_departamentosHC[index].toString(), index);
        });
  }

  Widget _buildRow(String dpto, String headcount, int i) {
    return new ListTile(
      title: new Text(
        dpto,
        style: TextStyle(
            fontSize: 32,
            fontFamily: "Arial"),
        textAlign: TextAlign.left,
      ),
      subtitle: new Text('$headcount empleados'),
      trailing: Icon(Icons.keyboard_arrow_right),
    );
  }
}


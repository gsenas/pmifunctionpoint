import 'package:flutter/material.dart';
import '../globals.dart';

class DepartamentosTab extends StatefulWidget {
  DepartamentosTab({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DepartamentosTabState createState() => _DepartamentosTabState();
}

class _DepartamentosTabState extends State<DepartamentosTab> {
  Widget build(BuildContext context) {
    return new Scaffold(
        body: _buildListaDptos(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepOrange,
            //onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add)));
  }

  Widget _buildListaDptos() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return new Divider();
          }

          final int index = i ~/ 2;

          if (index >= departamentos.length) {
            return null;
          }

          return _buildRow(departamentos[index].nombre,
              departamentos[index].headCount, index);
        });
  }

  Widget _buildRow(String dpto, int headcount, int i) {
    return new ListTile(
      title: new Text(
        dpto,
        style: TextStyle(fontSize: 28, fontFamily: "Arial"),
        textAlign: TextAlign.left,
      ),
      subtitle: new Text('$headcount empleados'),
      trailing: Icon(Icons.keyboard_arrow_right),
    );
  }
}

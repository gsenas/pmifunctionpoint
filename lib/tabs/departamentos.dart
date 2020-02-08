import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../globals.dart';

class DepartamentosTab extends StatefulWidget {
  DepartamentosTab({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DepartamentosTabState createState() => _DepartamentosTabState();
}

class _DepartamentosTabState extends State<DepartamentosTab> {
  TextEditingController _textFieldController = TextEditingController();

  void _detalleDepartamento(id) {
    List<Widget> _datosDepartamento = [
      SizedBox(
        height: 20.0,
        width: 150.0,
        child: Divider(
          color: Colors.deepPurple
        ),
      ),
      Text(
        departamentos[id].nombre,
        style: TextStyle(
          fontSize: 28,
          //color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 20.0,
        width: 150.0,
        child: Divider(
          color: Colors.deepPurple
        ),
      ),
    ];

    for (Empleado e in empleados) {
      if (e.idDepartamento == departamentos[id].id) {
        _datosDepartamento.add(Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              title: Text(
                e.fullname,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.teal.shade900,
                    fontFamily: 'Source Sans Pro'),
              ),
            )));
      }
    }

    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return new Scaffold(
            appBar: new AppBar(title: Text('Detalle de Departamento')),
            body: SafeArea(
                child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: _datosDepartamento,
            )),
          );
        },
      ),
    );
  }

  Future<void> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Crear nuevo'),
            content: CupertinoTextField(
              autofocus: true,
              controller: _textFieldController,
              clearButtonMode: OverlayVisibilityMode.editing,
              placeholder: 'Nombre del departamento',
              padding: EdgeInsets.all(10),
            ),
            actions: <Widget>[
              new CupertinoButton(
                child: new Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new CupertinoButton(
                child: new Text('Aceptar'),
                onPressed: () {
                  if (_textFieldController.text.toString() != '') {
                    setState(() {
                      departamentos.add(Departamento(
                          departamentos.length+1, _textFieldController.text, 0));
                      _textFieldController.clear();
                      Navigator.of(context).pop();
                    });
                  }
                },
              )
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        body: _buildListaDptos(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepOrange,
            onPressed: () => _displayDialog(context),
            tooltip: 'Añadir un nuevo departamento',
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
              departamentos[index].empleadosAsignados(empleados), index);
        });
  }

  Widget _buildRow(String dpto, int headcount, int i) {
    return new ListTile(
        onTap: () {
          _detalleDepartamento(i);
        },
        title: new Text(
          dpto,
          style: TextStyle(fontSize: 28, fontFamily: "Arial"),
          textAlign: TextAlign.left,
        ),
        subtitle: new Text('$headcount empleados'),
        trailing: Icon(Icons.keyboard_arrow_right));
  }
}

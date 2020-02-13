import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'globals.dart';
import 'package:pmifunctionpoint/asignar.dart';

class DepartamentosTab extends StatefulWidget {
  DepartamentosTab({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DepartamentosTabState createState() => _DepartamentosTabState();
}

class _DepartamentosTabState extends State<DepartamentosTab> {
  TextEditingController _textFieldController = TextEditingController();

  void _detalleDepartamento(id) {
    List<TableRow> _filasEmpleados() {
      List<TableRow> _filas = [
        TableRow(
          decoration: BoxDecoration(color: Colors.deepPurple),
          children: [
            TableCell(
                child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "Nombre",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "Asignación",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))
          ],
        )
      ];

      for (Empleado e in empleados) {
        if (e.idDepartamento == departamentos[id].id) {
          _filas.add(TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    e.fullname,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    e.registered.substring(0, 10),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            ],
          ));
        }
      }
      return _filas;
    }

    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return new Scaffold(
            appBar: new AppBar(title: Text('Detalle de Departamento')),
            body: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: SafeArea(
                      child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                        width: 150.0,
                      ),
                      Text(
                        departamentos[id].nombre,
                        style: TextStyle(
                          fontSize: 28,
                          //color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(25.0, 10, 25.0, 10),
                        child: Table(
                          columnWidths: const <int, TableColumnWidth>{
                            1: FixedColumnWidth(120.0),
                          },
                          border:
                              TableBorder.all(width: 1.0, color: Colors.black),
                          textDirection: TextDirection.ltr,
                          children: _filasEmpleados(),
                        ),
                      ),
                      RaisedButton(
                          color: Colors.cyan,
                          padding: const EdgeInsets.all(8.0),
                          textColor: Colors.white,
                          onPressed: () {
                            setState(() {
                              asignarEmpleadoDpto(null, id, context);
                            });
                          },
                          child: Text("ASIGNAR EMPLEADO",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ))),
                      SizedBox(
                        height: 10.0,
                        width: 150.0,
                      ),
                    ],
                  )),
                )
              ],
            ),
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
            title: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Text('Crear nuevo'),
            ),
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
                          departamentos.length, _textFieldController.text, 0));
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

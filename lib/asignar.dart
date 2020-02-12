import 'package:flutter/material.dart';
import 'globals.dart';

String _asignarE() {
  return "Hola";
}

void asignarEmpleadoDpto(idEmpleado, idDpto, context) {
  Navigator.of(context).push(
    new MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return new Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text('Asignar empleado a departamento'),
            actions: <Widget>[
              FlatButton(
                child: Text('GUARDAR',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                onPressed: () {
                  //Navigator.pop(context, DismissDialogAction.save);
                  Navigator.pop(context, null);
                },
              ),
            ],
          ),
          body: Form(
            onWillPop: null,
            child: Scrollbar(
              child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: <Widget>[
                    ListTile(
                      title: const Text('Empleado:'),
                      trailing: DropdownButton<String>(
                        value: 'One',
                        onChanged: (String e) {
                          _asignarE();
                        },
                        items: <String>[
                          'One',
                          'Two',
                          'Free',
                          'Four',
                          'Can',
                          'I',
                          'Have',
                          'A',
                          'Little',
                          'Bit',
                          'More',
                          'Five',
                          'Six',
                          'Seven',
                          'Eight',
                          'Nine',
                          'Ten',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    ListTile(
                      title: const Text('Departamento:'),
                      trailing: DropdownButton<String>(
                        value: 'One',
                        onChanged: (String e) {
                          _asignarE();
                        },
                        items: <String>[
                          'One',
                          'Two',
                          'Free',
                          'Four',
                          'Can',
                          'I',
                          'Have',
                          'A',
                          'Little',
                          'Bit',
                          'More',
                          'Five',
                          'Six',
                          'Seven',
                          'Eight',
                          'Nine',
                          'Ten',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    )
                  ]),
            ),
          ),
        );
      },
    ),
  );
}

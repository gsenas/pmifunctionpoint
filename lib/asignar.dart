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
                  padding: const EdgeInsets.all(1.0),
                  children: <Widget>[
                    //SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: ListTile(
                          leading:
                              Icon(Icons.person, size: 100, color: Colors.cyan),
                          title: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Icon(Icons.arrow_right, size: 100),
                          ),
                          trailing: Icon(Icons.business,
                              size: 100, color: Colors.deepOrange)),
                    ),
                    ListTile(
                      leading: Text('Empleado:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0)),
                      title: DropdownButton<String>(
                        value: 'One',
                        onChanged: (String e) {
                          _asignarE();
                        },
                        isExpanded: true,
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
                    SizedBox(height: 25),
                    ListTile(
                      leading: Text('Departamento:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0)),
                      title: DropdownButton<String>(
                        value: 'One',
                        onChanged: (String e) {
                          _asignarE();
                        },
                        isExpanded: true,
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

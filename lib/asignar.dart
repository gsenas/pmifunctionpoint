import 'package:flutter/material.dart';

void asignarEmpleadoDpto(idEmpleado, idDpto, context) {
  Navigator.of(context).push(
    new MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
              title: Text('Asignar empleado a departamento'),
              backgroundColor: Colors.deepPurple,
            ),
            body: SafeArea(
                child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15.0,
                  width: 150.0,
                ),
                SizedBox(
                  height: 25.0,
                  width: 150.0,
                ),
                RaisedButton(
                  color: Colors.deepOrange,
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  onPressed: () {
                    null;
                  },
                  child: Text("ASIGNAR",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(
                  height: 25.0,
                  width: 150.0,
                ),
              ],
            )));
      },
    ),
  );
}

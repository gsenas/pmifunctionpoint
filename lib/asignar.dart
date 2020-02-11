import 'package:flutter/material.dart';

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
                child: Text('GUARDAR', style: TextStyle(
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
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    alignment: Alignment.bottomLeft,
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Event name',
                        filled: true,
                      ),

                      onChanged: null,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    alignment: Alignment.bottomLeft,
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Location',
                        hintText: 'Where is the event?',
                        filled: true,
                      ),
                      onChanged: null,
                    ),
                  ),
                ]
                    .map<Widget>((Widget child) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    height: 96.0,
                    child: child,
                  );
                })
                    .toList(),
                ),
            ),
          ),


        );
      },
    ),
  );
}

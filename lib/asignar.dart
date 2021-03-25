import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'globals.dart';

import 'departamentostab.dart';
import 'empleadostab.dart';

bool volverAEmp;

void _asignarE(idEmp, idDpto, context) {
  Navigator.pop(context, null);
  asignarEmpleadoDpto(idEmp, idDpto, context, volverAEmp);
}

void asignarEmpleadoDpto(idEmpleado, idDpto, context, volverAEmpleado) {
  volverAEmp = volverAEmpleado;

  List<DropdownMenuItem<int>> _buildDropdownEmpleados() {
    List<DropdownMenuItem<int>> items = List();

    int index = 0;

    for (Empleado e in empleados) {
      if (index == idEmpleado || e.idDepartamento != idDpto)
        items.add(DropdownMenuItem(value: index, child: Text(e.fullname)));

      index++;
    }

    return items;
  }

  //Asignamos por defecto el departamento en el que ya está el empleado
  if (idDpto == null && idEmpleado != null) {
    idDpto = empleados[idEmpleado].idDepartamento;
  }

  List<DropdownMenuItem<int>> _buildDropdownDepartamentos() {
    List<DropdownMenuItem<int>> items = List();

    for (Departamento d in departamentos) {
      items.add(DropdownMenuItem(value: d.id, child: Text(d.nombre)));
    }

    return items;
  }

  Navigator.of(context).push(
    new MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return new Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text('Asignar empleado a departamento'),
            actions: <Widget>[
              TextButton(
                child: Text('GUARDAR',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                onPressed: () {
                  empleados[idEmpleado].idDepartamento = idDpto;
                  var now = new DateTime.now();
                  var formatter = new DateFormat('yyyy-MM-dd');
                  empleados[idEmpleado].registered = formatter.format(now);

                  Navigator.pop(context, null);
                  Navigator.pop(context, null);
                  if (volverAEmpleado) {
                    detalleEmpleado(idEmpleado, context);
                  } else {
                    detalleDepartamento(idDpto, context);
                  }
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
                      padding: const EdgeInsets.all(20.0),
                      child: ListTile(
                          title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                            Icon(Icons.person, size: 80, color: Colors.cyan),
                            Icon(Icons.compare_arrows, size: 80),
                            Icon(Icons.business,
                                size: 80, color: Colors.deepOrange),
                          ])),
                    ),
                    ListTile(
                      leading: Text('Empleado:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0)),
                      title: IgnorePointer(
                        ignoring: volverAEmpleado,
                        child: DropdownButton<int>(
                          iconSize: volverAEmpleado ? 0 : 40,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: volverAEmpleado
                                ? Colors.grey[400]
                                : Colors.black,
                          ),
                          value: idEmpleado,
                          onChanged: (int e) {
                            _asignarE(e, idDpto, context);
                          },
                          isExpanded: true,
                          items: _buildDropdownEmpleados(),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    ListTile(
                      leading: Text('Departamento:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0)),
                      title: IgnorePointer(
                        ignoring: !volverAEmpleado,
                        child: DropdownButton<int>(
                          iconSize: volverAEmpleado ? 40 : 0,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: volverAEmpleado
                                ? Colors.black
                                : Colors.grey[400],
                          ),
                          value: idDpto,
                          onChanged: (int d) {
                            _asignarE(idEmpleado, d, context);
                          },
                          isExpanded: true,
                          items: _buildDropdownDepartamentos(),
                        ),
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

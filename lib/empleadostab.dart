import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pmifunctionpoint/asignar.dart';

import 'globals.dart';

void detalleEmpleado(id, context) {
  Navigator.of(context).push(
    new MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return new Scaffold(
          appBar: new AppBar(
            title: Text('Detalle de Empleado'),
            backgroundColor: Colors.cyan,
          ),
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 15.0,
                          width: 150.0,
                        ),
                        CircleAvatar(
                          radius: 75.0,
                          backgroundImage:
                          NetworkImage(empleados[id].largePhotoUrl),
                        ),
                        SizedBox(
                          height: 10.0,
                          width: 150.0,
                        ),
                        Text(
                          empleados[id].fullname,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                          width: 150.0,
                        ),
                        Card(
                            margin: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 25.0),
                            child: ListTile(
                                leading: Icon(
                                  Icons.business,
                                  color: Colors.deepPurple,
                                ),
                                title: Text(
                                  departamentos[empleados[id].idDepartamento]
                                      .nombre,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))),
                        Card(
                            margin: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 25.0),
                            child: ListTile(
                              leading: Icon(
                                Icons.phone,
                                color: Colors.deepPurple,
                              ),
                              title: Text(
                                empleados[id].phone,
                              ),
                            )),
                        Card(
                            margin: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 25.0),
                            child: ListTile(
                                leading: Icon(
                                  Icons.email,
                                  color: Colors.deepPurple,
                                ),
                                title: Text(
                                  empleados[id].email,
                                ))),
                        Card(
                            margin: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 25.0),
                            child: ListTile(
                                leading: Icon(
                                  Icons.location_on,
                                  color: Colors.deepPurple,
                                ),
                                title: Text(
                                  empleados[id].location,
                                ))),
                        SizedBox(
                          height: 25.0,
                          width: 150.0,
                        ),
                        RaisedButton(
                          color: Colors.deepOrange,
                          padding: const EdgeInsets.all(8.0),
                          textColor: Colors.white,
                          onPressed: () {
                            asignarEmpleadoDpto(id, null, context, true);
                          },
                          child: Text("ASIGNAR DEPARTAMENTO",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        SizedBox(
                          height: 25.0,
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

class EmpleadosTab extends StatefulWidget {
  EmpleadosTab({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EmpleadosTabState createState() => _EmpleadosTabState();
}

class _EmpleadosTabState extends State<EmpleadosTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EmpleadosList());
  }
}

class EmpleadosList extends StatefulWidget {
  @override
  _EmpleadosListState createState() => _EmpleadosListState();
}

class _EmpleadosListState extends State<EmpleadosList> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(empleados[index].fullname,
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(empleados[index].email),
            leading: CircleAvatar(
                backgroundImage: NetworkImage(empleados[index].photoUrl)),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              detalleEmpleado(index, context);
            });
      },
      itemCount: empleados.length,
    );
  }
}

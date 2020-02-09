import 'package:flutter/material.dart';

import 'globals.dart';

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
          title: Text(empleados[index].fullname),
          subtitle: Text(empleados[index].email),
          leading: CircleAvatar(
              backgroundImage: NetworkImage(empleados[index].photoUrl)),
          trailing: Icon(Icons.keyboard_arrow_right),
        );
      },
      itemCount: empleados.length,
    );
  }
}

import 'package:flutter/material.dart';

import '../globals.dart';


class EmpleadosTab extends StatefulWidget {
  EmpleadosTab({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EmpleadosTabState createState() => _EmpleadosTabState();
}

class _EmpleadosTabState extends State<EmpleadosTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: UserList());
  }
}

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
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
          subtitle: Text(empleados[index].username),
          leading: CircleAvatar(backgroundImage: NetworkImage(empleados[index].photoUrl)),
          trailing: Icon(Icons.keyboard_arrow_right),
        );
      },
      itemCount: empleados.length,
    );
  }
}

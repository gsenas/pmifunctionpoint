import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  bool loading;
  List<Empleado> users;

  void initState() {
    users = [];
    loading = true;

    _loadUsers();

    super.initState();
  }

  void _loadUsers() async {
    int totalEmpleados = Departamento.totalEmpleados(departamentos);
    final response = await http.get('https://randomuser.me/api/?nat=es&results=$totalEmpleados');
    final json = jsonDecode(response.body);
    List<Empleado> _users = [];
    for (var jsonUser in json['results']) {
      _users.add(Empleado.fromJson(jsonUser));
    }
    setState(() {
      users = _users;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(users[index].fullname),
          subtitle: Text(users[index].username),
          leading: CircleAvatar(backgroundImage: NetworkImage(users[index].photoUrl)),
          trailing: Icon(Icons.keyboard_arrow_right),
        );
      },
      itemCount: users.length,
    );
  }
}

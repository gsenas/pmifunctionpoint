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

class User {
  String fullname, username, photoUrl;
  User(this.fullname, this.username, this.photoUrl);
  User.fromJson(Map<String, dynamic> json)
    : fullname = json['name']['first'] + ' ' + json['name']['last'],
    username = json['login']['username'],
    photoUrl = json['picture']['medium'];
}

class _UserListState extends State<UserList> {
  bool loading;
  List<User> users;

  void initState() {
    users = [];
    loading = true;

    _loadUsers();

    super.initState();
  }

  void _loadUsers() async {
    final response = await http.get('https://randomuser.me/api/?nat=es&results=$numEmpleados');
    final json = jsonDecode(response.body);
    List<User> _users = [];
    for (var jsonUser in json['results']) {
      _users.add(User.fromJson(jsonUser));
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

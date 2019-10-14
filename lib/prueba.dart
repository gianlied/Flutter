import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_integrador/user.dart';

class Prueba extends StatefulWidget {
  State<StatefulWidget> createState() => _Prueba();
}

class _Prueba extends State<Prueba> {
  // This widget is the root of your application.
  // List<User> _users = List<User>();

  Future<List<Datos>> fetchUser(http.Client client) async {
    var url = 'http://192.168.2.115/api/login/login.php?username=' +
        'gcarvajal' +
        "&password=" +
        'madoka';
    var response = await client.get(url);
    //var userJson = json.decode(response.body);
    return compute(parseUser, response.body);
  }

  List<Datos> parseUser(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Datos>((json) => Datos.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('prueba de Json'),
        ),
        body: Container(
          child: FutureBuilder<List<Datos>>(
            future: fetchUser(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? UserList(users: snapshot.data)
                    :Center(child: CircularProgressIndicator());
                    
                  },
                ),
              ));
      }            
}
        /*ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: <Widget>[Text(_users[index].name), Text(_users[index].lastname)],
            ),
          );
        },
        itemCount: _users.length,
      ),*/
      class UserList extends StatelessWidget {
  final List<Datos> users;

  UserList({Key key, this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Image.network(users[index].name);
      },
    );
  }
}

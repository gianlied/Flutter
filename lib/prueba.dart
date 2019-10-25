import 'dart:convert';

//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:proyecto_integrador/user.dart';

class Prueba extends StatefulWidget {
  //final String value;
  //Prueba({{Key key, this.value}}): super(key: key);
  State<StatefulWidget> createState() => _Prueba();
}

class _Prueba extends State<Prueba> {
  Map data;
  List userData;
  String userid;

  Future fetchUser(String idUser) async {
    var url =
        'http://172.16.194.217/api/project_user/projects_user.php?id_user=2000';
    var response = await http.get(url);
    data = json.decode(response.body);
    print(data);
    setState(() {
      userData = data["data"];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUser(userid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('prueba de Json'),
      ),
      body: ListView.builder(
        itemCount: userData == null ? 0 : userData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("${userData[index]["title"]}"),
            ),
          );
        },
      ),
    );
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
/*class UserList extends StatelessWidget {
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
*/

import 'dart:convert';

//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:proyecto_integrador/user.dart';

class Prueba extends StatefulWidget {
  State<StatefulWidget> createState() => _Prueba();
}


class _Prueba extends State<Prueba> {
  Map data;
  List userData;

  Future fetchUser() async {
    var url = 'http://192.168.2.115/api/login/login.php?username=' +
        'gcarvajal' +
        "&password=" +
        'madoka';
    var response = await http.get(url);
    data = json.decode(response.body);
    setState(() {
      userData = data["data"];
    });
  }

 @override
  void initState() {
    super.initState();
    fetchUser();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('prueba de Json'),
        ),
        body: ListView.builder(
            itemCount: userData == null ? 0: userData.length,
            itemBuilder: (BuildContext context, int index){
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "${userData[index]["NAME"]}${userData[index]["LASTNAME"]}"
                  ),
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

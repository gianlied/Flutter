import 'dart:convert';

//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_integrador/tarea.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:proyecto_integrador/user.dart';

class Cliente extends StatefulWidget {
  //final String value;
  //Prueba({{Key key, this.value}}): super(key: key);
  State<StatefulWidget> createState() => _Cliente();
}

class _Cliente extends State<Cliente> {
  Map data;
  List userData;
  String userid;

  Future fetchUser(String idUser) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'userInfo';
    final value = prefs.getInt(key) ?? 0;
    var url = 'http://192.168.2.160/api/ingresos/ingresos.php?id_project=' +
        value.toString();
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
          title: Text('Ingresos'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          width: ScreenUtil.getInstance().setWidth(750),
          height: ScreenUtil.getInstance().setHeight(1334),
          color: Colors.black87,
          child: ListView.builder(
            itemCount: userData == null ? 0 : userData.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  color: Colors.black87,
                  child: InkWell(
                    onTap: () {
                      //_currentIndex = index;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Tarea()));
                    },
                    //color: Colors.black87,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "${userData[0]["title"]}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 6.0),
                          Text(
                            "cantidad: ${userData[0]["cantidad"]}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "fecha de ingreso: ${userData[0]["fecha_ejecutado"]}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ));
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
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:proyecto_integrador/rastreo.dart';
import 'package:proyecto_integrador/informe.dart';
import 'package:proyecto_integrador/prueba.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:proyecto_integrador/main.dart';

class SecondScreen extends StatefulWidget {
  final String value;
  final String username;
  final String password;
  SecondScreen({this.value, this.username, this.password});

  State<StatefulWidget> createState() => _SecondScreenState(value: value, username:username, password:password);
}

class _SecondScreenState extends State<SecondScreen> {
  // This widget is the root of your application.
  final String value;
  final String username;
  final String password;
  _SecondScreenState({this.value, this.username, this.password});
  int _currentIndex = 0;
  Map data;
  Map projects;
  List userData;
  List projectData;
  String userid;
  String identificacion;

  Future fetchProject(String idUser) async {
    var url =
        'http://172.16.208.90/API_PM/api/project_user/projects_user.php?id_user='+ value;
    var response = await http.get(url);
    projects = json.decode(response.body);
    print(projects);
    setState(() {
      projectData = projects["data"];
    });
  }
  Future fetchUser(String username, String password) async {
    var url =
        'http://192.168.2.160/API_PM/api/login/login.php?username=' +
        username +
        "&password=" +
        password;
    var response = await http.get(url);
    data = json.decode(response.body);
    print(data);
    setState(() {
      userData = data["data"];
    });
  }
 
  final List<Widget> _children = [Rastreo(), Informe(), Prueba()];
  @override
  void initState() {
    fetchUser(username, password);
    fetchProject(value);
    super.initState();
    /*fetchUser(username, password);
    fetchProject(value);*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapTapped,
        currentIndex: _currentIndex,
        backgroundColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              title: Text('inicio', style: TextStyle(color: Colors.white))),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.insert_drive_file, color: Colors.white),
            title: Text('rastreo', style: TextStyle(color: Colors.white)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart, color: Colors.white),
            title: Text('informe', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  void onTapTapped(int index) {
    setState(() {
      print(value);
      _currentIndex = index;
    });
  }
}

/*_read() async{
  final prefs = await SharedPreferences.getInstance();
  final key = 'userinfo';
  final value = prefs.getInt(key) ?? 0 ;
  print('read: $value');
}*/


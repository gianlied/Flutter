import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:proyecto_integrador/tarea.dart';

class Fase extends StatefulWidget {
  State<StatefulWidget> createState() => _Fase();
}

class _Fase extends State<Fase> {
  Map data;
  List userData;
  String userid;
  Map datos;
  List userData2;
  int count = 0;
  double progreso= 0.0;
  String texto= "";

  Future fetchUser() async {
    final prefs4 = await SharedPreferences.getInstance();
    final key4 = 'userInfo4';
    final value4 = prefs4.getString(key4) ?? " ";
    print("readome  $value4");
    var url =
        'http://172.16.208.90/API_PM/api/project_user/fases_project.php?id_project=' +
            value4;
    var response = await http.get(url);
    data = json.decode(response.body);
    print('omee');
    print(data);
    setState(() {
      userData = data['data'];
    });
    _checkTarea(context, userData);

  }
  /* Future fetchUser2() async {
    final prefs5 = await SharedPreferences.getInstance();
    final key5 = 'userInfo5';
    final value5 = prefs5.getString(key5) ?? " ";
    print("readome  $value5");
    var url2 =
        'http://192.168.2.160/api/project_user/tareas_fases/tareasFases?id_fase=' +
            value5;
    var response2 = await http.get(url2);
    data = json.decode(response2.body);
    print('omee22');
    //print(datos);
    setState(() {
    /*userData2 = data['data2'];*/
    /*  for(int index=0; index<=data.length; index++){
    if("${userData2[index]["estado"]}"=="satisfecho"){
      count++;
      print('entro');
      print(count);
      print(data.length);
    } else{
      print('no suma');
      print(count);
    }
  }*/
  count=1;
  progreso=(count/3)*100;
  texto=progreso.toString();
  print(progreso);
  //print(datos.length);
    });
  }*/
  /*void porcentaje() async {
  for(int i=0; 1<data2.length; i++){
    if("${userData[i]["estado"]}".contains('satisfecho')){
      count++;
    } else{
      print('no suma');
      print(count);
    }
  }
  progreso=(data2.length/count)*100;
  texto=progreso.toString();
  print(progreso);
}*/

  /*Future fetchUser2() async {
    var url =
        'http://192.168.1.32/api/project_user/faseTitulo.php?id_fase=4001';
    var response = await http.get(url);
    data2 = json.decode(response.body);
    print(data2);
    setState(() {
      userData2 = data2["titulo"];
    });
  }
  Future fetchUser3() async {
    var url =
        'http://192.168.1.32/api/project_user/faseTitulo.php?id_fase=4002';
    var response = await http.get(url);
    data3 = json.decode(response.body);
    print(data3);
    setState(() {
      userData3 = data3["titulo"];
    });
  }*/

  @override
  void initState() {
    fetchUser();
    //fetchUser2();
    super.initState();
    fetchUser();
    //fetchUser2();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fases'),
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
                      child: Text(
                        "${userData[index]["title"]}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ));
            },
          ),
        ));
  }
}
 /* @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      body: SafeArea(
          child: Container(
              width: ScreenUtil.getInstance().setWidth(750),
              height: ScreenUtil.getInstance().setHeight(1334),
              color: Colors.black87,
              child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Fases del proyecto',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                            child: ListView.builder(
                          itemCount:
                              data.length == null ? Container(
                                child: Center(
                                  child: Text("loading"),
                                ),
                              ) : data.length+1,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                                child: InkWell(
                                    onTap: () {
                                      //_currentIndex = index;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Tarea()));
                                    },
                                    child: Container(
                                      width: ScreenUtil.getInstance()
                                          .setWidth(750),
                                      height: ScreenUtil.getInstance()
                                          .setHeight(400),
                                      color: Colors.black87,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(
                                              height: ScreenUtil.getInstance()
                                                  .setHeight(20),
                                            ),
                                            Text(
                                              "${userData[index]["title"]}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: ScreenUtil.getInstance()
                                                  .setHeight(70),
                                            ),
                                            Container(
                                              width: ScreenUtil.getInstance()
                                                  .setWidth(550),
                                              height: ScreenUtil.getInstance()
                                                  .setHeight(100),
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Colors.white,
                                                      Colors.yellow
                                                    ],
                                                    begin:
                                                        Alignment.centerRight,
                                                    end: Alignment.centerLeft),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                texto,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                          ]),
                                    )));
                          },
                        )),
                      ])))),
    );
  }
}*/
_checkTarea(BuildContext context, List userData) async {
  final prefs5 = await SharedPreferences.getInstance();
  final key5 = 'userInfo5';
  final value5 = "${userData[0]['ID']}";
  prefs5.setString(key5, value5);
  print('read valor 5: $value5');
  print('enraaas');
}

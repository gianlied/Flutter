import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tarea extends StatefulWidget {
  State<StatefulWidget> createState() => _Tarea();
}

class _Tarea extends State<Tarea> {
  Map data;
  List userData;
  String userid;

  Future fetchUser() async {
    final prefs5 = await SharedPreferences.getInstance();
    final key5 = 'userInfo5';
    final value5 = prefs5.getString(key5) ?? " ";
    print("readome  $value5");
    var url =
        'http://172.16.208.90/API_PM/api/project_user/tareas_fases/tareasFases.php?id_fase=' +
            value5;
    var response = await http.get(url);
    data = json.decode(response.body);
    print('omee');
    print(data);
    setState(() {
      userData = data['data'];
    });
  }

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
    super.initState();
    fetchUser();
    /*fetchUser2();
    fetchUser3();*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tareas'),
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
                            "tarea: ${userData[index]["title"]}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 6.0),
                          Text(
                            "estado: ${userData[index]["estado"]}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                        ],
                      ),
                    ),
                  ));
            },
          ),
        ));
  }
}

/*  @override
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
                          'tareas',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                            child: ListView.builder(
                          itemCount:
                              userData.length == null ? 0 : userData.length,
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
                                              /*decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Colors.white,
                                                      Colors.yellow
                                                    ],
                                                    begin:
                                                        Alignment.centerRight,
                                                    end: Alignment.centerLeft),
                                              ),*/
                                              child: Center(
                                                  child: Text(
                                                "${userData[index]["estado"]}",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.white,
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
}
*/

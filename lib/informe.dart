import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_integrador/Fase.dart';
import 'package:proyecto_integrador/prueba.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Informe extends StatefulWidget {
  State<StatefulWidget> createState() => _Informe();
}

class _Informe extends State<Informe> {
  Map data;
  List userData;
  String userid;
  //int _currentIndex;

  Future fetchUser(String idUser) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'userInfo';
    final value = prefs.getInt(key) ?? 0;
    var url =
        'http://172.16.208.90/API_PM/api/project_user/projects_user.php?id_user=' +
            value.toString();
    var response = await http.get(url);
    data = json.decode(response.body);
    print(data);
    setState(() {
      userData = data["data"];
    });
    _checkFase(context, userData);
  }

  @override
  void initState() {
    fetchUser(userid);
    super.initState();
    //fetchUser(userid);
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('proyectos'),
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
                          MaterialPageRoute(builder: (context) => Fase()));
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
                          'proyectos',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                            child: ListView.builder(
                          itemCount:
                              data.length == null ? Container(
                                child: Center(
                                  child: Text("loading"),
                                ),
                              ) : data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                                child: InkWell(
                                    onTap: () {
                                      //_currentIndex = index;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Fase()));
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
                                                "50%",
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
}
*/
_checkFase(BuildContext context, List userData) async {
  final prefs4 = await SharedPreferences.getInstance();
  final key4 = 'userInfo4';
  final value4 = "${userData[0]['id_project']}";
  prefs4.setString(key4, value4);
  print('read: $value4');
  print('enraaas');
}

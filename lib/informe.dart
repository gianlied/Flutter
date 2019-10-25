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
    /*final loading = Container(
        height: ScreenUtil.getInstance().setHeight(834),
        width: ScreenUtil.getInstance().setWidth(650),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(7.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(0.0, 15.0),
                  blurRadius: 10.0),
              BoxShadow(
                color: Colors.black,
                offset: Offset(0.0, -8.0),
                blurRadius: 0.0,
              ),
            ]),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Loading',
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
            ]));*/

    var url =
        'http://192.168.2.115/api/project_user/projects_user.php?id_user=' +
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
    super.initState();
    fetchUser(userid);
  }

  @override
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

_checkFase(BuildContext context, List userData) async {
  final prefs4 = await SharedPreferences.getInstance();
  final key4 = 'userInfo4';
  final value4 = "${userData[0]['id_project']}";
  prefs4.setString(key4, value4);
  print('read: $value4');
  print('enraaas');
}

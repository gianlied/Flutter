//import 'package:proyecto_integrador/home.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
/*import 'package:http/http.dart' show get;
import 'dart:convert';*/

//void main() => runApp(RastreoScreen());

class Rastreo extends StatefulWidget {
  State<StatefulWidget> createState() => _Rastreo();
}

class _Rastreo extends State<Rastreo> {
  // This widget is the root of your application.Map data;
  Map data;
  List userData;
  String userid;
  String valorS;

  Future fetchUser() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'userInfo';
    final value = prefs.getInt(key) ?? 0;
    final prefs2 = await SharedPreferences.getInstance();
    final key2 = 'userInfo2';
    final value2 = prefs2.getString(key2) ?? "";
    valorS = value2;
    print('ayuda');
    print("read $value2");
    print(valorS);
    var url =
        'http://172.16.208.90/API_PM/api/project_user/projects_user.php?id_user=' +
            value.toString();
    var response = await http.get(url);
    data = json.decode(response.body);
    print('probando');
    print("read $value");
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
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    // TextStyle nani = TextStyle(fontFamily: 'Roboto-Regular', fontSize: 20.0);
    final bienvenido = RichText(
        text: TextSpan(
            text: 'Bienvenido señor $valorS',
            style: TextStyle(
              fontFamily: 'Roboto-Regular',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )));
   /* final sendbutton = Material(
      elevation: 8.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.black,
      child: RichText(
          text: TextSpan(
              text: 'nombre del proyecto',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
            TextSpan(
                text: 'breve descripcion del proyecto',
                style: TextStyle(
                  color: Colors.white,
                ))
          ])),
    );*/
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: ScreenUtil.getInstance().setHeight(1334),
        width: ScreenUtil.getInstance().setWidth(750),
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(20),
              ),
              bienvenido,
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(100),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: userData == null
                      ? Container(
                          child: Center(
                            child: Text("loading"),
                          ),
                        )
                      : userData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        child: Container(
                      alignment: FractionalOffset.center,
                      //margin: EdgeInsets.all(10.0),
                      width: double.infinity,
                      height: ScreenUtil.getInstance().setHeight(120),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
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
                            "${userData[index]["title"]}" +
                                (index + 1).toString(),
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                          SizedBox(
                              height: ScreenUtil.getInstance().setHeight(20)),
                        ],
                      ),
                    ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
/*return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                  child: Container(
                color: Colors.black87,
                child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(20),
                        ),
                        bienvenido,
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(150),
                        ),
                        Container(
                          width: double.infinity,
                          height: ScreenUtil.getInstance().setHeight(100),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(0.0, 15.0),
                                    blurRadius: 10.0),
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0.0, -8.0),
                                  blurRadius: 0.0,
                                )
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Titulo del proyecto Numero x",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                              SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(10)),
                              Text(
                                "breve descripcion del proyecto",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        //sendbutton,
                        SizedBox(
                            height: ScreenUtil.getInstance().setHeight(100)),
                        Container(
                          width: double.infinity,
                          height: ScreenUtil.getInstance().setHeight(100),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(0.0, 15.0),
                                    blurRadius: 10.0),
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0.0, -8.0),
                                  blurRadius: 0.0,
                                )
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Titulo del proyecto Numero x",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                              SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(10)),
                              Text(
                                "breve descripcion del proyecto",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: ScreenUtil.getInstance().setHeight(400)),
                      ],
                    )),
              ))
            ],
          ),
        ],
      ),
    );
  }
}

*/
/*Future <int> _read() async{
  final prefs = await SharedPreferences.getInstance();
  final key = 'userInfo';
  final value = prefs.getInt(key) ?? 0;
  print('vamoss');
  print('read: $value');
  return value;
}*/

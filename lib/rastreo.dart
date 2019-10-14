//import 'package:proyecto_integrador/home.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
/*import 'package:http/http.dart' show get;
import 'dart:convert';*/

//void main() => runApp(RastreoScreen());

class Rastreo extends StatefulWidget {
  State<StatefulWidget> createState() => _Rastreo();
}

class _Rastreo extends State<Rastreo> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    // TextStyle nani = TextStyle(fontFamily: 'Roboto-Regular', fontSize: 20.0);
    final bienvenido = RichText(
        text: TextSpan(
            text: 'Bienvenido señor ABC',
            style: TextStyle(
              fontFamily: 'Roboto-Regular',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )));
    final sendbutton = Material(
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
    );

    return Scaffold(
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

import 'package:proyecto_integrador/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
      /*child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("Titulo del proyecto",
            textAlign: TextAlign.center,
            style:
                style.copyWith(color: Colors.white, fontFamily: 'Roboto-Bold')),
      ),*/
    );
    /*final emergente = RichText(
        text: TextSpan(
            text: 'volver',
            style: TextStyle(
                fontFamily: 'Roboto-Regular',
                fontSize: 20,
                color: Colors.blue,
                decoration: TextDecoration.none),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              }));*/
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black87,
          child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 25.0),
                  bienvenido,
                  SizedBox(height: 50.0),
                  sendbutton,
                  SizedBox(height: 50.0),
                ],
              )),
        ),
      ),
    );
  }
}


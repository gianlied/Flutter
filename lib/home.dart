import 'package:flutter/material.dart';
import 'package:proyecto_integrador/rastreo.dart';
import 'package:proyecto_integrador/informe.dart';
import 'package:proyecto_integrador/prueba.dart';

void main() => runApp(new SecondScreen());

class SecondScreen extends StatefulWidget {
  State<StatefulWidget> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  // This widget is the root of your application.
  int _currentIndex = 0;
    final List<Widget> _children = [
      Rastreo(),
      Informe(Colors.green),
      Prueba()
    ];
  @override
  Widget build(BuildContext context) {
    /*final bienvenido = RichText(
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
    );*/

    return Scaffold(
      body: _children[_currentIndex],
      /*  child: Container(
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
      ),*/
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
      _currentIndex = index;
    });
  }
}

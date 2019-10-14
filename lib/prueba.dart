import 'package:flutter/material.dart';

class Prueba extends StatefulWidget {
  State<StatefulWidget> createState() => _Prueba();
}

class _Prueba extends State<Prueba> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('prueba de Json'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index){
          return Card(
            child: Column(
              children: <Widget>[
                Text('note Title'),
                Text('note Text')
              ],
            ),
          );
        },
        itemCount: 50,
      ),
    );

  }}
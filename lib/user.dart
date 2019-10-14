import 'package:flutter/foundation.dart';

class Datos{
  final int id;
  final String name;
  final String lastname;
  final String username;
  final String typeUser;

  Datos({this.id, this.name ,this.lastname, this.username, this.typeUser});

  factory Datos.fromJson(Map<String, dynamic> parsedJson){
    return Datos(
      id:parsedJson['id'] as int,
      name:parsedJson['name'].toString(),
      lastname:parsedJson['lastname'].toString(),
      username:parsedJson['username'].toString(),
      typeUser:parsedJson['typeUser'].toString(),
    );
  }
}


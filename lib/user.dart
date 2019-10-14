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
      name:parsedJson['name'] as String,
      lastname:parsedJson['lastname'] as String,
      username:parsedJson['username'] as String,
      typeUser:parsedJson['typeUser'] as String,
    );
  }
}


import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:proyecto_integrador/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyAppScreen());
}

class MyAppScreen extends StatefulWidget {
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyAppScreen> {
  Map user;
  List obtenerId;
  bool visibilad = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto',
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      )
          //primarySwatch: Colors.brown,
          ),
      home: MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Roboto-Regular', fontSize: 20.0);
  Map user;
  bool userTrue = false;
  List obtenerId;
  bool visibilad = false;
  Future verifyLogin(String username, String password, BuildContext context,
      int numero) async {
    var url = 'http://172.16.194.217/api/login/login.php?username=' +
        username +
        "&password=" +
        password;
    final response = await http.get(url);
    final String res = response.body;
    print(res);
    user = json.decode(response.body);
    if (res.contains('none') == false) {
      setState(() {
        obtenerId = user["data"];
        userTrue = false;
      });
       _checkLogIn(context, obtenerId);
    } else {
      setState(() {
        userTrue = true;
      });
      print(userTrue);
      print('nada');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String valueUsername = "";
    String valuePassword = "";
    int numero = 0;

    final UsernameField = TextField(
      onChanged: (text) {
        valueUsername = text;
      },
      obscureText: false,
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",
          hintStyle: TextStyle(
              color: Colors.grey, fontFamily: 'Roboto-Regular', fontSize: 20.0),
          border: UnderlineInputBorder(borderSide: BorderSide())),
    );

    final passwordField = TextField(
      onChanged: (text) {
        valuePassword = text;
      },
      obscureText: true,
      style: TextStyle(
        color: Colors.grey, /*fontFamily: 'Roboto-Regular'*/
      ),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          hintStyle: TextStyle(
              color: Colors.grey, fontFamily: 'Roboto-Regular', fontSize: 20.0),
          border: UnderlineInputBorder(borderSide: BorderSide())),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          print('Login Button Pressed!');
          verifyLogin(valueUsername, valuePassword, context, numero);
          //_showDialog();
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style:
                style.copyWith(color: Colors.white, fontFamily: 'Roboto-Bold')),
      ),
    );
    final forgotPassword = RichText(
        text: TextSpan(
            text: 'Olvide mi contraseña',
            style: TextStyle(
                fontFamily: 'Roboto-Regular',
                fontSize: 20,
                color: Colors.blue,
                decoration: TextDecoration.none),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LossPasword()));
              }));
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 2.0),
                UsernameField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 10.0,
                ),
                Visibility(
                  child: Text('wrong password',
                      style: new TextStyle(color: Colors.red)),
                  visible: userTrue,
                ),
                SizedBox(
                  height: 105.0,
                ),
                loginButon,
                SizedBox(
                  height: 35.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                forgotPassword,
                SizedBox(
                  height: 10.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LossPasword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String valueEmail = "";
    TextStyle style = TextStyle(fontFamily: 'Roboto-Regular', fontSize: 20.0);
    final forgotpassword = TextField(
        onChanged: (text) {
          valueEmail = text;
        },
        obscureText: false,
        style: TextStyle(
          color: Colors.grey, /*fontFamily: 'Roboto-Regular'*/
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Email",
            hintStyle: TextStyle(
                color: Colors.grey,
                fontFamily: 'Roboto-Regular',
                fontSize: 20.0),
            border: UnderlineInputBorder(borderSide: BorderSide())));
    final volver = RichText(
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
              }));
    final sendbutton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          print('bottonpress');
          verifyEmail(valueEmail, context);
        },
        child: Text("Enviar",
            textAlign: TextAlign.center,
            style:
                style.copyWith(color: Colors.white, fontFamily: 'Roboto-Bold')),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 25.0),
                  forgotpassword,
                  SizedBox(height: 25.0),
                  sendbutton,
                  SizedBox(height: 20.0),
                  volver,
                ],
              )),
        ),
      ),
    );
  }
}

Future verifyEmail(String email, BuildContext context) async {
  try {
    var url =
        'http://192.168.2.115/api/login/forgotPassword.php?email=' + email;
    final response = await http.get(url);
    final String res = response.body;
    print(res);
    if (res.contains(email) == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SecondScreen()));
      print('entro');

    } else {
      print('aaa');
    }
    //print(data[0]["NAME"]);
  } catch (e) {
    print(e);
  }
}
_checkLogIn(BuildContext context, List obtenerId) async {

  final prefs = await SharedPreferences.getInstance();
  final key = 'userInfo';
  final value = int.parse("${obtenerId[0]['ID']}");
  final prefs2 = await SharedPreferences.getInstance();
  final key2 = 'userInfo2';
  final value2 = "${obtenerId[0]['NAME']}";
  prefs.setInt(key, value);
  prefs2.setString(key2, value2);
  print('saved $value');
  print('grabado $value2');

  Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
}
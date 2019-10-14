import 'package:proyecto_integrador/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyAppScreen());
}

class MyAppScreen extends StatefulWidget {
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyAppScreen> {
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
  bool user = false;
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
          setState(() {
            user = !user;
          });
          print(user);
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
                  visible: user,
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

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Contrasena incorrecta"),
          content: new Text("Por favor ingrese la contrasena correcta"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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

/*class WelcomeUser extends StatelessWidget {
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
              )
        )
      );
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
              )
            )
          ]
        )
      ),
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            title: Text('inicio',style: TextStyle(color: Colors.white))
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.insert_drive_file, color: Colors.white),
            title: Text('rastreo',style: TextStyle(color: Colors.white)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart, color: Colors.white ),
            title: Text('informe', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
*/
Future verifyLogin(
    String username, String password, BuildContext context, int numero) async {
  try {
    var url = 'http://192.168.2.115/api/login/login.php?username=' +
        username +
        "&password=" +
        password;
    final response = await http.get(url);
    final String res = response.body;
    if (res.contains('none') == false) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SecondScreen()));
      print(res);
      print('entro');
    } else {
      print('aaaaa');
      //print(data[0]["NAME"]);
    }
    
  } catch (e) {
    print(e);
  }
}

Future verifyEmail(String email, BuildContext context) async {
  try {
    var url = 'http://192.168.2.115/api/login/forgotPassword.php?email=' + email;
    final response = await http.get(url);
    final String res = response.body;
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Informe extends StatefulWidget {
  State<StatefulWidget> createState() => _Informe();
}

class _Informe extends State<Informe> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Container(
                  width: ScreenUtil.getInstance().setWidth(750),
                  color: Colors.black87,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(20),
                      ),
                      Text(
                        'Progreso del proyecto',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold ),
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(70),
                      ),
                      Container(
                        width: ScreenUtil.getInstance().setWidth(550),
                        height: ScreenUtil.getInstance().setHeight(80),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.white, Colors.yellow],
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft),
                        ),
                        child: Center(
                            child: Text(
                          "50%",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(150),
                      ),
                      Text(
                        'Progreso de las fases',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold ),
                      ),
                      SizedBox(height: ScreenUtil.getInstance().setHeight(75)),
                      Text(
                        'fase #',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: ScreenUtil.getInstance().setHeight(50)),
                      Container(
                        width: ScreenUtil.getInstance().setWidth(550),
                        height: ScreenUtil.getInstance().setHeight(80),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.white, Colors.red],
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft),
                        ),
                        child: Center(
                            child: Text(
                          "50%",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

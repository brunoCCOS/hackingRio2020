import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 6)).then((_){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Map()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
            color: Colors.black,
            child: Center(
              child: Container(
                width: 150,
                height: 150,
                child: Image.asset("assets/logo_app.png"),
              ),
            )
        );
  }
}
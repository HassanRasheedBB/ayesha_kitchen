import 'package:flutter/material.dart';
import 'package:ayeshakitchen/home_page.dart';
import 'dart:async';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    )
  );
}

class SplashScreen extends StatefulWidget{
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{


  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
      Duration(seconds: 3),
       (){
             Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
             );
       },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 400,
        ),
      ),
    );

  }

}


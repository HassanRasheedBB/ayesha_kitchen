import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pin_put/pin_put.dart';


class CodeVerification extends StatelessWidget {

  final String text;
  CodeVerification({Key key, @required this.text}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter login UI',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: _CodeVerification(text: text),
    );
  }
}

class _CodeVerification extends StatefulWidget {
  _CodeVerification({Key key, this.text}) : super(key: key);
  final String text;
  @override
  _CodeVerificationState createState() => _CodeVerificationState(text);
}

class _CodeVerificationState extends State<_CodeVerification> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 22.0);
  TextStyle style_sub = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Color(0xff01A0C7)),
      borderRadius: BorderRadius.circular(15),
    );
  }

  String text;
  _CodeVerificationState(String text){
    this.text = text;
    //Fluttertoast.showToast(msg: text);
  }



  @override
  Widget build(BuildContext context) {

    final text_title = Container(
        margin: EdgeInsets.only(left: 32.0, right: 32.0,top: 16),
        child:  Text(
          "Verify "+text,
          textAlign: TextAlign.center,
          style: style,
        )
    );


    final text_sub_title = Container(
      margin: EdgeInsets.only(left: 32.0, right: 32.0),
      child: Text(
        "Please enter the verification code sent to "+text,
        textAlign: TextAlign.center,
        style: style_sub,

      ),
    );


    final image_back = InkWell(
      onTap: back_btn_clicked,
      child: Container( alignment: Alignment.centerLeft,

        margin: EdgeInsets.only(top: 48, left: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Icon(Icons.arrow_back_ios,size: 28),

        ),),
    );


    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) {
          return Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(

                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  image_back,

                  text_title,

                  SizedBox(height: 28.0),

                  text_sub_title,

                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(bottom: 20.0, left: 32.0, right: 32.0, top: 20.0),

                    child: PinPut(
                      fieldsCount: 6,
                      onSubmit: (String pin) => verifyCode(pin, context),
                      focusNode: _pinPutFocusNode,
                      controller: _pinPutController,
                      submittedFieldDecoration: _pinPutDecoration.copyWith(
                          borderRadius: BorderRadius.circular(20)),
                      selectedFieldDecoration: _pinPutDecoration,
                      textStyle: style_sub,
                      followingFieldDecoration: _pinPutDecoration.copyWith(
                        borderRadius: BorderRadius.circular(5),

                        border: Border.all(
                          color: Color(0xff01A0C7),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }

  verifyCode(String pin, BuildContext context) {
    Fluttertoast.showToast(msg: text + "---" +pin);
  }

//  void _showSnackBar(String pin, BuildContext context) {
//    final snackBar = SnackBar(
//      duration: Duration(seconds: 3),
//      content: Container(
//          height: 80.0,
//          child: Center(
//            child: Text(
//              'Pin Submitted. Value: $pin',
//              style: TextStyle(fontSize: 25.0),
//            ),
//          )),
//      backgroundColor: Colors.deepPurpleAccent,
//    );
//    Scaffold.of(context).hideCurrentSnackBar();
//    Scaffold.of(context).showSnackBar(snackBar);
//  }



  void back_btn_clicked() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      SystemNavigator.pop();
    }
  }
}

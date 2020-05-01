import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'CodeVerification.dart';

class HomePage extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter login UI',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: _HomePage(title: 'Flutter Login'),
    );
  }
}

class _HomePage extends StatefulWidget {
  _HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<_HomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextStyle style_head = TextStyle(fontFamily: 'Montserrat', fontSize: 24.0);
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final emailField = TextField(
      obscureText: false,
      controller: myController,
      style: style,
      keyboardType: TextInputType.number,
      maxLength: 11,
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      decoration: InputDecoration(

          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Phone Number",
          prefixIcon: Icon(Icons.call),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: btnClicked,
        child: Text("Send Code",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );


    final text_title = Text(
      "Verify your phone number",
      textAlign: TextAlign.center,
      style: style_head,
    );


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(

        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 48.0,right: 28.0,left: 28.0,bottom: 0.0),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/users.png",
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(height: 45.0),

                text_title,

                SizedBox(height: 45.0),
                emailField,
                SizedBox(
                  height: 24.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void btnClicked() {
    if(myController.text.length == 11) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CodeVerification(text: myController.text),
        ),
      );
    }else{
      Fluttertoast.showToast(msg: "Invalid Number");
    }
  }
}
import 'package:flutter/material.dart';
import 'package:ewal/pages/homepage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../colors.dart';

class LoginPage extends StatelessWidget {
  final String value;
  LoginPage({ Key? key,required this.value }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoginBody(value: value)
      ),
    );
  }
}


class LoginBody extends StatefulWidget {
 String value;

 LoginBody({ Key? key,required this.value }) : super(key: key);
  

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {

  @override
  Dio dio = new Dio();
  final TextEditingController phoneNumberCon = TextEditingController();
  postDataLogin() async {
    dynamic data = {"phone": phoneNumberCon.text};
    var path = 'http://localhost:3000/login';
    var res = await dio.post(path, data: data);
    if (res.statusCode == 200) {
      print(res.data);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150.0,
              width: 190.0,
              padding: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
              ),
              child: Center(
                child: Image.asset('assets/logo_light.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, right: 30, left: 30, bottom: 20),
                  child: Column(
                    children: [
                      Text(
                        'لطفا گذرواژه خود را وارد کنید',
                        textDirection: TextDirection.rtl,
                        style:
                            TextStyle(color: text, fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 8),
                        child: TextField(
                          enabled: false,
                          cursorColor: mainColor,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 10.0),
                            border: OutlineInputBorder(),
                            labelText:widget.value,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: mainColor,
                                style: BorderStyle.solid,
                                width: 1,
                              ),
                            ),
                            labelStyle: TextStyle(
                              color: unselectinput,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0, bottom: 10),
                        child: TextField(
                          cursorColor: mainColor,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 10.0),
                            border: OutlineInputBorder(),
                            labelText: 'گذرواژه',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: mainColor,
                                style: BorderStyle.solid,
                                width: 1,
                              ),
                            ),
                            labelStyle: TextStyle(
                              color: mainColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: mainColor,
                        ),
                        child: InkWell(
                          onTap: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: Text(
                            'ورود',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 100),
                      InkWell(
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Text(
                          'ورود با رمز یکبار مصرف',
                          style: TextStyle(
                              color: mainColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


  

// Expanded(
// child: Center(
// child: InkWell(
// onTap: () async {
// Navigator.push(context,
//   MaterialPageRoute(builder: (context) => homePage()));
//},

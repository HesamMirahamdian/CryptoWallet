import 'dart:async';
import 'package:dio/dio.dart';
import 'package:ewal/pages/login.dart';
import 'package:ewal/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:ewal/colors.dart';

import 'otp.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final TextEditingController phoneNumberCon = TextEditingController();
  String phone = "";

  Dio dio = new Dio();
  postDataSignUp() async {
    dynamic data = {"phone": phoneNumberCon.text};
    var path = 'http://localhost:3000/register';
    var res = await dio.post(path, data: data);
    if (res.statusCode == 200) {
      print(phone);

      // This is Changed
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SignUpPage(
                    phone: phoneNumberCon.text,
                  )));
                  //****
    } else {
       showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context));
    }
  }
Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('خطای ورود'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("شماره تلفن اشتباه می باشد"),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('باشه'),
      ),
    ],
  );
}
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bg,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: Center(
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
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 30, right: 30, left: 30, bottom: 30),
                    child: Column(
                      children: [
                        Text(
                          'لطفا برای ادامه شماره تلفن خود را وارد کنید',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(color: text),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            controller: phoneNumberCon,
                            cursorColor: mainColor,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 10.0),
                              border: OutlineInputBorder(),
                              hintText: "0912********",
                              hintStyle: TextStyle(color: unselectinput),
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Otp(
                                            phone: phoneNumberCon.text,
                                          )));
                            },
                            child: Align(
                              child: Text(
                                'ورود / ثبت نام',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
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
      ),
    );
  }
}

/*
final name =ModalRotate.of(Context).Setting.argomant as string;

شماره تلفنت مثلا string باشه
*/

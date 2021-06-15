import 'package:dio/dio.dart';
import 'package:ewal/main.dart';
import 'package:flutter/material.dart';
import 'package:ewal/colors.dart';
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otp extends StatefulWidget {
  final String phone;
  Otp({ Key? key,required this.phone }) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<Otp> {
  
  final TextEditingController phoneNumberCon = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  Dio dio = new Dio();
  postDataSignUp() async {
    dynamic data = {"phone": phoneNumberCon.text};
    var path = 'http://localhost:3000/register';
    var res = await dio.post(path, data: data);
    if (res.statusCode == 200) {
      print(res.data);
    }
  }

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bg,
      body: GestureDetector(
        onTap: () {},
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  SizedBox(height: height / 8),
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
                  SizedBox(height: 10),
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
                        padding: const EdgeInsets.only(top: 30, bottom: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'لطفا کد ارسال شده را وارد کنید',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  color: text, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 20),
                            Form(
                              key: formKey,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 80),
                                  child: PinCodeTextField(
                                    appContext: context,
                                    pastedTextStyle: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textStyle: TextStyle(
                                      color: mainColor,
                                    ),
                                    length: 4,
                                    blinkWhenObscuring: true,
                                    animationType: AnimationType.fade,
                                    pinTheme: PinTheme(
                                      activeColor: mainColor,
                                      shape: PinCodeFieldShape.box,
                                      borderRadius: BorderRadius.circular(5),
                                      selectedFillColor: bg,
                                      selectedColor: mainColor,
                                      fieldHeight: 60,
                                      fieldWidth: 50,
                                      inactiveFillColor: bg,
                                      inactiveColor: mainColor,
                                      activeFillColor:
                                          hasError ? mainColor : Colors.white,
                                    ),
                                    cursorColor: mainColor,
                                    animationDuration:
                                        Duration(milliseconds: 300),
                                    enableActiveFill: true,
                                    errorAnimationController: errorController,
                                    controller: textEditingController,
                                    keyboardType: TextInputType.number,
                                    boxShadows: [
                                      BoxShadow(
                                        offset: Offset(0, 1),
                                        color: Colors.black12,
                                        blurRadius: 10,
                                      )
                                    ],
                                    onCompleted: (v) {
                                      print("Completed");
                                    },
                                    // onTap: () {
                                    //   print("Pressed");
                                    // },
                                    onChanged: (value) {
                                      print(value);
                                      setState(() {
                                        currentText = value;
                                      });
                                    },
                                    beforeTextPaste: (text) {
                                      print("Allowing to paste $text");
                                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                      return true;
                                    },
                                  )),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                hasError ? "لطفا کد ارسال شده را وارد" : "",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 30),
                              child: ButtonTheme(
                                height: 50,
                                child: TextButton(
                                  onPressed: () {
                                    formKey.currentState!.validate();
                                    // conditions for validating
                                    if (currentText.length != 4 ||
                                        currentText != "1234") {
                                      errorController!.add(ErrorAnimationType
                                          .shake); // Triggering error shake animation
                                      setState(() {
                                        hasError = true;
                                      });
                                    } else {
                                      setState(
                                        () {
                                          hasError = false;
                                          snackBar("کد با موفقیت تایید شد");
                                        },
                                      );
                                    }
                                  },
                                  child: Center(
                                      child: Text(
                                    "تایید کد".toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            TextButton(
                              onPressed: () => snackBar("کد ارسال شد"),
                              child: Text(
                                "فرستادن مجدد کد",
                                style: TextStyle(
                                    color: mainColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

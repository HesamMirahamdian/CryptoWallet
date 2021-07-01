import 'dart:async';
import 'package:ewal/colors.dart';
import 'package:ewal/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:persian/persian.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:shamsi_date/extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: [
        const Locale('fa', 'IR'), // American English
      ],
      home: HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: bg,
      body: Column(
        children: [
          Container(
            width: width,
            height: 120.0,
            decoration: BoxDecoration(
              color: appBarColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                children: [
                  Container(
                    width: width / 1.7,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 10.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'موجودی کل',
                              style: TextStyle(
                                  color: bg,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '10.800.000',
                                style: TextStyle(
                                    color: bg,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'تومان',
                                style: TextStyle(
                                    color: bg,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: width / 3.2,
                    height: 83,
                    decoration: BoxDecoration(
                      color: bg,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 18.0,
                                backgroundColor: mainColor,
                                child: Icon(
                                  Icons.upload,
                                  color: bg,
                                ),
                              ),
                              Text(
                                'خرید',
                                style:
                                    TextStyle(fontSize: 13.0, color: mainColor),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 18.0,
                                backgroundColor: mainColor,
                                child: Icon(
                                  Icons.download,
                                  color: bg,
                                ),
                              ),
                              Text(
                                'فروش',
                                style:
                                    TextStyle(fontSize: 13.0, color: mainColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Container(
              width: width,
              height: height / 4.2,
              decoration: BoxDecoration(
                color: mainColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 4,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'نمودار دارایی',
                        style: TextStyle(
                            color: bg,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ارز های خریده شده',
                  style: TextStyle(color: appBarColor, fontSize: 18.0),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: mainColor),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      'همه',
                      style: TextStyle(
                          color: mainColor, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Container(
              width: width,
              height: height / 3.5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3.5, vertical: 4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: FlutterLogo(
                            size: 38.0,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'باننس',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '000.000.1 BNB',
                                style:
                                    TextStyle(color: mainColor, fontSize: 14.0),
                              )
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '25.000.000 تومان',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontSize: 14.0),
                              ),
                              Text(
                                '1.000.000 تومان',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3.5, vertical: 4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: FlutterLogo(
                            size: 38.0,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'باننس',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '000.000.1 BNB',
                                style:
                                    TextStyle(color: mainColor, fontSize: 14.0),
                              )
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '25.000.000 تومان',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontSize: 14.0),
                              ),
                              Text(
                                '1.000.000 تومان',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3.5, vertical: 4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: FlutterLogo(
                            size: 38.0,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'باننس',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '000.000.1 BNB',
                                style:
                                    TextStyle(color: mainColor, fontSize: 14.0),
                              )
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '25.000.000 تومان',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontSize: 14.0),
                              ),
                              Text(
                                '1.000.000 تومان',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3.5, vertical: 4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: FlutterLogo(
                            size: 38.0,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'باننس',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '000.000.1 BNB',
                                style:
                                    TextStyle(color: mainColor, fontSize: 14.0),
                              )
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '25.000.000 تومان',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontSize: 14.0),
                              ),
                              Text(
                                '1.000.000 تومان',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3.5, vertical: 4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: FlutterLogo(
                            size: 38.0,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'باننس',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '000.000.1 BNB',
                                style:
                                    TextStyle(color: mainColor, fontSize: 14.0),
                              )
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '25.000.000 تومان',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontSize: 14.0),
                              ),
                              Text(
                                '1.000.000 تومان',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3.5, vertical: 4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: FlutterLogo(
                            size: 38.0,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'باننس',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '000.000.1 BNB',
                                style:
                                    TextStyle(color: mainColor, fontSize: 14.0),
                              )
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '25.000.000 تومان',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontSize: 14.0),
                              ),
                              Text(
                                '1.000.000 تومان',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3.5, vertical: 4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: FlutterLogo(
                            size: 38.0,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'باننس',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '000.000.1 BNB',
                                style:
                                    TextStyle(color: mainColor, fontSize: 14.0),
                              )
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '25.000.000 تومان',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontSize: 14.0),
                              ),
                              Text(
                                '1.000.000 تومان',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.8),
                                    fontSize: 14.0),
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
          ),
        ],
      ),
    );
  }
}

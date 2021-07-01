import 'dart:async';
import 'package:ewal/colors.dart';
import 'package:ewal/pages/buyandsell.dart';
import 'package:ewal/pages/homepage.dart';
import 'package:ewal/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:persian/persian.dart';
import 'package:provider/provider.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:shamsi_date/extensions.dart';
import 'package:intl/intl.dart';
import 'components/appBar.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale('fa', 'IR')],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: BottomNavigationApp(),
    );
  }
}

class BottomNavigationApp extends StatefulWidget {

  @override
  _BottomNavigationAppState createState() => _BottomNavigationAppState();
}

class _BottomNavigationAppState extends State<BottomNavigationApp> {

  String _timeString = "";

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getTime() {
    final DateTime mydate = DateTime.now();
    final String formattedDateTime = _formatDateTime(mydate);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    Gregorian g1 = Gregorian.now();
    Jalali j1 = g1.toJalali();
    String format1(Date d) {
      final f = d.formatter;

      return '${f.wN}';
    }

    final DateTime mydate = DateTime.now();
    PersianDate persian = mydate.toPersian();
    return DateFormat("${persian}   hh:mm:ss   ${format1(j1)}")
        .format(dateTime);
  }



  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePageBody(),
    BuyAndSell(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: appBarColor,
        leading: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: InkWell(
            onTap: (){},
            child: CircleAvatar(backgroundColor: bg,),
          ),
        ),

        centerTitle: true,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(color: bg),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 15.0),
            child: Text(_timeString,style: TextStyle(fontSize: 14.0),),
          )),

        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
        ],
      ),
      body:Center(child:
            _widgetOptions.elementAt(_selectedIndex),),
          /*SingleChildScrollView(
            scrollDirection: Axis.vertical,
                      child: Column(
      children: [
        Container(
            width: width,
            height: 240.0,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 180.0,
                  color: appBarColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: bg,
                          radius: 25.0,
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: bg),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Text(
                              _timeString,
                              style: TextStyle(
                                color: bg,
                              ),
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications,
                              color: bg,
                              size: 30.0,
                            ))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 130.0,
                  height: 110.0,
                  width: width,
                  child: Row(
                    children: [
                      Container(
                        width: width / 1.8,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 10.0, top: 18.0, bottom: 10.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'موجودی کل',
                                  style: TextStyle(
                                      color: bg,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '10.000.000 تومان',
                                    style: TextStyle(
                                        color: bg,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.0),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "45% ",
                                          style: TextStyle(fontSize: 14.0),
                                        ),
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.trending_up_sharp,
                                            size: 18,
                                            color: bg,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: width / 3.2,
                        height: 80,
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
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
                                    style: TextStyle(
                                        fontSize: 13.0, color: mainColor),
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
                                    style: TextStyle(
                                        fontSize: 13.0, color: mainColor),
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
              ],
            ),
        ),
        Center(child:
            _widgetOptions.elementAt(_selectedIndex),
        ),
        ],
      ),
          ),*/
     bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'خانه',
            backgroundColor: mainColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumbs_up_down),
            label: 'خرید و فروش',
            backgroundColor: mainColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'پروفایل',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: mainColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
import 'dart:async';

import 'package:ewal/colors.dart';
import 'package:ewal/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:persian/persian.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:shamsi_date/extensions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: BottomNav(),
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final String arrow = 'assets/icons/arrow_left.svg';
  final String doge = 'assets/icons/dogecoin.svg';
  final String house = 'assets/icons/house_fill.svg';
  final String person = 'assets/icons/person.svg';

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

  static const List<Widget> _options = <Widget>[
    HomePage(),
    
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _options.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bg,
        
        
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                "assets/icons/house_fill.svg",
              ),
            ),
            label: 'خانه',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                "assets/icons/arrow_left.svg",
              ),
            ),
            label: 'خرید و فروش',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                "assets/icons/dogecoin.svg",color: unselectinput,
              ),
            ),
            label: 'ارز ها',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                "assets/icons/person.svg",
              ),
            ),
            label: 'پروفایل',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: mainColor,
        unselectedItemColor: Colors.grey,
        iconSize: 40,
        onTap: _onItemTap,
      ),
    );
  }
}

import 'dart:async';
import 'package:ewal/pages/auth.dart';
import 'package:ewal/pages/otp.dart';
import 'package:ewal/pages/profile.dart';
import 'package:ewal/colors.dart';
import 'package:ewal/pages/buyandsell.dart';
import 'package:ewal/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:persian/persian.dart';
import 'package:provider/provider.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:line_icons/line_icons.dart';
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
      home: Otp(phone: '09307491461',),
    );
  }
}

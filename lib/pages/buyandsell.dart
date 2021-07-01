import 'dart:async';
import 'package:ewal/colors.dart';
import 'package:ewal/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:persian/persian.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:shamsi_date/extensions.dart';

class BuyAndSell extends StatelessWidget {
  const BuyAndSell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: [
        const Locale('fa', 'IR'),
      ],
      home: BuyAndSellBody(),
    );
  }
}

class BuyAndSellBody extends StatefulWidget {
   BuyAndSellBody({Key? key}) : super(key: key);

  @override
  _BuyAndSellBodyState createState() => _BuyAndSellBodyState();
}

class _BuyAndSellBodyState extends State<BuyAndSellBody> {
 
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: bg,
      body: Column(
        children: [],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../colors.dart';

class Profile extends StatelessWidget {
  final String name = 'حسام میراحمدیان';
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundColor: mainColor,
              child: Icon(
                Icons.person,
                size: 80.0,
                color: bg,
              ),
            ),
            SizedBox(height: 20.0,),
            Text(
              name,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5.0,),
            Text(
              '09307491461',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: mainColor,
              ),
              child: InkWell(
                onTap: () {},
                child: Align(
                  child: Text(
                    'خروج از حساب',
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
    );
  }
}

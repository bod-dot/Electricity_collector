

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled7/Pages/LoaginPage.dart';


const KColorPrimer = Color(0xff1565C0);
const KColorSecond = Color(0xff1976D2);
const KColorThreed = Color(0xff42A5F5);
const KColorFoured = Color(0xffBBDEFB);

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'نظام إدارة العملاء',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: KColorPrimer,
        textTheme: GoogleFonts.cairoTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: Colors.grey[800],
          displayColor: KColorPrimer,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: KColorPrimer,
          elevation: 8,
          shadowColor: KColorPrimer.withOpacity(0.5),
        ),
      ),
      home: LoginScreen(),
     
    );
  }
}
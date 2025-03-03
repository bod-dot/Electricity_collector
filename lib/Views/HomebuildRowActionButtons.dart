import 'package:flutter/material.dart';
import 'package:untitled7/Pages/ReportsScreen.dart';
import 'package:untitled7/Pages/TakeReadingScreen.dart';
import 'package:untitled7/Widgets/MainMenuItemButton.dart';

class Homebuildrowactionbuttons extends StatelessWidget {
  const Homebuildrowactionbuttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Mainmenuitembutton(icon: Icons.analytics, label: "التقارير", onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:
              (context) =>const  ReportsScreen()));}),
        ),
       const  SizedBox(width: 20),
        Expanded(
          child: Mainmenuitembutton(icon: Icons.assignment_add, label:  'أخذ قراءات', onTap: (){

            Navigator.push(context, MaterialPageRoute(builder:  (context) =>const  TakeReadingScreen()));
          }),
        ),
      ],
    );
  }
}
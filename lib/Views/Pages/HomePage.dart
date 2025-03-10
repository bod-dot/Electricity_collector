import 'package:flutter/material.dart';
import 'package:untitled7/Views/Pages/Drawer.dart';

import 'package:untitled7/Views/Pages/chagePassword.dart';
import 'package:untitled7/Widgets/HomebuildBackgroundEffects.dart';
import 'package:untitled7/Widgets/HomebuildMainContent.dart';
import 'package:untitled7/Widgets/CustomAppBar.dart';

import 'LoaginPage.dart';






class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static String Id="HomePage";
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _handleDrawerItemSelected(int index) {
    Navigator.pop(context); 

    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePasswordScreen()));
        break;
      case 1:
        // تنفيذ أكشن عن التطبيق
        break;
      case 2:
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const  LoginScreen()));
        break;
    }
  }

  final List<Map<String, dynamic>> dataItems = [
    {
      'name': 'عميل 1',
      'subscriber': '1001',
      'date': '2025-03-01',
      'amount': '500',
      'progress': 0.8
    },
    {
      'name': 'عميل 2',
      'subscriber': '1002',
      'date': '2025-03-05',
      'amount': '750',
      'progress': 0.6
    },
    {
      'name': 'عميل 3',
      'subscriber': '1003',
      'date': '2025-03-10',
      'amount': '300',
      'progress': 0.4
    },
    {
      'name': 'عميل 4',
      'subscriber': '1004',
      'date': '2025-03-15',
      'amount': '450',
      'progress': 0.9
    },
    {
      'name': 'عميل 5',
      'subscriber': '1005',
      'date': '2025-03-20',
      'amount': '600',
      'progress': 0.7
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: CustomDrawer(onItemSelected: _handleDrawerItemSelected,),
        appBar: CustomAppBar(title: "الرئيسية"),
        body: Stack(
          children: [
          const  Homebuildbackgroundeffects(),
            Homebuildmaincontent(dataItems: dataItems),
          ],
        ),
      ),
    );
  }


  

  


 
  
  

}


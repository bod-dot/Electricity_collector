import 'package:flutter/material.dart';
import 'package:untitled7/Views/HomebuildAnimatedClientCards.dart';
import 'package:untitled7/Views/HomebuildRowActionButtons.dart';
import 'package:untitled7/Widgets/CustomTitleInHomePage.dart';
import 'package:untitled7/helper/constans.dart';

class Homebuildmaincontent extends StatelessWidget {
   const Homebuildmaincontent({super.key,required this.dataItems});
    final  List<Map<String,dynamic>> dataItems;

    
      
  @override
  Widget build(BuildContext context) {
      double averageProgress = dataItems.fold(
            0.0, (sum, item) => sum + (item['progress'] as double)) /
        dataItems.length;
    return SingleChildScrollView(
      
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const Homebuildrowactionbuttons(),
           const SizedBox(height: 20),
            // شريط التقدم الذي يعبر عن معدل التقدم
            LinearProgressIndicator(
              value: averageProgress,
              backgroundColor: KColorFoured,
              valueColor :const  AlwaysStoppedAnimation<Color>(KColorPrimer),
              minHeight: 8,
            ),
           const  SizedBox(height: 20),
         const   Customtitleinhomepage(title: 'بيانات العملاء'),
           const  SizedBox(height: 20),
            Homebuildanimatedclientcards(dataItems: dataItems),
          ],
        ),
      ),
    );
  }
}
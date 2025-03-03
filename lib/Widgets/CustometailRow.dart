 import 'package:flutter/material.dart';
import 'package:untitled7/helper/constans.dart';

  List<Widget> buildClientDetails(Map<String, dynamic> item) {
    return [
      CustomDailRow('رقم المشترك:', item['subscriber']),
      CustomDailRow('تاريخ التسديد:', item['date']),
      CustomDailRow('قرءة العداد:', '${item['amount']} ر.س'),
    ];
  }

Widget CustomDailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 18,
            ),
          ),
          Text(
            value,
            style:const TextStyle(
              color: KColorPrimer,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }


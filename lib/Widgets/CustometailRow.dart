 import 'package:flutter/material.dart';
import 'package:untitled7/helper/constans.dart';
import 'package:untitled7/models/customer.dart';

  List<Widget> buildClientDetails(Customer item) {
    return [
      customDailRow('رقم المشترك:', "${item.customerID}"),
      customDailRow('تاريخ التسديد:', item.customerMovementDate !=null ?'${item.customerMovementDate!.year}-${item.customerMovementDate!.month}-${item.customerMovementDate!.day}':'--'),
      customDailRow('المتاخرة', '${item.customerTotalDues} ر.س'),
    ];
  }

Widget customDailRow(String title, String value) {
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
              color: kColorPrimer,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }


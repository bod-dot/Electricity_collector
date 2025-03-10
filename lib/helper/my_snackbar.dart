

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class Mysnackbar
{
  void showSnackbarError ({required String title,required BuildContext context ,required String Message ,required ContentType contentType})
{
  final snackBar = SnackBar(

    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message:
     Message,


      contentType: contentType,
    ),
  );
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

  
}
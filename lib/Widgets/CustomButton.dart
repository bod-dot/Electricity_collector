import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../helper/constans.dart';

class Custombutton extends StatelessWidget {
  const  Custombutton({super.key,required this.isLoading , required this.onPressed,required this.lable,this.color});
  final bool isLoading ;
 final VoidCallback onPressed;
  final String lable;
 final Color ?color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:  color??kColorPrimer,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                lable,
                style: GoogleFonts.cairo(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
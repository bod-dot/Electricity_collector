import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled7/helper/constans.dart';

class Cusotmtextformintacknewreanding extends StatelessWidget {
   Cusotmtextformintacknewreanding({super.key, required  this.label, required this.icon,  this.textInputType,this.validator,this.isEnable=true});
 final String label;
    final IconData icon;
    TextInputType ?textInputType;
    String? Function(String?)? validator;
    bool isEnable;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 1,
      duration: const Duration(milliseconds: 500),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: TextFormField(
            enabled:isEnable ,
            style: GoogleFonts.cairo(color: Colors.white),
            keyboardType: textInputType,
            validator: validator,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: GoogleFonts.cairo(color: KColorThreed),
              prefixIcon: Icon(icon, color: Colors.amber),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: isEnable?Colors.white.withOpacity(0.1):Colors.grey.withOpacity(0.1),
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            ),
          ),
        ),
      ),
    );;
  }
}
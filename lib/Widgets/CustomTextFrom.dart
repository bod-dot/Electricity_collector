import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled7/main.dart';

class Customtextfrom extends StatelessWidget {
   Customtextfrom({super.key,  this.obscureText=false ,required this.label, this.onPressed,required this.icon,this.isPassword=false});
 bool obscureText ;
final String label;
bool ? isPassword;
final Icon icon;
 VoidCallback ?onPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.cairo(
          color: KColorPrimer,
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: icon,
        suffixIcon: isPassword!?IconButton(
          icon: Icon(
            obscureText? Icons.visibility_off : Icons.visibility,
            color: KColorPrimer,
          ),
          onPressed: onPressed,
        ): null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:const BorderSide(color: KColorPrimer, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        filled: true,
        fillColor: Colors.grey[50],
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      ),
      style: GoogleFonts.cairo(
        color: KColorPrimer,
        fontWeight: FontWeight.w600,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'هذا الحقل مطلوب';
        if (value.length < 8) return 'يجب أن تكون كلمة المرور 8 أحرف على الأقل';
        return null;
      },
    );;
  }
}
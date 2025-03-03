import 'package:flutter/material.dart';
import 'package:untitled7/Pages/HomePage.dart';
import 'package:untitled7/Widgets/CusotmTextFormInTackNewReanding.dart';
import 'package:untitled7/Widgets/CustomButton.dart';
import 'package:untitled7/Widgets/CustomTextFrom.dart';
import 'package:untitled7/main.dart';

class buildLoginFormLogin extends StatefulWidget {
   buildLoginFormLogin({super.key});

  @override
  State<buildLoginFormLogin> createState() => _buildLoginFormLoginState();
}

class _buildLoginFormLoginState extends State<buildLoginFormLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Form(
       // key: _formKey,
        child: Column(
          children: [

        
            Customtextfrom(label: "رقم المنطقة", icon:const Icon(Icons.location_on_outlined, color: KColorPrimer),isPassword: true,onPressed: (){setState(() {
              check=!check;
            });},obscureText: check,),
            const SizedBox(height: 20),
           Customtextfrom(label: "رقم المنطقة", icon:const Icon(Icons.location_on_outlined, color: KColorPrimer),obscureText: true,),
            const SizedBox(height: 20),
           Customtextfrom(label: "رقم المنطقة", icon:const Icon(Icons.location_on_outlined, color: KColorPrimer),),
            const SizedBox(height: 30),
           Custombutton(isLoading: false, lable: 'تسجيل الدخول',onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));})
          ],
        ),
      ),
    );
  }

  bool check=true;
}
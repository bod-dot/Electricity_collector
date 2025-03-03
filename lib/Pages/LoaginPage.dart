import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:untitled7/Pages/HomePage.dart';
import 'package:untitled7/Views/buildHeaderLogin.dart';
import 'package:untitled7/Views/buildLoginFormLogin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  // متغيرات لتخزين القيم


  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 2)); // محاكاة عملية تسجيل دخول
      setState(() => _isLoading = false);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
             colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
          )
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 500),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    const Buildheader(),
                    const SizedBox(height: 40),
                   buildLoginFormLogin(),
                  ],
                 
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


}
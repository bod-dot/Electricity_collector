import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled7/Widgets/CusotmTextFormInTackNewReanding.dart';
import 'package:untitled7/Widgets/CustomButton.dart';
import 'package:untitled7/main.dart';



class TakeReadingScreen extends StatefulWidget {
  const TakeReadingScreen({super.key});

  @override
  State<TakeReadingScreen> createState() => _TakeReadingScreenState();
}

class _TakeReadingScreenState extends State<TakeReadingScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isSending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
      title: Text(
        'أخذ قراءة جديدة ⚡',
        style: GoogleFonts.cairo(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
    ),
      backgroundColor: KColorPrimer, // تغيير هنا
      body: AnimationLimiter(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: AnimationConfiguration.staggeredList(
                position: 0,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: Column(
                      children: [
                        
                        const SizedBox(height: 40),
                      Lottie.asset(
                            'assets/animations/electric.json',
                           width: 150,
                         repeat: true,
                                ),
                        const SizedBox(height: 30),
                        Cusotmtextformintacknewreanding(
                          label: 'رقم العداد',
                          icon: Icons.flash_on_outlined,
                          validator: (v) => v!.isEmpty ? 'أدخل رقم العداد' : null,
                        ),
                        const SizedBox(height: 25),
                        Cusotmtextformintacknewreanding(
                          label: 'اسم العميل',
                          icon: Icons.person_outline,
                          validator: (v) => v!.isEmpty ? 'أدخل اسم العميل' : null,
                        ),
                        const SizedBox(height: 25),
                        Cusotmtextformintacknewreanding(
                          label: 'القراءة الحالية',
                          icon: Icons.speed_outlined,
                          textInputType: TextInputType.number,
                          validator: (v) => v!.isEmpty ? 'أدخل القراءة' : null,
                        ),
                        const SizedBox(height: 40),
                        Custombutton(isLoading: _isSending, onPressed: (){
                          if (_formKey.currentState!.validate()) {
                            setState(() => _isSending = true);
                            Future.delayed(const Duration(seconds: 2), () {
                              setState(() => _isSending = false);
                            });
                          }
                        }, lable: "ارسال القراءة",color: KColorSecond,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


 

}
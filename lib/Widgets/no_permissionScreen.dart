import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled7/Widgets/CustomButton.dart';
import 'package:untitled7/cubit/home_cubit/home_cubit.dart';

class NoPermissionScreen extends StatelessWidget {
  final VoidCallback onRetry;

  const NoPermissionScreen({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // رسوم متحركة لإضافة لمسة عصرية
              Lottie.asset(
                'assets/animations/NotAllow.json', // تأكد من تحميل ملف Lottie في مجلد assets
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),

              // رسالة الخطأ
            const  Text(
                "ليس لديك صلاحيات لتحصيل",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              // وصف إضافي
             const Text(
                "يرجى التأكد من أن لديك الصلاحيات اللازمة لتحصل هذا اليوم.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // زر المحاولة مرة أخرى
  Custombutton(isLoading: false, onPressed: (){
    BlocProvider.of<HomeCubit>(context).getDataAndCheckPermission();
  }, lable: "المحاولة مرة اخرئ")
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled7/Widgets/CustomButton.dart';
import 'package:untitled7/Widgets/CustomTextFrom.dart';
import 'package:untitled7/cubit/chage_passwrod/chage_password_cubit.dart';
import 'package:untitled7/helper/constans.dart';
import 'package:untitled7/helper/my_snackbar.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool _obscureNewPassword = true;
  bool _obscureOldPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: BlocProvider(
            create: (context) => ChagePasswordCubit(),
            child: Scaffold(
              body: Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [kColorPrimer, kColorThreed],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      _buildAnimatedHeader(),
                      const SizedBox(height: 40),
                      _buildPasswordFormCard(),
                    ],
                  ),
                ),
              ),
            )));
  }

  Widget _buildAnimatedHeader() {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Icon(
            Icons.security_rounded,
            size: 80,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
        const SizedBox(height: 20),
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [Colors.white, Colors.blue.shade100],
          ).createShader(bounds),
          child: Text(
            'تغيير كلمة المرور',
            style: GoogleFonts.cairo(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'قم بتحديث كلمة المرور لحماية حسابك',
          style: GoogleFonts.cairo(
            fontSize: 16,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordFormCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 25,
            spreadRadius: 5,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: BlocConsumer<ChagePasswordCubit, ChagePasswordState>(
        listener: (context, state) {
          if(state is ChagePasswordConfirmPassword)
          {
            Mysnackbar().showSnackbarError(title: "خظاء", context: context, Message: 'كلمة السر غير متطابقة', contentType: ContentType.failure);
          }
          else if(state is ChagePasswordFauiler)
          {
            Mysnackbar().showSnackbarError(title: "خظاء", context: context, Message: state.err, contentType: ContentType.failure);
          }
          else if(state is ChagePasswordSuccess)
          {
            Mysnackbar().showSnackbarError(title: "تم بنجاح", context: context, Message:'تم تغيير كلمة السر بنجاح', contentType: ContentType.success);
          }else if(state is ChagePasswordwrongPasswrod)
          {
            Mysnackbar().showSnackbarError(title: "خظاء", context: context, Message: 'كلمة السر غير صحيحة', contentType: ContentType.failure);
          }
          
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                Customtextfrom(
                  obscureText: _obscureOldPassword,
                  onPressed: () {
                    _obscureOldPassword = !_obscureOldPassword;
                    setState(() {});
                  },
                  label: "كلمة المرور القديمة",
                  icon: const Icon(Icons.lock_outline),
                  textEditingController: oldPassword,
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                Customtextfrom(
                  obscureText: _obscureNewPassword,
                  onPressed: () {
                    _obscureNewPassword = !_obscureNewPassword;
                    setState(() {});
                  },
                  label: "كلمة المرور الجديدة",
                  icon: const Icon(Icons.lock_outline),
                  textEditingController: newPassword,
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                Customtextfrom(
                  obscureText: _obscureConfirmPassword,
                  onPressed: () {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                    setState(() {});
                  },
                  label: "تاكيد كلمة السر",
                  icon: const Icon(Icons.lock_outline),
                  textEditingController: confirmPassword,
                  isPassword: true,
                ),
                const SizedBox(height: 30),
                Custombutton(
                  
                    isLoading: state is ChagePasswordLoading ?true:false,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<ChagePasswordCubit>(context)
                            .changePaaswordCubit(
                                oldPassword: oldPassword.text,
                                newPasswrod: newPassword.text,
                                confirmPassword: confirmPassword.text);
                      }
                      oldPassword.clear();
                      newPassword.clear();
                      confirmPassword.clear();
                    },
                    lable: 'تحديث كلمة المرور'),
              ],
            ),
          );
        },
      ),
    );
  }
}

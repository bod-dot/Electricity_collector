import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:untitled7/Views/Pages/HomePage.dart';

import 'package:untitled7/Widgets/buildHeaderLogin.dart';
import 'package:untitled7/Widgets/buildLoginFormLogin.dart';
import 'package:untitled7/cubit/login_cubit/login_cubit.dart';
import 'package:untitled7/helper/my_snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String Id = 'LognPage';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => LoginCubitCubit(),
        child: BlocConsumer<LoginCubitCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushReplacementNamed(context, MainScreen.Id);
            } else if (state is LoginFauild) {
              Mysnackbar().showSnackbarError(
                  title: "error",
                  context: context,
                  Message: state.error,
                  contentType: ContentType.failure);
            } else if (state is LoginWrongPasswrodOrEmail) {
              Mysnackbar().showSnackbarError(
                  title: "خطاء ",
                  context: context,
                  Message: "رقم المطقة او رقم الهاتف او كلمة السر خطاء ",
                  contentType: ContentType.failure);
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
                )),
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
                          const BuildLoginFormLogin(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

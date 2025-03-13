import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled7/Widgets/CustomButton.dart';
import 'package:untitled7/Widgets/CustomTextFrom.dart';
import 'package:untitled7/cubit/login_cubit/login_cubit.dart';


import '../helper/constans.dart';

class BuildLoginFormLogin extends StatefulWidget {
  const BuildLoginFormLogin({super.key});

  @override
  State<BuildLoginFormLogin> createState() => _BuildLoginFormLoginState();
}

class _BuildLoginFormLoginState extends State<BuildLoginFormLogin> {
  TextEditingController area = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController passwrod = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool check = true;
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
        key: formKey,
        child: Column(
          children: [
            Customtextfrom(
              label: "رقم المنطقة",
              icon: const Icon(
                Icons.location_on_outlined,
                color: kColorPrimer,
              ),
              textInputType: TextInputType.number,
              textEditingController: area,
            ),
            const SizedBox(height: 20),
            Customtextfrom(
              label: "رقم الهاتف",
              icon: const Icon(Icons.phone_android, color: kColorPrimer),
              textEditingController: phoneNumber,
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Customtextfrom(
              isPassword: true,
              obscureText: check,
              onPressed: () {
                setState(() {
                  check = !check;
                });
              },
              label: "كلمة السر",
              icon: const Icon(
                Icons.lock_open_outlined,
                color: kColorPrimer,
              ),
              textEditingController: passwrod,
            ),
            const SizedBox(height: 30),
            BlocBuilder<LoginCubitCubit,LoginState>(
              builder: (context, state) {
                return Custombutton(
                    isLoading: state is LoginLoding ,
                    lable: 'تسجيل الدخول',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<LoginCubitCubit>(context).loginCub(
                            areaId: int.parse(area.text),
                            phoneNumber: int.parse(phoneNumber.text),
                            passwrod: passwrod.text);
                      }
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}

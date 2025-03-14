import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled7/Views/Pages/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled7/Views/Pages/TakeReadingScreen.dart';
import 'package:untitled7/cubit/home_cubit/home_cubit.dart';
import 'Views/Pages/LoaginPage.dart';
import 'helper/constans.dart';

String? employeeID;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences shared = await SharedPreferences.getInstance();
  employeeID = shared.getString("EmployeeID");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: MaterialApp(
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          MainScreen.id: (context) => const MainScreen(),
          TakeReadingScreen.id:(context)=>const TakeReadingScreen()
        },
        title: 'نظام إدارة العملاء',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: kColorPrimer,
          textTheme: GoogleFonts.cairoTextTheme(
            Theme.of(context).textTheme,
          ).apply(
            bodyColor: Colors.grey[800],
            displayColor: kColorPrimer,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: kColorPrimer,
            elevation: 8,
            shadowColor: kColorPrimer.withOpacity(0.5),
          ),
        ),
        home: employeeID == null ? const LoginScreen() : const MainScreen(),
      ),
    );
  }
}

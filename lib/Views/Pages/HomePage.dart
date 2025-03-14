import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled7/Views/Pages/Drawer.dart';

import 'package:untitled7/Views/Pages/chagePassword.dart';
import 'package:untitled7/Widgets/HomebuildBackgroundEffects.dart';
import 'package:untitled7/Widgets/HomebuildMainContent.dart';
import 'package:untitled7/Widgets/CustomAppBar.dart';
import 'package:untitled7/Widgets/no_permissionScreen.dart';
import 'package:untitled7/cubit/home_cubit/home_cubit.dart';

import 'LoaginPage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static String id = "HomePage";
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _handleDrawerItemSelected(int index) async {
    Navigator.pop(context);

    switch (index) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ChangePasswordScreen()));
        break;
      case 1:
        break;
      case 2:
        SharedPreferences shared = await SharedPreferences.getInstance();
        shared.remove('EmployeeID');
        shared.remove('EmployeeName');
        if (!mounted) return;
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
        break;
    }
  }

 

  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getDataAndCheckPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocBuilder<HomeCubit, HomeState>(
       
        builder: (context, state) {
          return Scaffold(
            drawer: CustomDrawer(
              onItemSelected: _handleDrawerItemSelected,
            ),
            appBar: CustomAppBar(title: "الرئيسية"),
            body: Stack(
              children: [
                const Homebuildbackgroundeffects(),
                if(state is HomeLoading)
                const  Center(
                child: CircularProgressIndicator(),
                )
                else if(state is HomeSuccess)
                Homebuildmaincontent(customers: BlocProvider.of<HomeCubit>(context).customers,)
                
                else if(state is HomeNotAllow)
                NoPermissionScreen(onRetry:  () {},)
                else if(state is HomeFauler)
                Center(child: Text(state.err),)
               
                
              ],
            ),
          );
        },
      ),
    );
  }
}

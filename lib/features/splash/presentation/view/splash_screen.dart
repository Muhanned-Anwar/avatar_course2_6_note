import 'package:avatar_course2_6_note/core/resources/manager_colors.dart';
import 'package:avatar_course2_6_note/core/resources/manager_font_sizes.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: Constants.splashTime,
      ),
      () => Navigator.pushReplacementNamed(
        context,
        Routes.homeView,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          ManagerColors.primaryColor,
          ManagerColors.secondaryColor,
        ])),
        child: Text(
          ManagerStrings.appName,
          style: TextStyle(
            fontSize: ManagerFontSizes.s26,
            color: ManagerColors.white,
          ),
        ),
      ),
    );
  }
}

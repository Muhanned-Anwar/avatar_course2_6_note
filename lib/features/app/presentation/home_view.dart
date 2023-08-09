import 'package:avatar_course2_6_note/core/resources/manager_colors.dart';
import 'package:avatar_course2_6_note/core/resources/manager_font_sizes.dart';
import 'package:avatar_course2_6_note/core/resources/manager_height.dart';
import 'package:avatar_course2_6_note/core/resources/manager_raduis.dart';
import 'package:avatar_course2_6_note/core/resources/manager_strings.dart';
import 'package:avatar_course2_6_note/core/resources/manager_width.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> names = [
      'ahmed',
      'mohammed',
      'malak',
      'zead' 'ahmed',
      'mohammed',
      'malak',
      'zead' 'ahmed',
      'mohammed',
      'malak',
      'zead' 'ahmed',
      'mohammed',
      'malak',
      'zead' 'ahmed',
      'mohammed',
      'malak',
      'zead' 'ahmed',
      'mohammed',
      'malak',
      'zead' 'ahmed',
      'mohammed',
      'malak',
      'zead' 'ahmed',
      'mohammed',
      'malak',
      'zead'
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ManagerColors.transparent,
        elevation: 0,
        title: Text(
          ManagerStrings.appName,
          style: TextStyle(
            fontSize: ManagerFontSizes.s20,
            color: ManagerColors.white,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: ManagerHeight.h14,
          horizontal: ManagerWidth.w14,
        ),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ManagerColors.primaryColor,
              ManagerColors.secondaryColor,
            ],
          ),
        ),
        child: ListView(
          children: [
            for (int i = 0; i < names.length; i++)
              Card(
                color: ManagerColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    ManagerRadius.r12,
                  ),
                ),
                child: Container(
                  height: 50,
                  child: Text('data ${names[i]}'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:avatar_course2_6_note/features/app/presentation/home_view.dart';
import 'package:flutter/material.dart';
import 'config/dependancy_injection.dart';
import 'core/routes.dart';
import 'features/splash/presentation/view/splash_screen.dart';

void main() async {
  initModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashScreen,
      routes: {
        Routes.splashScreen: (context) => const SplashScreen(),
        Routes.homeView: (context) => const HomeView(),
      },
    );
  }
}

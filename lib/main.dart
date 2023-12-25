import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocal_extraction_app/presentation/widget/onboarding_page.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

int? initScreen;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var pref = await SharedPreferences.getInstance();
  initScreen = pref.getInt("initScreen");

  await pref.setInt("initScreen", 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.backgroundColor,
      ),
      // initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
      //   routes: {
      //     '/': (context) => const SpalshScreen(),
      //     "first": (context) => const LanguageScreen(),
      //   },
      home: WelcomePage(),
    );
  }
}

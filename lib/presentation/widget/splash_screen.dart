import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocal_extraction_app/presentation/widget/bottom_nav_bar.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const BottomNavScreen()),
          (route) => false);
    });
  }

  sendToken() async {
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    String? token = await firebaseMessaging.getToken();
    // print('fffffffcccmm');
    // print(token);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tokenAuth = prefs.getString('token');
    await prefs.setString('tokenFcm', token!);
    if (tokenAuth != null) {
      String? tokenFcm = prefs.getString('tokenFcm');
      if (token != tokenFcm) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Center(
          child: Text(
            'Music Extractor',
            style: TextStyle(
                color: AppColors.primary,
                fontSize: 32,
                fontFamily: 'ClashDisplay',
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

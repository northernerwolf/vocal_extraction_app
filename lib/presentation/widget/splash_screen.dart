import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
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

import 'package:flutter/material.dart';
import 'package:vocal_extraction_app/presentation/pages/initial/initial.dart';
import 'package:vocal_extraction_app/presentation/pages/library/library.dart';
import 'package:vocal_extraction_app/presentation/pages/settings/settings.dart';
import 'package:vocal_extraction_app/presentation/widget/bottom_navbar_button.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;

  @override
  void dispose() {
    super.dispose();
  }

  List<Widget> page = [
    const InitialPage(),
    const MyLibraryPage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        color: AppColors.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            children: [
              Expanded(
                  child: BottomNavbarButton(
                      icon: false,
                      index: 0,
                      selectedIndex: selectedIndex,
                      onTapp: () {
                        onTapp(0);
                      })),
              Expanded(
                  child: BottomNavbarButton(
                      icon: false,
                      index: 1,
                      selectedIndex: selectedIndex,
                      onTapp: () {
                        onTapp(1);
                      })),
              Expanded(
                  child: BottomNavbarButton(
                      icon: false,
                      index: 2,
                      selectedIndex: selectedIndex,
                      onTapp: () {
                        onTapp(2);
                      })),
            ],
          ),
        ),
      ),
      body: page[selectedIndex],
    );
  }

  void onTapp(int index) async {
    setState(() {
      selectedIndex = index;
    });
  }
}

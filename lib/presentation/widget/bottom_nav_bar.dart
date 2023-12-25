import 'package:flutter/material.dart';
import 'package:vocal_extraction_app/presentation/pages/initial/initial.dart';
import 'package:vocal_extraction_app/presentation/pages/library/library.dart';
import 'package:vocal_extraction_app/presentation/pages/settings/settings.dart';
import 'package:vocal_extraction_app/presentation/widget/bottom_navbar_button.dart';

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

  List page = [
    const InitialPage(),
    // const ExploreScreen(),
    const MyLibraryPage(),
    const SettingsPage()
    // const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 68,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
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
            // Expanded(
            //     child: BottomNavbarButton(
            //         icon: false,
            //         index: 1,
            //         selectedIndex: selectedIndex,
            //         onTapp: () {
            //           onTapp(1);
            //         })),
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
      body: IndexedStack(
        children: [
          Center(
            child: page[selectedIndex],
          ),
        ],
      ),
    );
  }

  void onTapp(int index) async {
    setState(() {
      selectedIndex = index;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vocal_extraction_app/presentation/pages/settings/components/settings_cart.dart';
import 'package:vocal_extraction_app/presentation/pages/settings/components/upgrade_plan_cart.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<String> icons = [
    'assets/icons/information-circle.svg',
    'assets/icons/question.svg',
    'assets/icons/feedback.svg',
    'assets/icons/privacy.svg'
  ];
  List<String> title = [
    'About us',
    'Term of use',
    'Feedback',
    'Privacy & Policy'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: AppBar(
          backgroundColor: AppColors.backgroundColor,
          automaticallyImplyLeading: false,
          leadingWidth: double.infinity,
          leading: const Padding(
            padding: EdgeInsets.only(left: 20, right: 5, bottom: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Settings',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    fontFamily: 'ClashDisplay',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.cartColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rate us!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              fontFamily: 'ClashDisplay',
                            ),
                          ),
                          Text(
                            'Click now to use it unlimitedly.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.subtitleColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.white, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 14, right: 14, bottom: 8, top: 8),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/star.svg'),
                              const Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  'Rate',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    fontFamily: 'ClashDisplay',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  'General',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    fontFamily: 'ClashDisplay',
                  ),
                ),
              ),
              ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return SettingsCart(
                        icons: icons[index], title: title[index]);
                  }),
              const UpgradePlan()
            ],
          ),
        ),
      )),
    );
  }
}

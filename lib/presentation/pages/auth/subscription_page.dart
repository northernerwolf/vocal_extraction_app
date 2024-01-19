// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocal_extraction_app/presentation/pages/auth/components/chek_cart.dart';

import 'package:vocal_extraction_app/presentation/pages/auth/components/subscription_cart.dart';
import 'package:vocal_extraction_app/presentation/widget/bottom_nav_bar.dart';
import 'package:vocal_extraction_app/utils/custom/custom_button.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  int selectedCheckboxIndex = -1;
  List<String> icon = [
    'assets/icons/tabler-icon-brain.svg',
    'assets/icons/tabler-icon-infinity.svg',
    'assets/icons/tabler-icon-ad-2.svg'
  ];
  List<String> title = ['GPT-4', 'Unlimited', 'AD-free'];
  // ignore: non_constant_identifier_names
  List<String> sub_title = [
    'The most advanced GPT 4 model',
    'Unlimited use',
    'Ad-free use'
  ];

  List<String> date = ['Unlimited', 'Monthly', 'Weekly'];
  List<String> cost = ['\$79.99', '\$9.99 monthly', '\$4.99 weekly'];

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  void fetchData() async {
    await FirebaseAuth.instance.signInAnonymously();
    var user = await FirebaseAuth.instance.currentUser;
    setDataToFirestore('dd', 'u', user!.uid.toString());
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    String? token = await firebaseMessaging.getToken();
    print(token);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tokenAuth = prefs.getString('tokenFcm');

    if (tokenAuth == null) {
      await prefs.setString('tokenFcm', token!);
      setDataToFirestore('dd', 'u', user!.uid.toString());
    } else {
      if (tokenAuth != token) {
        await prefs.setString('tokenFcm', token!);
        setDataToFirestoreUpdate('ee', 'eee', user!.uid.toString());
      }
    }
  }

  void setDataToFirestore(String audioUrl, String fcmToken, String uid) async {
    try {
      await FirebaseFirestore.instance.collection('Users').doc(uid).set({
        'audio': audioUrl,
        'fcm': fcmToken,
        'uid': uid,
      });
      print('Data set successfully!');
      print(uid);
    } catch (e) {
      print('Error setting data: $e');
    }
  }

  void setDataToFirestoreUpdate(
      String audioUrl, String fcmToken, String uid) async {
    try {
      await FirebaseFirestore.instance.collection('Users').doc(uid).update({
        'audio': audioUrl,
        'fcm': fcmToken,
        'uid': uid,
      });
      print('Data set successfully!');
    } catch (e) {
      print('Error setting data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Subscription',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      fontFamily: 'ClashDisplay',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const BottomNavScreen()));
                    },
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: const BoxDecoration(
                          color: AppColors.cartColor, shape: BoxShape.circle),
                      child: const Center(
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, index) {
                      return SubscriptionCart(
                          icon: icon[index],
                          title: title[index],
                          subTitle: sub_title[index]);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                  width: size,
                  // height: 356,
                  decoration: BoxDecoration(
                      color: AppColors.cartColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            ListView.builder(
                                itemCount: 4,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, index) {
                                  return index != 3
                                      ? ChekCart(
                                          date: date[index],
                                          cost: cost[index],
                                          index: index,
                                          isSelected:
                                              selectedCheckboxIndex == index,
                                          onSelected: () {
                                            setState(() {
                                              selectedCheckboxIndex = index;
                                            });
                                          },
                                        )
                                      : InkWell(
                                          onTap: () {},
                                          child: const Padding(
                                            padding: EdgeInsets.only(top: 4),
                                            child: CustomButton(
                                                title: 'Subscribe'),
                                          ));
                                }),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: size / 12, top: size / 50 - 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 28,
                              width: 90,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color.fromRGBO(50, 197, 244, 1),
                                        Color.fromRGBO(0, 236, 222, 1),
                                      ]),
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(
                                child: Text(
                                  '%50 Sale',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    fontFamily: 'ClashDisplay',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    '*Subscriptions renew automatically.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.subtitleColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

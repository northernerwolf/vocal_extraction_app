import 'package:flutter/material.dart';

import 'package:vocal_extraction_app/presentation/pages/auth/components/subscription_cart.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
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
                  Container(
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
                          sub_title: sub_title[index]);
                    }),
              ),
              Container(
                width: size,
                height: 352,
                decoration: BoxDecoration(
                    color: AppColors.cartColor,
                    borderRadius: BorderRadius.circular(16)),
              )
            ],
          ),
        ),
      )),
    );
  }
}

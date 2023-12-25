import 'package:flutter/material.dart';

import 'package:vocal_extraction_app/presentation/pages/auth/subscription_page.dart';
import 'package:vocal_extraction_app/presentation/widget/onboarding_item.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
        ),
        child: PageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Items.WelcomeData[index]['id'] == '0'
                    ? Padding(
                        padding:
                            const EdgeInsets.only(top: 90, left: 30, right: 30),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            Items.WelcomeData[0]['image']!,
                            height: MediaQuery.of(context).size.height / 3 - 20,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : const Spacer(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 30, right: 30, bottom: 40),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: SafeArea(
                        child: Column(children: [
                          RichText(
                            text: TextSpan(
                              text: Items.WelcomeData[index]['title']!,
                              style: TextStyle(
                                  color: Items.WelcomeData[index]['id'] == '0'
                                      ? Colors.white
                                      : AppColors.primary,
                                  fontSize: 30,
                                  fontFamily: 'ClashDisplay',
                                  fontWeight: FontWeight.w600),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        " ${Items.WelcomeData[index]['sub_title']!}",
                                    style: TextStyle(
                                        color: Items.WelcomeData[index]['id'] ==
                                                '0'
                                            ? AppColors.primary
                                            : Colors.white,
                                        fontSize: 30,
                                        fontFamily: 'ClashDisplay',
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 11,
                          ),
                          Text(
                            Items.WelcomeData[index]['text']!,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: AppColors.oneBoardColor,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Items.WelcomeData[index]['id'] == '0'
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (index < 1) {
                                          _pageController.animateToPage(
                                              index + 1,
                                              duration: const Duration(
                                                  microseconds: 500),
                                              curve: Curves.ease);
                                        } else {
                                          Navigator.of(context).pushAndRemoveUntil(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SubscriptionPage()),
                                              (route) => false);
                                        }
                                      },
                                      child: const Row(
                                        children: [
                                          Text(
                                            'next',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                              fontFamily: 'ClashDisplay',
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Icon(
                                                Icons.east,
                                                color: Colors.white,
                                                size: 24,
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              : InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SubscriptionPage()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, right: 20, left: 20),
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.borderColor),
                                          color: AppColors.authRegisterColor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: const Center(
                                        child: Text(
                                          'Get started!',
                                          style: TextStyle(
                                              color: AppColors.primary,
                                              fontSize: 16,
                                              fontFamily: 'ClashDisplay',
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                        ]),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
          itemCount: 2,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

class SubscriptionCart extends StatelessWidget {
  final String icon;
  final String title;
  final String subTitle;
  const SubscriptionCart(
      {required this.icon,
      required this.title,
      required this.subTitle,
      super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    double size2 = MediaQuery.of(context).size.width / 9;
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Container(
        height: 80,
        width: size,
        decoration: BoxDecoration(
            // boxShadow:
            // BoxShadow(
            //   color: Colors.blueGrey.withOpacity(0.1),
            //   spreadRadius: 3,
            //   blurRadius: 8,
            //   offset: const Offset(0, 3),
            // ),
            color: AppColors.cartColor,
            borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                height: 24.0,
                width: 24.0,
                color: AppColors.primary,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: 'ClashDisplay',
                      ),
                    ),
                    Text(
                      subTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.subtitleColor,
                        fontWeight: FontWeight.w400,
                        fontSize: size2 / 3,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

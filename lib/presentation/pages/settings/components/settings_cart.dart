import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

class SettingsCart extends StatelessWidget {
  final String icons;
  final String title;
  const SettingsCart({required this.icons, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.cartColor,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              SvgPicture.asset(icons),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    fontFamily: 'ClashDisplay',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

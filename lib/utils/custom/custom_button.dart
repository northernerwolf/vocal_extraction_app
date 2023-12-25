import 'package:flutter/material.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  const CustomButton({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor),
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'ClashDisplay',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

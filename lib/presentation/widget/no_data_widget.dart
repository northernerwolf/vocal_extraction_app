import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  final String image;
  final String text;
  final String text2;
  const NoDataWidget(
      {required this.image,
      required this.text,
      required this.text2,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: Center(
        child: Column(
          children: [
            Image.asset(
              image,
              height: 150,
              width: 150,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  fontFamily: 'ClashDisplay',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 15),
              child: Text(
                text2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vocal_extraction_app/utils/custom/custom_slider.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: AppBar(
          backgroundColor: AppColors.backgroundColor,
          automaticallyImplyLeading: false,
          // leadingWidth: double.infinity,
          centerTitle: true,
          title: const Text(
            'Playing',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'ClashDisplay',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 20,
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close,
                  size: 24,
                  color: Colors.white,
                )),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width - 50,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return VerticalCustomSlider();
                  }),
            ),
          ],
        ),
      )),
    );
  }
}

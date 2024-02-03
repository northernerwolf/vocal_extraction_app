import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:vocal_extraction_app/utils/custom/custom_slider.dart';
import 'package:vocal_extraction_app/utils/custom/custom_slider2.dart';
import 'package:vocal_extraction_app/utils/custom/custom_slider3.dart';
import 'package:vocal_extraction_app/utils/custom/custom_slider4.dart';
import 'package:vocal_extraction_app/utils/custom/custom_slider5.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  late AudioPlayer audioPlayer;

  double _sliderValue = 0.0;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioPlayer.positionStream.listen((position) {
      setState(() {
        _sliderValue = position.inSeconds.toDouble();
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppBar(
          backgroundColor: AppColors.backgroundColor,
          automaticallyImplyLeading: false,
          // leadingWidth: double.infinity,
          toolbarHeight: 65,
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
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 0, bottom: 44),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.width - 50,
                          child: VerticalCustomSlider()),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                            color: AppColors.cartColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            'assets/icons/micrafon.svg',
                            height: 24,
                            width: 24,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.width - 50,
                          child: VerticalCustomSlider2()),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                            color: AppColors.cartColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            'assets/icons/piano.svg',
                            height: 24,
                            width: 24,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.width - 50,
                          child: VerticalCustomSlider3()),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                            color: AppColors.cartColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            'assets/icons/gutar.svg',
                            height: 24,
                            width: 24,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.width - 50,
                          child: VerticalCustomSlider4()),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                            color: AppColors.cartColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            'assets/icons/baraban.svg',
                            height: 24,
                            width: 24,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.width - 50,
                          child: VerticalCustomSlider5()),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                            color: AppColors.cartColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            'assets/icons/musicnote.svg',
                            height: 24,
                            width: 24,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 35, right: 35, top: 24, bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PIRAMIDA',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          fontFamily: 'ClashDisplay',
                        ),
                      ),
                      Text(
                        'ABDY DAYY & VAGRANTDP',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.subtitleColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/icons/backarrow.svg',
                          color: AppColors.subtitleColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: SvgPicture.asset(
                          'assets/icons/ellipsis-vertical.svg',
                          height: 24,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Slider(
                value: _sliderValue,
                min: 0.0,
                thumbColor: Colors.white,
                activeColor: Colors.white,
                inactiveColor: Colors.grey,
                max: audioPlayer.duration?.inSeconds.toDouble() ?? 0.0,
                onChanged: (value) {
                  audioPlayer.seek(Duration(seconds: value.toInt()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                          'assets/icons/arrow-path-rounded-square.svg')),
                  IconButton(
                    icon: SvgPicture.asset('assets/icons/playbutton.svg'),
                    onPressed: () async {
                      await audioPlayer.setUrl(
                          'https://ulgamda.com.tm/uploads/files/2020-07/1595498066_abdy-dayy-vagrantdp-piramida.mp3');
                      audioPlayer.play();
                    },
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/export.svg',
                      color: AppColors.subtitleColor,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.pause),
              onPressed: () {
                audioPlayer.pause();
              },
            ),
            // SizedBox(
            // height: MediaQuery.of(context).size.width - 50,
            // width: MediaQuery.of(context).size.width,
            //   child: ListView.builder(
            //       itemCount: 5,
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       physics: const NeverScrollableScrollPhysics(),
            //       itemBuilder: (BuildContext context, index) {
            //         return ;
            //       }),
            // ),
          ],
        ),
      )),
    );
  }
}

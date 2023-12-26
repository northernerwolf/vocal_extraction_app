import 'package:flutter/material.dart';
import 'package:vocal_extraction_app/presentation/pages/initial/components/new_songs_cart.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

class NewSongs extends StatefulWidget {
  const NewSongs({super.key});

  @override
  State<NewSongs> createState() => _NewSongsState();
}

class _NewSongsState extends State<NewSongs> {
  List<String> image = [
    'assets/images/google_disk.png',
    'assets/images/google_foto.png',
    'assets/images/cloud.png'
  ];
  List<String> title = ['Files App', 'Gallery', 'Cloud storage'];
  List<String> subTitle = [
    'Songs from the Files App, Google  Drive, Dropbox, and more.',
    'Add media from your device’s gallery',
    'Any media from cloud services or public URLs. Streaming links won’t work.'
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
          // leadingWidth: double.infinity,
          centerTitle: true,
          title: const Text(
            'New Song',
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
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  return NewSongsCart(
                      icon: image[index],
                      title: title[index],
                      subTitle: subTitle[index]);
                }),
            const Text(
              'Supported files',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                fontFamily: 'ClashDisplay',
              ),
            ),
            const SizedBox(
              child: Text(
                'MP3, WAV, FLAC, M4A, MP4, MOV, WMA',
                // textAlign: TextAlign.start,
                maxLines: 4,
                style: TextStyle(
                  color: AppColors.subtitleColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

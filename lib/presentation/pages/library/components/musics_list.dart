import 'package:flutter/material.dart';
import 'package:vocal_extraction_app/presentation/pages/initial/components/songs_cart.dart';
import 'package:vocal_extraction_app/presentation/pages/initial/screens/new_songs.dart';
import 'package:vocal_extraction_app/presentation/pages/library/components/music_player.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

class MyMusicsPage extends StatefulWidget {
  const MyMusicsPage({super.key});

  @override
  State<MyMusicsPage> createState() => _MyLibraryPageState();
}

class _MyLibraryPageState extends State<MyMusicsPage> {
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
            'Halk aydymlar',
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
        padding: const EdgeInsets.only(left: 14, right: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    splashColor: AppColors.cartColor,
                    highlightColor: AppColors.cartColor,
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MusicPlayer()));
                    },
                    child: const SongsCart(
                        title: 'Miyagi - I got love', subTitle: '3:45'),
                  );
                }),
            // const NoDataWidget(
            //   image: 'assets/images/nodataL.svg',
            //   text: 'Get Started!',
            //   text2: 'Click on the button at the bottom to create a new form',
            // ),

            const Spacer(),
            InkWell(
              splashColor: AppColors.cartColor,
              highlightColor: AppColors.cartColor,
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const NewSongs()));
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.cartColor,
                    borderRadius: BorderRadius.circular(10)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.add,
                        size: 26,
                        color: AppColors.primary,
                      ),
                    ),
                    Center(
                      child: Text(
                        'Add',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'ClashDisplay',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

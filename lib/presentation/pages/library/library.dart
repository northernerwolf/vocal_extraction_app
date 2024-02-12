import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vocal_extraction_app/presentation/pages/initial/components/folders_cart.dart';
import 'package:vocal_extraction_app/presentation/pages/initial/components/songs_cart.dart';
import 'package:vocal_extraction_app/presentation/pages/initial/screens/new_songs.dart';
import 'package:vocal_extraction_app/presentation/pages/initial/screens/search_screen.dart';
import 'package:vocal_extraction_app/presentation/pages/library/components/music_player.dart';
import 'package:vocal_extraction_app/presentation/pages/library/components/musics_list.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

class MyLibraryPage extends StatefulWidget {
  const MyLibraryPage({super.key});

  @override
  State<MyLibraryPage> createState() => _MyLibraryPageState();
}

class _MyLibraryPageState extends State<MyLibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: AppColors.backgroundColor,
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          leadingWidth: double.infinity,
          leading: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 14, top: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Library',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    fontFamily: 'ClashDisplay',
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SearchScreen()));
                    },
                    icon: SvgPicture.asset('assets/icons/search.svg'))
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 20, bottom: 20),
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
                    // focusColor: Colors.amber,
                    // hoverColor: Colors.amber,
                    splashColor: AppColors.cartColor,
                    highlightColor: AppColors.cartColor,
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MyMusicsPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: const FoldersCart(title: 'Pop', subTitle: '3:45'),
                    ),
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
                child: Center(
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
              ),
            )
          ],
        ),
      )),
    );
  }
}

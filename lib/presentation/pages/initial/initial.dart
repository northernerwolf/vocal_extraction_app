import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vocal_extraction_app/presentation/pages/initial/screens/new_songs.dart';
import 'package:vocal_extraction_app/presentation/pages/initial/screens/search_screen.dart';
import 'package:vocal_extraction_app/presentation/widget/no_data_widget.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: AppBar(
          backgroundColor: AppColors.backgroundColor,
          automaticallyImplyLeading: false,
          leadingWidth: double.infinity,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15, right: 5, bottom: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Songs',
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
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ListView.builder(
            //     itemCount: 3,
            //     shrinkWrap: true,
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemBuilder: (BuildContext context, index) {
            //       return SongsCart(
            //           title: 'Miyagi - I got love', sub_title: '3:45');
            //     }),

            const NoDataWidget(
              image: 'assets/images/no_data.png',
              text: 'Get Started!',
              text2: 'Click on the button at the bottom to create a new form',
            ),

            const Spacer(),
            InkWell(
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

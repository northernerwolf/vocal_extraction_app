import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vocal_extraction_app/presentation/pages/initial/screens/add_library.dart';
import 'package:vocal_extraction_app/presentation/pages/initial/screens/rename_playlist.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

class FoldersCart extends StatelessWidget {
  final String title;
  final String subTitle;
  const FoldersCart({required this.title, required this.subTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.cartColor),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/folder-open.svg',
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 200,
                      child: Text(
                        title,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: 'ClashDisplay',
                        ),
                      ),
                    ),
                    Text(
                      subTitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.subtitleColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          InkWell(
              splashColor: AppColors.cartColor,
              highlightColor: AppColors.cartColor,
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: AppColors.cartColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(25),
                        topStart: Radius.circular(25),
                      ),
                    ),
                    builder: (context) {
                      return Container(
                        height: 240,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 20, bottom: 32),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                splashFactory: NoSplash.splashFactory,
                                splashColor: AppColors.cartColor,
                                highlightColor: AppColors.cartColor,
                                hoverColor: AppColors.cartColor,
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                      height: 4,
                                      width: 46,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(18)),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 24),
                                child: Text(
                                  'Halk aydymlar',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    fontFamily: 'ClashDisplay',
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 6, bottom: 3),
                                child: InkWell(
                                  splashColor: AppColors.cartColor,
                                  highlightColor: AppColors.cartColor,
                                  hoverColor: AppColors.cartColor,
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ReneamePlaylist()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 6, bottom: 9, left: 8),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/edit_name.svg',
                                          height: 22,
                                          width: 22,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 12),
                                          child: Text(
                                            'Rename',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
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
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 6, bottom: 3),
                                child: InkWell(
                                  splashColor: AppColors.cartColor,
                                  highlightColor: AppColors.cartColor,
                                  hoverColor: AppColors.cartColor,
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 6, bottom: 9, left: 8),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/delet.svg',
                                          height: 22,
                                          width: 22,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 12),
                                          child: Text(
                                            'Delete',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
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
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: SvgPicture.asset('assets/icons/ellipsis-vertical.svg'))
        ],
      ),
    );
  }
}

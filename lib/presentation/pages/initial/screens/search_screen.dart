import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vocal_extraction_app/presentation/widget/no_data_widget.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.west,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                Container(
                  height: 45,
                  width: size - 70,
                  decoration: BoxDecoration(
                      color: AppColors.cartColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size - 140,
                            height: 45,
                            child: TextFormField(
                              // controller: searchController,
                              // focusNode: widget.focusNode,
                              // // onChanged: performSearch,
                              // onFieldSubmitted: performSearch,
                              style: const TextStyle(color: Colors.white),
                              maxLines: 1,

                              decoration: const InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  color: AppColors.subtitleColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                ),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icons/search.svg',
                            color: AppColors.subtitleColor,
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: const SafeArea(
          child: Column(
        children: [
          NoDataWidget(
            image: 'assets/images/no_found.png',
            text: 'Not Found!',
            text2: 'Click on the button at the bottom to create a new form',
          ),
        ],
      )),
    );
  }
}

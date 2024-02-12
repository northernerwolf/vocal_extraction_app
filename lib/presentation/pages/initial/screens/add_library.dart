import 'package:flutter/material.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

class NewPlaylist extends StatelessWidget {
  const NewPlaylist({super.key});

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
            'New playlist',
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
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 45,
              // width: size - 90,
              decoration: BoxDecoration(
                  color: AppColors.cartColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: SizedBox(
                          width: 140,
                          height: 45,
                          child: TextFormField(
                            // controller: searchController,
                            // focusNode: widget.focusNode,
                            // // onChanged: performSearch,
                            // onFieldSubmitted: performSearch,
                            style: const TextStyle(color: Colors.white),
                            maxLines: 1,

                            decoration: const InputDecoration(
                              hintText: 'My Playlist',
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
                      ),
                    ]),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.sliderColor),
              child: const Center(
                  child: Text(
                'Create',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  fontFamily: 'ClashDisplay',
                ),
              )),
            ),
          ),
        ],
      )),
    );
  }
}

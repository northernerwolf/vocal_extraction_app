import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

class NewSongsCart extends StatefulWidget {
  final String icon;
  final String title;
  final String subTitle;
  const NewSongsCart(
      {required this.icon,
      required this.title,
      required this.subTitle,
      super.key});

  @override
  State<NewSongsCart> createState() => _NewSongsCartState();
}

class _NewSongsCartState extends State<NewSongsCart> {
  openExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );
    if (result != null) {
      print("File selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        splashColor: AppColors.cartColor,
        highlightColor: AppColors.cartColor,
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          openExplorer();
        },
        child: Container(
          // height: 80,
          width: size,
          decoration: BoxDecoration(
              color: AppColors.cartColor,
              borderRadius: BorderRadius.circular(14)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SvgPicture.asset(
                      widget.icon,
                      height: 30.0,
                      width: 40.0,
                      // color: AppColors.primary,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: 'ClashDisplay',
                        ),
                      ),
                      SizedBox(
                        width: size - 150,
                        child: Text(
                          widget.subTitle,
                          // textAlign: TextAlign.start,
                          maxLines: 4,
                          style: const TextStyle(
                            color: AppColors.subtitleColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

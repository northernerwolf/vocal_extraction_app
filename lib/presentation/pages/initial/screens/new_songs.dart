import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocal_extraction_app/data/providers/provider_post_url.dart';
import 'package:vocal_extraction_app/presentation/pages/initial/components/new_songs_cart.dart';
import 'package:vocal_extraction_app/presentation/pages/initial/components/upload_youtube.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

class NewSongs extends StatefulWidget {
  const NewSongs({super.key});

  @override
  State<NewSongs> createState() => _NewSongsState();
}

class _NewSongsState extends State<NewSongs> {
  late final TextEditingController textField1Controller;
  late final TextEditingController textField2Controller;
  @override
  void initState() {
    super.initState();
    textField1Controller = TextEditingController();
    textField2Controller = TextEditingController();
  }

  @override
  void dispose() {
    textField1Controller.dispose();
    textField2Controller.dispose();

    super.dispose();
  }

  List<String> image = [
    'assets/images/google_disk.png',
    'assets/images/google_foto.png',
    'assets/images/youtube.png',
    'assets/images/cloud.png',
  ];
  List<String> title = [
    'Files App',
    'Gallery',
    'YouTube',
    'Cloud storage',
  ];
  List<String> subTitle = [
    'Songs from the Files App, Google  Drive, Dropbox, and more.',
    'Add media from your device’s gallery',
    'Add media from your device’s gallery',
    'Any media from cloud services or public URLs. Streaming links won’t work.',
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  return index == 2
                      ? NewSongsCartYoutube(
                          icon: image[index],
                          title: title[index],
                          subTitle: subTitle[index],
                          text: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.backgroundColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 45,
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  child: TextFormField(
                                    controller: textField1Controller,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.url,
                                    cursorColor: Colors.white,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                        fillColor: AppColors.backgroundColor,
                                        filled: true,
                                        border: InputBorder.none,
                                        // isDense: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        hintText: "https://...",
                                        hintStyle:
                                            TextStyle(color: Colors.grey)),
                                  ),
                                ),
                                Selector<PostUrlProvider, bool>(
                                    selector: (context, login) =>
                                        login.isLoading,
                                    builder: (_, isLoading, __) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: InkWell(
                                          onTap: () async {
                                            if (textField1Controller
                                                .text.isNotEmpty) {
                                              await context
                                                  .read<PostUrlProvider>()
                                                  .postUrl(
                                                      textField1Controller.text
                                                          .toString(),
                                                      true,
                                                      context);
                                            } else {}
                                          },
                                          child: Container(
                                            height: 45,
                                            width: 65,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.blue),
                                            child: Center(
                                              child: isLoading == false
                                                  ? const Text(
                                                      'Add',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                        fontFamily:
                                                            'ClashDisplay',
                                                      ),
                                                    )
                                                  : const CircularProgressIndicator(),
                                            ),
                                          ),
                                        ),
                                      );
                                    })
                              ],
                            ),
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            if (index == 3) {
                              _showDialog();
                            }
                          },
                          child: NewSongsCart(
                              icon: image[index],
                              title: title[index],
                              subTitle: subTitle[index]),
                        );
                }),
            const Spacer(),
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

  _showDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.cartColor,
          title: Text(
            'Enter Text',
            style: TextStyle(color: Colors.white),
          ),
          content: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(10)),
                  height: 45,
                  width: MediaQuery.of(context).size.width - 150,
                  child: TextFormField(
                    controller: textField2Controller,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.url,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        fillColor: AppColors.backgroundColor,
                        filled: true,
                        border: InputBorder.none,
                        // isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: "https://...",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                setState(() async {
                  if (textField2Controller.text.isNotEmpty) {
                    await context.read<PostUrlProvider>().postUrl(
                        textField2Controller.text.toString(), false, context);
                    Navigator.pop(context);
                  } else {}
                });
              },
              child: Text('OK'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

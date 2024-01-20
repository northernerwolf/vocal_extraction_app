import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocal_extraction_app/data/providers/provider_get_output.dart';
import 'package:vocal_extraction_app/data/providers/provider_post_url.dart';
import 'package:vocal_extraction_app/firebase_options.dart';
import 'package:vocal_extraction_app/presentation/widget/onboarding_page.dart';
import 'package:vocal_extraction_app/presentation/widget/splash_screen.dart';
import 'package:vocal_extraction_app/utils/design/app_colors.dart';

int? initScreen;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //         apiKey: "AIzaSyBO2JUXGe3ghT5aqp-2kSQWbbY1P73QEpM",
  //         appId: "1:82788046448:ios:cd9957a7b3687bfbae86b5",
  //         messagingSenderId: "82788046448",
  //         projectId: "mus-voc-extractor"));

  var pref = await SharedPreferences.getInstance();
  initScreen = pref.getInt("initScreen");
  await pref.setInt("initScreen", 1);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<PostUrlProvider>(
      create: (_) => PostUrlProvider(),
    ),
    ChangeNotifierProvider<FirestoreDataProvider>(
      create: (_) => FirestoreDataProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // backgroundColor: AppColors.backgroundColor,
          primaryColorDark: AppColors.backgroundColor,
          primaryColor: AppColors.backgroundColor,
          primaryColorLight: AppColors.backgroundColor,
          dividerColor: AppColors.backgroundColor,
          appBarTheme: const AppBarTheme(
            color: AppColors.backgroundColor,
          )),
      initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
      routes: {
        '/': (context) => const SpalshScreen(),
        "first": (context) => WelcomePage(),
      },
      // home: SubscriptionPage(),
    );
  }
}

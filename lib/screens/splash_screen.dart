import 'dart:async';

import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:ecomik/utils/constants/app_page_names.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /* <---- Splash screen shows for 2 seconds and go to intro screen ----> */
  Future<void> _delayAndGotoNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    // In case, the screen is not shown after 2 seconds, Do nothing.
    if (!mounted) return;
    // Go to intro screen
    Navigator.pushNamedAndRemoveUntil(
        context, AppPageNames.introScreen, (_) => false);
  }

  /* <---- Initial state ----> */
  @override
  void initState() {
    _delayAndGotoNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Content --------> */
      backgroundColor: AppColors.primaryColor,
      body: DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset(AppAssetImages.splashScreenAbstract).image,
                fit: BoxFit.fitWidth)),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /* <----- App logo -----> */
              Image.asset(AppAssetImages.logoWhite, height: 92, width: 92),
              AppGaps.wGap10,
              /* <---- App name text ----> */
              const Text(
                // Edit this app version code text as it changes
                'Ecomik',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 56,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

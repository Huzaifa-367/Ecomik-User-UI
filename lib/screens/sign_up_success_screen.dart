import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:ecomik/utils/constants/app_page_names.dart';
import 'package:ecomik/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpSuccessScreen extends StatelessWidget {
  const SignUpSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Illustration const cached image height
    final int illustrationImageCacheHeight = (240 * 1.5).toInt();

    /// Illustration const cached image width
    final int illustrationImageCacheWidth = (288 * 1.5).toInt();
    return Scaffold(
        extendBodyBehindAppBar: true,
        /* <-------- Empty appbar with back button --------> */
        appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: Center(
              child: CustomIconButtonWidget(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  hasShadow: true,
                  child: SvgPicture.asset(
                    AppAssetImages.arrowLeftSVGLogoLine,
                    color: AppColors.darkColor,
                    height: 18,
                    width: 18,
                  )),
            )),
        /* <-------- Content --------> */
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppGaps.hGap80,
                /* <---- Sign up success illustration ----> */
                Image.asset(AppAssetImages.signUpSuccessIllustration,
                    cacheHeight: illustrationImageCacheHeight,
                    cacheWidth: illustrationImageCacheWidth,
                    height: 240,
                    width: 288),
                AppGaps.hGap56,
                const HighlightAndDetailTextWidget(
                    isSpaceShorter: true,
                    slogan: 'You\'re done!',
                    subtitle:
                        'Please confirm your country code and enter phone number'),
                AppGaps.hGap30,
              ],
            ),
          ),
        ),
        /* <-------- Bottom bar button --------> */
        bottomNavigationBar: CustomScaffoldBottomBarWidget(
          child: CustomStretchedTextButtonWidget(
              buttonText: 'Send code',
              onTap: () {
                Navigator.pushNamed(
                    context, AppPageNames.passwordRecoveryPromptScreen);
              }),
        ));
  }
}

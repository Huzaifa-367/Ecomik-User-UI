import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:ecomik/utils/constants/app_page_names.dart';
import 'package:ecomik/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordRecoveryPromptScreen extends StatelessWidget {
  const PasswordRecoveryPromptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      /* <-------- Empty appbar with back button --------> */
      appBar: CoreWidgets.appBarWidget(screenContext: context),
      /* <-------- Content --------> */
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppGaps.screenPaddingValue),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppGaps.hGap80,
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /* <---- Password recovery illustration ----> */
                      Image.asset(AppAssetImages.passwordRecoveryIllustration,
                          height: 240),
                      AppGaps.hGap20,
                      Text('Password recovery',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline3),
                      AppGaps.hGap16,
                      Text(
                          'Please confirm your country code and enter phone number',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                                  color: AppColors.bodyTextColor,
                                  overflow: TextOverflow.clip)),
                    ],
                  ),
                ),
                AppGaps.hGap40,
                /* <---- Country selection text field ----> */
                CustomTextFormField(
                  isReadOnly: true,
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssetImages.ukSVGLogoColor,
                        height: 20,
                        width: 20,
                      ),
                      AppGaps.wGap30,
                      Container(
                          height: 26,
                          width: 2,
                          color: AppColors.lineShapeColor),
                    ],
                  ),
                  prefixIconConstraints:
                      const BoxConstraints(maxHeight: 32, maxWidth: 75),
                  hintText: 'United State',
                  suffixIconConstraints:
                      const BoxConstraints(maxHeight: 32, maxWidth: 32),
                  suffixIcon: SvgPicture.asset(
                    AppAssetImages.arrowDownSVGLogoLine,
                    color: AppColors.bodyTextColor,
                  ),
                ),
                AppGaps.hGap24,
                /* <---- Phone number text field ----> */
                CustomTextFormField(
                  textInputType: TextInputType.phone,
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        '+880',
                        style: TextStyle(
                            fontSize: 16, color: AppColors.bodyTextColor),
                      ),
                      AppGaps.wGap10,
                      Container(
                          height: 26,
                          width: 2,
                          color: AppColors.lineShapeColor),
                    ],
                  ),
                  prefixIconConstraints:
                      const BoxConstraints(maxHeight: 32, maxWidth: 75),
                  hintText: '823 394 939',
                  suffixIconConstraints:
                      const BoxConstraints(minHeight: 32, minWidth: 32),
                ),
                AppGaps.hGap30,
              ],
            ),
          ),
        ),
      ),
      /* <-------- Bottom bar of sign up text --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
        child: CustomStretchedTextButtonWidget(
            buttonText: 'Send code',
            onTap: () {
              // Go to password recovery OTP verification screen.
              Navigator.pushNamed(
                  context, AppPageNames.passwordRecoveryVerificationScreen);
            }),
      ),
    );
  }
}

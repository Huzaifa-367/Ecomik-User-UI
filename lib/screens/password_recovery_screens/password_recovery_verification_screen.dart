import 'dart:async';

import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:ecomik/utils/constants/app_page_names.dart';
import 'package:ecomik/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PasswordRecoveryVerificationScreen extends StatefulWidget {
  const PasswordRecoveryVerificationScreen({Key? key}) : super(key: key);

  @override
  State<PasswordRecoveryVerificationScreen> createState() =>
      _PasswordRecoveryVerificationScreenState();
}

class _PasswordRecoveryVerificationScreenState
    extends State<PasswordRecoveryVerificationScreen> {
  /// OTP timer duration value
  Duration _otpTimerDuration = const Duration();

  /// OTP timer
  Timer _otpTimer = Timer(
    const Duration(seconds: 1),
    () {},
  );
  @override
  void initState() {
    _otpTimerDuration = const Duration(minutes: 1);
    _otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_otpTimerDuration.inSeconds > 0) {
          _otpTimerDuration = _otpTimerDuration - const Duration(seconds: 1);
        }
      });
    });
    super.initState();
  }

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
                // Top extra spaces
                AppGaps.hGap80,
                /* <---- Verification icon and text ----> */
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppAssetImages.verificationIllustration,
                          height: 240),
                      AppGaps.hGap20,
                      const HighlightAndDetailTextWidget(
                          slogan: 'Verification',
                          subtitle:
                              'Verification code was sent to your number. Which is +880 (238) 282 982'),
                    ],
                  ),
                ),
                AppGaps.hGap40,
                /* <---- OTP input field ----> */
                Pinput(
                  length: 4,
                  focusedPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: const TextStyle(color: AppColors.darkColor),
                    decoration: BoxDecoration(
                      color: AppColors.shadeColor2,
                      border:
                          Border.all(color: AppColors.primaryColor, width: 2),
                      borderRadius: const BorderRadius.all(
                          AppComponents.defaultBorderRadius),
                    ),
                  ),
                  errorPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: const TextStyle(
                      color: Colors.red,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: const BorderRadius.all(
                          AppComponents.defaultBorderRadius),
                    ),
                  ),
                  submittedPinTheme: const PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: TextStyle(color: Colors.white),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius:
                          BorderRadius.all(AppComponents.defaultBorderRadius),
                    ),
                  ),
                  followingPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: const TextStyle(
                        color: AppColors.darkColor,
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.lineShapeColor),
                      borderRadius: const BorderRadius.all(
                          AppComponents.defaultBorderRadius),
                    ),
                  ),
                ),
                AppGaps.hGap24,
                /* <---- 'Resend code in:' text and timer text row ----> */
                Center(
                    child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Resend code in: '),
                    /* <---- Resend otp code remaining text ----> */
                    Text(
                        '${_otpTimerDuration.inMinutes.toString().padLeft(2, '0')}'
                        ':${(_otpTimerDuration.inSeconds % 60).toString().padLeft(2, '0')}',
                        style: const TextStyle(color: AppColors.primaryColor)),
                  ],
                )),
                // Bottom extra spaces
                AppGaps.hGap30,
              ],
            ),
          ),
        ),
      ),
      /* <-------- Bottom bar of sign up text --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomStretchedTextButtonWidget(
                buttonText: 'Send code',
                onTap: () {
                  Navigator.pushNamed(
                      context, AppPageNames.passwordRecoveryCreateScreen);
                }),
            TextButton(
                onPressed: () {},
                child: const Text('Resend',
                    style: TextStyle(color: AppColors.darkColor))),
          ],
        ),
      ),
    );
  }

  /* <-------- Exit state --------> */
  @override
  void dispose() {
    if (_otpTimer.isActive) {
      _otpTimer.cancel();
    }
    super.dispose();
  }
}

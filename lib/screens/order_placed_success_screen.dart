import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:ecomik/utils/constants/app_page_names.dart';
import 'package:ecomik/widgets/core_widgets.dart';
import 'package:flutter/material.dart';

class OrderPlacedSuccessScreen extends StatelessWidget {
  const OrderPlacedSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Content --------> */
      body: SafeArea(
          top: true,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 356,
                      child: Column(
                        children: [
                          /* <---- Illustration image ----> */
                          Image.asset(AppAssetImages.orderSuccessIllustration,
                              height: 240),
                          AppGaps.hGap20,
                          /* <---- Highlighter text and subtitle text ----> */
                          const HighlightAndDetailTextWidget(
                              slogan: 'Order placed!',
                              subtitle:
                                  'Don\'t worry. We\'ll let you it there any problem with your account'),
                        ],
                      ),
                    ),
                  ]),
            ),
          )),
      /* <-------- Bottom bar --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
        child: CustomStretchedTextButtonWidget(
            buttonText: 'Track order',
            onTap: () {
              // Go to delivery info screen
              Navigator.pushNamed(context, AppPageNames.deliveryInfoScreen);
            }),
      ),
    );
  }
}

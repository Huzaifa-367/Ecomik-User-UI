import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:ecomik/utils/constants/app_page_names.dart';
import 'package:ecomik/widgets/core_widgets.dart';
import 'package:flutter/material.dart';

class ReviewSuccessScreen extends StatelessWidget {
  const ReviewSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context, titleWidget: const Text('Review submitted')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /* <---- Add review illustration ----> */
              Image.asset(AppAssetImages.reviewSuccessIllustration,
                  height: 170, width: 170),
              AppGaps.hGap56,
              const HighlightAndDetailTextWidget(
                  slogan: 'Thank you!',
                  subtitle: 'Your review is submitted successfully'),
              // Bottom extra spaces
              AppGaps.hGap30,
            ],
          ),
        )),
      ),
      /* <-------- Bottom bar --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
        child: CustomStretchedTextButtonWidget(
            buttonText: 'Go to home',
            onTap: () {
              Navigator.pushNamed(context, AppPageNames.homeNavigatorScreen,
                  arguments: 0);
            }),
      ),
    );
  }
}

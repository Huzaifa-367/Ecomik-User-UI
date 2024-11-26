import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:ecomik/utils/constants/app_page_names.dart';
import 'package:ecomik/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({Key? key}) : super(key: key);

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  /// Currently star rate value
  int _currentStarRate = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context,
          hasBackButton: true,
          titleWidget: const Text('Review')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /* <---- Add review illustration ----> */
              Image.asset(AppAssetImages.addReviewIllustration,
                  height: 170, width: 170),
              AppGaps.hGap56,
              Text('Please leave a feedback & rate your experience',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4),
              AppGaps.hGap24,
              /* <---- Review stars row ----> */
              SizedBox(
                  height: 24,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) => IconButton(
                      constraints:
                          const BoxConstraints(minHeight: 24, minWidth: 40),
                      padding: EdgeInsets.zero,
                      onPressed: () =>
                          setState(() => _currentStarRate = index + 1),
                      icon: SvgPicture.asset(
                        AppAssetImages.starSVGLogoSolid,
                        height: 24,
                        width: 24,
                        color: _currentStarRate >= (index + 1)
                            ? AppColors.secondaryColor
                            : AppColors.darkColor.withOpacity(0.2),
                      ),
                    ),
                  )),
              AppGaps.hGap56,
              /* <---- Review text with caption ----> */
              const CustomTextFormField(
                labelText: 'Tell us something',
                minLines: 3,
                maxLines: 5,
              ),
              // Bottom extra spaces
              AppGaps.hGap30,
            ],
          ),
        )),
      ),
      /* <-------- Bottom bar --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
        child: CustomStretchedTextButtonWidget(
            buttonText: 'Submit review',
            onTap: () {
              Navigator.pushNamed(context, AppPageNames.reviewSuccessScreen);
            }),
      ),
    );
  }
}

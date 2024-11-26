import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:ecomik/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditMyAccountScreen extends StatelessWidget {
  const EditMyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context,
          hasBackButton: true,
          titleWidget: const Text('Edit account')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top extra spaces
              AppGaps.hGap15,
              /* <---- Profile picture, name, phone number, email address
                       ----> */
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        /* <---- Profile picture ----> */
                        CircleAvatar(
                          backgroundImage: Image.asset(
                            AppAssetImages.myAccountProfilePicture,
                          ).image,
                          radius: 64,
                        ),
                        /* <---- Small camera circle icon button ----> */
                        Positioned(
                            bottom: 7,
                            right: -3,
                            child: IconButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(
                                  minHeight: 34, minWidth: 34),
                              icon: Container(
                                height: 34,
                                width: 34,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primaryColor,
                                    border: Border.all(color: Colors.white)),
                                child: SvgPicture.asset(
                                  AppAssetImages.cameraSVGLogoSolid,
                                  height: 14,
                                  width: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ))
                      ],
                    ),
                    AppGaps.hGap18,
                    /* <---- Profile name ----> */
                    Text(
                      'Samantha smith',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.button?.copyWith(),
                    ),
                    AppGaps.hGap8,
                    /* <---- Profile phone number ----> */
                    const Text('+1 283 390 390',
                        style: TextStyle(color: AppColors.bodyTextColor)),
                    AppGaps.hGap5,
                    /* <---- Profile email address ----> */
                    const Text('samanthasmith@gmail.com',
                        style: TextStyle(color: AppColors.bodyTextColor)),
                    AppGaps.hGap32,
                    CustomHorizontalDashedLineWidget(
                        color: AppColors.darkColor.withOpacity(0.1)),
                    AppGaps.hGap32,
                    /* <---- Edit your name ----> */
                    CustomTextFormField(
                        labelText: 'Your name',
                        hintText: 'Your name',
                        prefixIcon: SvgPicture.asset(
                            AppAssetImages.profileSVGLogoLine)),
                    AppGaps.hGap24,
                    /* <---- Edit your email address ----> */
                    CustomTextFormField(
                        labelText: 'Email address',
                        hintText: 'contact@gmail.com',
                        prefixIcon: SvgPicture.asset(
                            AppAssetImages.messageSVGLogoLine)),
                    AppGaps.hGap24,
                    /* <---- Edit your date of birth ----> */
                    CustomTextFormField(
                        isReadOnly: true,
                        onTap: () {
                          showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(DateTime.now().year - 100),
                              lastDate: DateTime.now());
                        },
                        labelText: 'Date of birth',
                        hintText: '28-10-96',
                        prefixIcon: SvgPicture.asset(
                            AppAssetImages.calenderSVGLogoLine)),
                    // Bottom extra spaces
                    AppGaps.hGap30,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      /* <-------- Bottom bar --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
          child: CustomStretchedButtonWidget(
        onTap: () {},
        child: const Text('Save changes'),
      )),
    );
  }
}

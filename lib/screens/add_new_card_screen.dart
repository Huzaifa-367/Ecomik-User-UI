import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:ecomik/utils/constants/app_page_names.dart';
import 'package:ecomik/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  /// Toggle value card text obscure
  bool _isCardTextObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context, titleWidget: const Text('Add new card')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppGaps.hGap15,
            /* <---- Name on card text field ----> */
            CustomTextFormField(
              labelText: 'Name on card',
              prefixIcon: SvgPicture.asset(AppAssetImages.cardSVGLogoLine),
              hintText: 'Card name',
            ),
            AppGaps.hGap24,
            /* <---- Card number text field ----> */
            CustomTextFormField(
              labelText: 'Card number',
              isPasswordTextField: _isCardTextObscure,
              prefixIcon: SvgPicture.asset(AppAssetImages.cardEditSVGLogoLine),
              hintText: '**** **** **** ****',
              textInputType: TextInputType.number,
              suffixIcon: IconButton(
                  icon: SvgPicture.asset(AppAssetImages.hideSVGLogoLine,
                      color: _isCardTextObscure
                          ? AppColors.bodyTextColor
                          : AppColors.primaryColor),
                  onPressed: () {
                    setState(() {
                      _isCardTextObscure = !_isCardTextObscure;
                    });
                  }),
            ),
            AppGaps.hGap24,
            /* <---- Expiration and CVV text field row ----> */
            Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    /* <---- Expiration date text field ----> */
                    child: CustomTextFormField(
                      labelText: 'Expiration',
                      prefixIcon:
                          SvgPicture.asset(AppAssetImages.cardSVGLogoLine),
                      hintText: '02/11/21',
                      textInputType: TextInputType.datetime,
                    ),
                  ),
                  AppGaps.wGap16,
                  Expanded(
                    /* <---- CVV text field ----> */
                    child: CustomTextFormField(
                      labelText: 'Cvv',
                      prefixIcon:
                          SvgPicture.asset(AppAssetImages.editSVGLogoLine),
                      hintText: '399',
                      textInputType: TextInputType.number,
                    ),
                  )
                ]),
            AppGaps.hGap24,
            /* <---- Postal code text field ----> */
            CustomTextFormField(
              labelText: 'Postal code',
              prefixIcon:
                  SvgPicture.asset(AppAssetImages.routeSquareSVGLogoLine),
              hintText: '6350',
              textInputType: TextInputType.number,
            ),
            // Bottom extra spaces
            AppGaps.hGap30,
          ],
        )),
      ),
      /* <-------- Bottom bar --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
        child: CustomStretchedTextButtonWidget(
            buttonText: 'Add new card',
            onTap: () {
              Navigator.pushNamed(context, AppPageNames.orderSuccessScreen);
            }),
      ),
    );
  }
}

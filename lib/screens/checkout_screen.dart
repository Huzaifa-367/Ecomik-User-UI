import 'package:ecomik/models/fake_data.dart';
import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:ecomik/utils/constants/app_page_names.dart';
import 'package:ecomik/widgets/core_widgets.dart';
import 'package:ecomik/widgets/screen_widgets/checkout_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  /// Currently selected checkout option index
  int _selectedPaymentOptionIndex = -1;

  @override
  Widget build(BuildContext context) {
    /// Get screen size
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context, titleWidget: const Text('Checkout')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: CustomScrollView(slivers: [
          // Top extra spaces
          const SliverToBoxAdapter(child: AppGaps.hGap15),
          /* <---- Payment card widget ----> */
          SliverToBoxAdapter(
              child: PaymentCardWidget(
                  child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Name',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(color: Colors.white.withOpacity(0.7))),
              AppGaps.hGap2,
              Text('Michel John Doe',
                  style: Theme.of(context).textTheme.button?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600)),
              AppGaps.hGap16,
              Text(
                '****    ****    ****    2382',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.white),
              ),
              AppGaps.hGap16,
              Text('Balance',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(color: Colors.white.withOpacity(0.7))),
              AppGaps.hGap2,
              Text(r'$2373.00',
                  style: Theme.of(context).textTheme.button?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500)),
            ],
          ))),
          const SliverToBoxAdapter(child: AppGaps.hGap32),
          /* <---- 'Payment' text and add new text button row ----> */
          SliverToBoxAdapter(
              child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payment',
                style: Theme.of(context).textTheme.headline4,
              ),
              /* <---- + Add new text button ----> */
              CustomTightTextButtonWidget(
                  onTap: () {
                    Navigator.pushNamed(context, AppPageNames.addNewCardScreen);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppAssetImages.plusSVGLogoSolid,
                          color: AppColors.primaryColor, height: 12, width: 12),
                      AppGaps.wGap2,
                      Text(
                        'Add new',
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ))
            ],
          )),
          const SliverToBoxAdapter(child: AppGaps.hGap16),
          /* <---- Payment options list ----> */
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              /// Single payment Option
              final paymentOption = FakeData.paymentOptions[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: PaymentOptionListTileWidget(
                  hasShadow: _selectedPaymentOptionIndex == index,
                  onTap: () {
                    setState(() => _selectedPaymentOptionIndex = index);
                  },
                  paymentIconWidget: paymentOption.paymentImage,
                  paymentName: paymentOption.name,
                  radioOnChange: (value) {
                    setState(() {
                      _selectedPaymentOptionIndex = index;
                    });
                  },
                  index: index,
                  selectedPaymentOptionIndex: _selectedPaymentOptionIndex,
                ),
              );
            },
            childCount: FakeData.paymentOptions.length,
          )),
          // Bottom extra spaces
          const SliverToBoxAdapter(child: AppGaps.hGap30),
        ]),
      ),
      /* <-------- Bottom bar of row of price and pay now button --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              r'Total: $65.00',
              style: Theme.of(context).textTheme.headline4,
            ),
            AppGaps.wGap15,
            /* <---- Pay now button ----> */
            CustomLargeTextButtonWidget(
              // If screen size is small, set small button size,
              // else, set large button size.
              isSmallScreen: screenSize.width < 350,
              text: 'Pay now',
              textColor: Colors.white,
              onTap: () {
                Navigator.pushNamed(context, AppPageNames.orderSuccessScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}

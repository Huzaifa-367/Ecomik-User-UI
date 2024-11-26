import 'package:ecomik/models/fake_data.dart';
import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:ecomik/utils/constants/app_page_names.dart';
import 'package:ecomik/widgets/core_widgets.dart';
import 'package:ecomik/widgets/screen_widgets/my_wallet_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
        screenContext: context,
        titleWidget: const Text('My wallet'),
        /* <---- Appbar right side widgets ----> */
        actions: [
          PopupMenuButton<int>(
              padding: const EdgeInsets.only(right: 5),
              position: PopupMenuPosition.under,
              icon: const Icon(Icons.more_vert_rounded,
                  color: AppColors.darkColor),
              onSelected: (value) {
                switch (value) {
                  case 0:
                    Navigator.pushNamed(context, AppPageNames.addNewCardScreen);
                    break;
                  default:
                }
              },
              itemBuilder: (context) => [
                    const PopupMenuItem<int>(
                      value: 0,
                      child: Text(
                        'Add card',
                        textAlign: TextAlign.center,
                      ),
                    )
                  ])
        ],
      ),
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
          /* <---- 'Payment' text and 'Add money' text button row ----> */
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
              /* <---- 'Add money' text button ----> */
              CustomTightTextButtonWidget(
                  onTap: () {
                    Navigator.pushNamed(context, AppPageNames.addMoneyScreen);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppAssetImages.plusSVGLogoSolid,
                          color: AppColors.primaryColor, height: 12, width: 12),
                      AppGaps.wGap2,
                      Text(
                        'Add money',
                        style: Theme.of(context).textTheme.button?.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ))
            ],
          )),
          const SliverToBoxAdapter(child: AppGaps.hGap16),
          /* <---- Recent payment product list ----> */
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              /// Get recent payment product
              final product = FakeData.recentPaymentProducts[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: RecentPaymentProductListTileWidget(
                  productImage: product.productImage,
                  productName: product.productName,
                  itemCount: product.itemCount,
                  dateTimeText: product.paymentDateTimeText,
                  productPriceText: product.priceText,
                ),
              );
            },
            childCount: FakeData.recentPaymentProducts.length,
          )),
          // Bottom extra spaces
          const SliverToBoxAdapter(child: AppGaps.hGap30),
        ]),
      ),
    );
  }
}

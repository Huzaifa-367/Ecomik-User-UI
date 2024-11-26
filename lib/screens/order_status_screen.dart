import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:ecomik/utils/constants/app_data.dart';
import 'package:ecomik/utils/constants/app_page_names.dart';
import 'package:ecomik/widgets/core_widgets.dart';
import 'package:ecomik/widgets/screen_widgets/order_status_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({Key? key}) : super(key: key);

  /// Get delivered order stepper widget based on current order status
  Widget _orderDelivered(String currentOrderStatus) {
    switch (currentOrderStatus) {
      case AppData.orderStatusDelivered:
        return const StepperEnabledWidget(
          timeText: '9:30',
          statusText: 'Delivered',
          statusDescriptionText:
              'Product deliver to you and marked as delivered by customer.',
        );
      default:
        return const StepperDisabledWidget(
          statusText: 'Delivered',
          statusDescriptionText:
              'Product deliver to you and marked as delivered by customer.',
        );
    }
  }

  /// Get processing order stepper widget based on current order status
  Widget _orderProcessing(String currentOrderStatus) {
    switch (currentOrderStatus) {
      case AppData.orderStatusProcessing:
      case AppData.orderStatusDelivered:
        return const StepperEnabledWidget(
          timeText: '9:30 AM',
          statusText: 'Order processing',
          statusDescriptionText:
              'Your order is processing to deliver you on time.',
        );
      default:
        return const StepperDisabledWidget(
          statusText: 'Order processing',
          statusDescriptionText:
              'Your order is processing to deliver you on time.',
        );
    }
  }

  /// Get confirmed order stepper widget based on current order status
  Widget _orderConfirmed(String currentOrderStatus) {
    switch (currentOrderStatus) {
      case AppData.orderStatusConfirmed:
      case AppData.orderStatusProcessing:
      case AppData.orderStatusDelivered:
        return const StepperEnabledWidget(
            timeText: '9:30 AM',
            statusText: 'Order confirmed',
            statusDescriptionText:
                'Your order is confirmed. Will deliver within 20 minutes');
      default:
        return const StepperDisabledWidget(
            statusText: 'Order confirmed',
            statusDescriptionText:
                'Your order is confirmed. Will deliver within 20 minutes');
    }
  }

  /// Get pending order stepper widget based on current order status
  Widget _orderPendingWidget(String currentOrderStatus) {
    switch (currentOrderStatus) {
      case AppData.orderStatusPending:
      case AppData.orderStatusConfirmed:
      case AppData.orderStatusProcessing:
      case AppData.orderStatusDelivered:
        return const StepperEnabledWidget(
            timeText: '9:30 AM',
            statusText: 'Order pending',
            statusDescriptionText:
                'Your order is pending for confirmation. Will confirm within 5 minutes.');
      default:
        return const StepperDisabledWidget(
            statusText: 'Order pending',
            statusDescriptionText:
                'Your order is pending for confirmation. Will confirm within 5 minutes.');
    }
  }

  /// Get placed order stepper widget based on current order status
  Widget _orderPlacedWidget(String currentOrderStatus) {
    switch (currentOrderStatus) {
      case AppData.orderStatusPlaced:
      case AppData.orderStatusPending:
      case AppData.orderStatusConfirmed:
      case AppData.orderStatusProcessing:
      case AppData.orderStatusDelivered:
        return const StepperEnabledWidget(
            timeText: '9:30 AM',
            statusText: 'Order placed',
            statusDescriptionText:
                'Your order #2783839 was placed for delivery.');
      default:
        return const StepperDisabledWidget(
            statusText: 'Order placed',
            statusDescriptionText:
                'Your order #2783839 was placed for delivery.');
    }
  }

  /// Get bottom button widget based on current order status
  Widget _bottomButtonWidget(
      BuildContext screenContext, String currentOrderStatus) {
    switch (currentOrderStatus) {
      case AppData.orderStatusPlaced:
      case AppData.orderStatusPending:
        return CustomStretchedTextButtonWidget(
            buttonText: 'Cancel order', onTap: () {});
      case AppData.orderStatusConfirmed:
      case AppData.orderStatusProcessing:
        return const CustomStretchedTextButtonWidget(
            buttonText: 'Cancel order', onTap: null);
      case AppData.orderStatusDelivered:
        return CustomStretchedTextButtonWidget(
            buttonText: 'Leave a feedback',
            onTap: () {
              Navigator.pushNamed(screenContext, AppPageNames.addReviewScreen);
            });
      default:
        return const CustomStretchedTextButtonWidget(
            buttonText: 'Cancel order', onTap: null);
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Current order status set to delivered for demo purpose
    const String currentOrderStatus = AppData.orderStatusDelivered;
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context, titleWidget: const Text('Order status')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top extra spaces
              AppGaps.hGap10,
              /* <---- Order product name ----> */
              Text('AirPods Pro', style: Theme.of(context).textTheme.headline3),
              AppGaps.hGap8,
              /* <---- Order product rating stars widget ----> */
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 20,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => AppGaps.wGap2,
                        itemCount: 5,
                        itemBuilder: (context, index) => SvgPicture.asset(
                          AppAssetImages.starSVGLogoSolid,
                          color: AppColors.secondaryColor,
                        ),
                      )),
                  AppGaps.wGap4,
                  /* <---- Order product rating number text ----> */
                  const Text('(4.2)',
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.bodyTextColor,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              AppGaps.hGap16,
              /* <---- Order product description ----> */
              const Text(
                  'There are many variations of passages Lorem Ipsum'
                  ' available, but the majority have suffered alteration in '
                  'some form, injected humour, or randomised words.',
                  style:
                      TextStyle(fontSize: 14, color: AppColors.bodyTextColor)),
              AppGaps.hGap24,
              /* <---- Order placed status ----> */
              _orderPlacedWidget(currentOrderStatus),
              AppGaps.hGap15,
              /* <---- Order pending status ----> */
              _orderPendingWidget(currentOrderStatus),
              AppGaps.hGap15,
              /* <---- Order confirmed status ----> */
              _orderConfirmed(currentOrderStatus),
              AppGaps.hGap15,
              /* <---- Order processing status ----> */
              _orderProcessing(currentOrderStatus),
              AppGaps.hGap15,
              /* <---- Order delivered status ----> */
              _orderDelivered(currentOrderStatus),
              // Bottom extra spaces
              AppGaps.hGap30,
            ],
          ),
        ),
      ),
      /* <-------- Bottom bar --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
        /* <---- Bottom button based on order status ----> */
        child: _bottomButtonWidget(context, currentOrderStatus),
      ),
    );
  }
}

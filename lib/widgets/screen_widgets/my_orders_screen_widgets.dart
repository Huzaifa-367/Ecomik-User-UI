import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:ecomik/widgets/core_widgets.dart';
import 'package:flutter/material.dart';

/// Order status box widget
class OrderStatusWidget extends StatelessWidget {
  final String orderStatus;
  const OrderStatusWidget({
    Key? key,
    required this.orderStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String statusText;
    final Color statusBackgroundColor;
    switch (orderStatus.toLowerCase()) {
      case 'pending':
        statusText = 'Pending';
        statusBackgroundColor = AppColors.secondaryColor;
        break;
      case 'processing':
        statusText = 'Processing';
        statusBackgroundColor = AppColors.tertiaryColor;
        break;
      case 'delivered':
        statusText = 'Delivered';
        statusBackgroundColor = AppColors.successColor;
        break;
      case 'cancelled':
        statusText = 'Cancelled';
        statusBackgroundColor = AppColors.alertColor;
        break;
      default:
        statusText = 'Pending';
        statusBackgroundColor = AppColors.secondaryColor;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: statusBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(6))),
      child: Text(
        statusText,
        style: const TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}

/// Product list tile for my order tab page from home screen.
class MyOrderProductWidget extends StatelessWidget {
  final void Function()? onTap;
  final ImageProvider<Object> productImage;
  final String productName;
  final String priceText;
  final String orderStatusText;
  final String dateText;
  const MyOrderProductWidget({
    Key? key,
    this.onTap,
    required this.productImage,
    required this.productName,
    required this.priceText,
    required this.orderStatusText,
    required this.dateText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListTileWidget(
        paddingValue: const EdgeInsets.all(16),
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image:
                      DecorationImage(image: productImage, fit: BoxFit.cover)),
            ),
            AppGaps.wGap16,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  AppGaps.hGap12,
                  Text(
                    '\$$priceText',
                    style: Theme.of(context).textTheme.caption?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                OrderStatusWidget(orderStatus: orderStatusText),
                AppGaps.hGap16,
                Text(
                  dateText,
                  style: const TextStyle(
                      fontSize: 12, color: AppColors.bodyTextColor),
                ),
              ],
            )
          ],
        ));
  }
}

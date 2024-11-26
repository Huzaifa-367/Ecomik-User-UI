import 'package:ecomik/models/fake_models/product_model.dart';
import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:ecomik/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Cart list tile widget for my cart screen from home screen
class CartItemWidget extends StatelessWidget {
  final int index;
  final FakeProductModel cartProduct;
  final void Function()? onTap;
  final void Function()? onAddTap;
  final void Function()? onRemoveTap;
  final void Function()? onDeleteTap;
  const CartItemWidget({
    Key? key,
    required this.index,
    required this.cartProduct,
    this.onAddTap,
    this.onRemoveTap,
    this.onDeleteTap,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(index),
      endActionPane: ActionPane(
          extentRatio: 0.35,
          motion: const ScrollMotion(),
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppGaps.wGap16,
                Material(
                  color: AppColors.primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    onTap: onDeleteTap,
                    child: Container(
                        width: 80,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          AppAssetImages.deleteSVGLogoLine,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            )
          ]),
      child: CustomListTileWidget(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          paddingValue: const EdgeInsets.all(8),
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(image: cartProduct.productImage),
                    borderRadius:
                        const BorderRadius.all((Radius.circular(16)))),
              ),
              AppGaps.wGap16,
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartProduct.name,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    AppGaps.hGap2,
                    Text(cartProduct.shortDescription,
                        style: const TextStyle(
                            color: AppColors.bodyTextColor, fontSize: 12)),
                    AppGaps.hGap8,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text('\$${cartProduct.price}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600)),
                        ),
                        PlusMinusCounterRow(
                            onRemoveTap: onRemoveTap,
                            counterText: '${cartProduct.cartCount}',
                            onAddTap: onAddTap),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

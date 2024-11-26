import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Saved address card widget
class SavedAddressCardWidget extends StatelessWidget {
  final String addressText;
  final String addressType;
  const SavedAddressCardWidget({
    Key? key,
    required this.addressText,
    required this.addressType,
  }) : super(key: key);

  Widget _getAddressTypeIcon(String addressType) {
    switch (addressType) {
      case 'home':
        return SvgPicture.asset(AppAssetImages.home2SVGLogoSolid,
            height: 32, width: 32, color: AppColors.primaryColor);
      case 'office':
        return SvgPicture.asset(AppAssetImages.buildingSVGLogoSolid,
            height: 32, width: 32, color: AppColors.primaryColor);
      case 'other':
        return SvgPicture.asset(AppAssetImages.buildings2SVGLogoSolid,
            height: 32, width: 32, color: AppColors.primaryColor);
      default:
        return SvgPicture.asset(AppAssetImages.buildings2SVGLogoSolid,
            height: 32, width: 32, color: AppColors.primaryColor);
    }
  }

  String _getAddressTypeText(String addressType) {
    switch (addressType) {
      case 'home':
        return 'Home';
      case 'office':
        return 'Office';
      case 'other':
        return 'Other';
      default:
        return 'Other';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.lineShapeColor),
          borderRadius:
              const BorderRadius.all(AppComponents.defaultBorderRadius)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getAddressTypeIcon(addressType),
          AppGaps.wGap16,
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppGaps.hGap3,
              Text(_getAddressTypeText(addressType),
                  style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600)),
              AppGaps.hGap10,
              Text(addressText,
                  style: const TextStyle(color: AppColors.bodyTextColor)),
            ],
          )),
        ],
      ),
    );
  }
}

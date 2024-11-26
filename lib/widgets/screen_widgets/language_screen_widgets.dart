import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:ecomik/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Language list tile widget from language selection screen
class LanguageListTileWidget extends StatelessWidget {
  final void Function()? onTap;
  final String languageNameText;
  final String languageFlagLocalAssetFileName;
  final bool isLanguageSelected;
  const LanguageListTileWidget({
    Key? key,
    this.onTap,
    required this.languageNameText,
    required this.languageFlagLocalAssetFileName,
    required this.isLanguageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListTileWidget(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 12,
                child: SvgPicture.asset(languageFlagLocalAssetFileName,
                    height: 24, width: 24)),
            AppGaps.wGap16,
            Expanded(
              child: Text(
                languageNameText,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            isLanguageSelected
                ? SvgPicture.asset(AppAssetImages.tickRoundedSVGLogoSolid,
                    color: AppColors.primaryColor)
                : AppGaps.emptyGap,
          ],
        ));
  }
}

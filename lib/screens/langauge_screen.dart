import 'package:ecomik/models/enums.dart';
import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:ecomik/widgets/core_widgets.dart';
import 'package:ecomik/widgets/screen_widgets/language_screen_widgets.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  /// Currently selected language
  LanguageSetting _currentLanguage = LanguageSetting.english;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context, titleWidget: const Text('Language')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top extra spaces
              AppGaps.hGap15,
              Text('Select language',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: AppColors.primaryColor)),
              AppGaps.hGap16,
              /* <---- English language choice list tile ----> */
              LanguageListTileWidget(
                onTap: () {
                  setState(() {
                    _currentLanguage = LanguageSetting.english;
                  });
                },
                languageFlagLocalAssetFileName:
                    AppAssetImages.usaFlagSVGLogoColor,
                languageNameText: 'English',
                isLanguageSelected: _currentLanguage == LanguageSetting.english,
              ),
              AppGaps.hGap16,
              /* <---- Russian language choice list tile ----> */
              LanguageListTileWidget(
                onTap: () {
                  setState(() {
                    _currentLanguage = LanguageSetting.russian;
                  });
                },
                languageFlagLocalAssetFileName:
                    AppAssetImages.russiaFlagSVGLogoColor,
                languageNameText: 'Russian',
                isLanguageSelected: _currentLanguage == LanguageSetting.russian,
              ),
              AppGaps.hGap16,
              /* <---- French language choice list tile ----> */
              LanguageListTileWidget(
                onTap: () {
                  setState(() {
                    _currentLanguage = LanguageSetting.french;
                  });
                },
                languageFlagLocalAssetFileName:
                    AppAssetImages.franceFlagSVGLogoColor,
                languageNameText: 'French',
                isLanguageSelected: _currentLanguage == LanguageSetting.french,
              ),
              AppGaps.hGap16,
              /* <---- Canada language choice list tile ----> */
              LanguageListTileWidget(
                onTap: () {
                  setState(() {
                    _currentLanguage = LanguageSetting.canada;
                  });
                },
                languageFlagLocalAssetFileName:
                    AppAssetImages.canadaFlagSVGLogoColor,
                languageNameText: 'Canada',
                isLanguageSelected: _currentLanguage == LanguageSetting.canada,
              ),
              AppGaps.hGap16,
              /* <---- Australia language choice list tile ----> */
              LanguageListTileWidget(
                onTap: () {
                  setState(() {
                    _currentLanguage = LanguageSetting.australian;
                  });
                },
                languageFlagLocalAssetFileName:
                    AppAssetImages.australiaFlagSVGLogoColor,
                languageNameText: 'Australia',
                isLanguageSelected:
                    _currentLanguage == LanguageSetting.australian,
              ),
              AppGaps.hGap16,
              /* <---- German language choice list tile ----> */
              LanguageListTileWidget(
                onTap: () {
                  setState(() {
                    _currentLanguage = LanguageSetting.german;
                  });
                },
                languageFlagLocalAssetFileName:
                    AppAssetImages.germanFlagSVGLogoColor,
                languageNameText: 'German',
                isLanguageSelected: _currentLanguage == LanguageSetting.german,
              ),
              // Bottom extra spaces
              AppGaps.hGap30,
            ],
          ),
        ),
      ),
    );
  }
}

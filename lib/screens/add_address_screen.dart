import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:ecomik/widgets/core_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context, titleWidget: const Text('Add new address')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top extra spaces
              AppGaps.hGap15,
              /* <---- Edit your home address ----> */
              const CustomTextFormField(
                  labelText: 'Home',
                  hintText: 'Enter your home address',
                  prefixIcon: AppGaps.emptyGap),
              AppGaps.hGap24,
              /* <---- Edit your email address ----> */
              CustomTextFormField(
                isReadOnly: true,
                labelText: 'Country',
                hintText: 'United State',
                prefixIcon: AppGaps.emptyGap,
                suffixIcon: IconButton(
                  onPressed: () {},
                  visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity),
                  padding: EdgeInsets.zero,
                  icon: SvgPicture.asset(AppAssetImages.arrowDownSVGLogoLine,
                      height: 15, width: 15),
                ),
              ),
              AppGaps.hGap24,
              /* <---- Edit your date of birth ----> */
              const CustomTextFormField(
                  labelText: 'Address',
                  hintText: 'Address',
                  minLines: 1,
                  maxLines: 3,
                  prefixIcon: AppGaps.emptyGap),
              AppGaps.hGap30,
            ],
          ),
        ),
      ),
      /* <-------- Bottom button column of 'save changes' and 'cancel' --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomStretchedButtonWidget(
            onTap: () {},
            child: const Text('Save changes'),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'))
        ],
      )),
    );
  }
}

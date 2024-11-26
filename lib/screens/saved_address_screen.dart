import 'package:ecomik/models/fake_data.dart';
import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:ecomik/utils/constants/app_page_names.dart';
import 'package:ecomik/widgets/core_widgets.dart';
import 'package:ecomik/widgets/screen_widgets/saved_address_screen_widgets.dart';
import 'package:flutter/material.dart';

class SavedAddressScreen extends StatelessWidget {
  const SavedAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context, titleWidget: const Text('Saved address')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        /* <---- Saved address card list ----> */
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 15, bottom: 30),
          separatorBuilder: (context, index) => AppGaps.hGap24,
          itemCount: FakeData.savedAddresses.length,
          itemBuilder: (context, index) {
            /// Single saved address
            final savedAddress = FakeData.savedAddresses[index];
            return SavedAddressCardWidget(
              addressType: savedAddress.addressType,
              addressText: savedAddress.addressText,
            );
          },
        ),
      ),
      /* <-------- Bottom bar --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
          child: CustomStretchedButtonWidget(
        onTap: () {
          Navigator.pushNamed(context, AppPageNames.addAddressScreen);
        },
        child: const Text('Add new address'),
      )),
    );
  }
}

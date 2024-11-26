import 'package:ecomik/models/fake_data.dart';
import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:ecomik/widgets/core_widgets.dart';
import 'package:ecomik/widgets/screen_widgets/notifications_screen_widgets.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      /* <-------- Empty appbar with back button --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context, titleWidget: const Text('Notification')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top extra spaces
            AppGaps.hGap80,
            /* <---- 'Clear all' text button ----> */
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /* <---- Clear all text button ----> */
                CustomTightTextButtonWidget(
                    onTap: () {}, child: const Text('Clear all')),
              ],
            ),
            /* <---- Notification list ----> */
            Expanded(
              /* <---- Notification list with date category ----> */
              child: ListView.separated(
                  itemCount: FakeData.fakeNotificationDateGroups.length,
                  padding: const EdgeInsets.only(bottom: 30),
                  separatorBuilder: (context, outerIndex) =>
                      const Divider(height: 32),
                  itemBuilder: (context, outerIndex) {
                    /// Single notification
                    final notificationDateGroup =
                        FakeData.fakeNotificationDateGroups[outerIndex];
                    return NotificationDateGroupWidget(
                        notificationDateGroup: notificationDateGroup,
                        outerIndex: outerIndex);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

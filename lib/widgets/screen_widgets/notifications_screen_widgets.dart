import 'package:ecomik/models/fake_data.dart';
import 'package:ecomik/models/fake_models/notification_model.dart';
import 'package:ecomik/utils/constants/app_constants.dart';
import 'package:ecomik/widgets/core_widgets.dart';
import 'package:flutter/material.dart';

/// Single notification entry widget from notification group
class SingleNotificationWidget extends StatelessWidget {
  final FakeNotificationModel notification;
  const SingleNotificationWidget({
    Key? key,
    required this.notification,
  }) : super(key: key);

  TextStyle? _getTextStyle(FakeNotificationTextModel notificationText) {
    if (notificationText.isBoldText) {
      return const TextStyle(fontWeight: FontWeight.w600);
    } else if (notificationText.isHashText) {
      return const TextStyle(
          color: AppColors.primaryColor, fontWeight: FontWeight.w600);
    } else if (notificationText.isColoredText) {
      return const TextStyle(color: AppColors.primaryColor);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomRawListTileWidget(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 10,
            width: 10,
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: notification.isRead
                    ? AppColors.bodyTextColor
                    : AppColors.primaryColor),
          ),
          AppGaps.wGap16,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: notification.isRead
                              ? AppColors.bodyTextColor
                              : AppColors.darkColor,
                          height: 1.5),
                      children: notification.texts
                          .map((notificationText) => TextSpan(
                              text: notificationText.text,
                              style: _getTextStyle(notificationText)))
                          .toList()),
                ),
                AppGaps.hGap8,
                Text(notification.timeText,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(color: AppColors.bodyTextColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Notification group widget from date wise
class NotificationDateGroupWidget extends StatelessWidget {
  const NotificationDateGroupWidget({
    Key? key,
    required this.notificationDateGroup,
    required this.outerIndex,
  }) : super(key: key);

  final FakeNotificationDateGroupModel notificationDateGroup;
  final int outerIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(notificationDateGroup.dateHumanReadableText,
            style: Theme.of(context).textTheme.button),
        AppGaps.hGap24,
        /* <---- Notification list under a date 
                 category ----> */
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          separatorBuilder: (context, index) => AppGaps.hGap24,
          itemCount: FakeData
              .fakeNotificationDateGroups[outerIndex].groupNotifications.length,
          itemBuilder: (context, index) {
            /// Single notification
            final notification = FakeData.fakeNotificationDateGroups[outerIndex]
                .groupNotifications[index];
            return SingleNotificationWidget(notification: notification);
          },
        ),
      ],
    );
  }
}

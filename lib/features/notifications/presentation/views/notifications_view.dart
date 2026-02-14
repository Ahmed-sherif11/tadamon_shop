import 'package:flutter/material.dart';
import 'package:tadamon_shop/features/notifications/data/models/notification_model.dart';
import 'package:tadamon_shop/features/notifications/presentation/widgets/notification_items.dart';
import 'package:tadamon_shop/features/About/presentation/views/about_view.dart';
import '../../../../generated/l10n.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NotificationModel> notificationsData = [
      NotificationModel(
        title: S.of(context).special_offer_title,
        subtitle: S.of(context).special_offer_desc,
        icon: Icons.block,
      ),
      NotificationModel(
        title: S.of(context).weekend_discount_title,
        subtitle: S.of(context).weekend_discount_desc,
        icon: Icons.swipe_vertical,
      ),
      NotificationModel(
        title: S.of(context).free_shipping_title,
        subtitle: S.of(context).free_shipping_desc,
        icon: Icons.touch_app_outlined,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/Blur.jpg',
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 108,
                  right: 20,
                  left: 20,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            size: 22, color: Colors.black),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AboutView()),
                          );
                        },
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.notifications_none,
                                size: 28, color: Colors.black),
                            const SizedBox(width: 10),
                            Text(
                              S.of(context).notifications,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo',
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                itemCount: notificationsData.length,
                itemBuilder: (context, index) {
                  return NotificationItem(
                      notification: notificationsData[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

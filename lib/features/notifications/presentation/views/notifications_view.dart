import 'package:flutter/material.dart';
import 'package:tadamon_shop/features/notifications/presentation/widgets/notification_items.dart';
import '../../../../generated/l10n.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
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
                        onPressed: () => Navigator.pop(context),
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

            // قائمة الإشعارات
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                children: [
                  NotificationItem(
                    title: S.of(context).special_offer_title,
                    subtitle: S.of(context).special_offer_desc,
                    icon: Icons.block,
                  ),
                  const SizedBox(height: 12),
                  NotificationItem(
                    title: S.of(context).weekend_discount_title,
                    subtitle: S.of(context).weekend_discount_desc,
                    icon: Icons.swipe_vertical,
                  ),
                  const SizedBox(height: 12),
                  NotificationItem(
                    title: S.of(context).free_shipping_title,
                    subtitle: S.of(context).free_shipping_desc,
                    icon: Icons.touch_app_outlined,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

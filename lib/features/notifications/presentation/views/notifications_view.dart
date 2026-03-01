import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tadamon_shop/features/About/presentation/views/about_view.dart';
import 'package:tadamon_shop/features/notifications/manager/notifications_bloc.dart';
import 'package:tadamon_shop/features/notifications/manager/notifications_event.dart';
import 'package:tadamon_shop/features/notifications/manager/notifications_state.dart';
import 'package:tadamon_shop/features/notifications/presentation/widgets/notification_items.dart';
import 'package:tadamon_shop/generated/l10n.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsBloc()..add(FetchNotifications()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/Blur.jpg',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 100,
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
                              const Icon(Icons.notifications_none_outlined,
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
                child: BlocBuilder<NotificationsBloc, NotificationsState>(
                  builder: (context, state) {
                    if (state is NotificationsSuccess) {
                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 0),
                        itemCount: state.notifications.length,
                        itemBuilder: (context, index) {
                          return NotificationItem(
                              notification: state.notifications[index]);
                        },
                      );
                    } else if (state is NotificationsFailure) {
                      return Center(child: Text(state.errMessage));
                    } else {
                      return const Center(
                        child:
                            CircularProgressIndicator(color: Color(0xFF2EAB4F)),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

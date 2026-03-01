import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../data/models/notification_model.dart';
import 'notifications_event.dart';
import 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(NotificationsInitial()) {
    on<FetchNotifications>((event, emit) async {
      emit(NotificationsLoading());
      try {
        await Future.delayed(const Duration(milliseconds: 500));

        final List<NotificationModel> data = [
          NotificationModel(
              title: "عرض خاص لدعم صمودهم",
              subtitle:
                  "خصم 20% علي منتجات التطريز اليدوي كل قطعة تحكي قصة صمود وتراث",
              icon: Icons.block),
          NotificationModel(
              title: "تخفيضات نهايه الاسبوع",
              subtitle:
                  "استفد من خصومات تصل الي 30% علي الصابون النابلسي ومنتجات الزعتر",
              icon: Icons.swipe_vertical),
          NotificationModel(
              title: "عرض الشحن المجاني",
              subtitle:
                  "احصل علي شحن مجاني لجميع الطلبات فوق 200 ريال ادعم منتجاتنا الوطنية",
              icon: Icons.touch_app_outlined),
        ];

        emit(NotificationsSuccess(data));
      } catch (e) {
        emit(NotificationsFailure("فشل تحميل الإشعارات"));
      }
    });
  }
}

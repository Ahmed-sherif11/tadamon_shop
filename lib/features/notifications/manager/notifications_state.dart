import 'package:equatable/equatable.dart';
import '../data/models/notification_model.dart';

abstract class NotificationsState extends Equatable {
  const NotificationsState(); // أضفنا const للأداء الأفضل

  @override
  List<Object> get props => [];
}

class NotificationsInitial extends NotificationsState {}

class NotificationsLoading extends NotificationsState {}

class NotificationsSuccess extends NotificationsState {
  final List<NotificationModel> notifications;
  const NotificationsSuccess(this.notifications);

  @override
  List<Object> get props => [notifications];
}

class NotificationsFailure extends NotificationsState {
  final String errMessage;
  const NotificationsFailure(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}

import 'package:equatable/equatable.dart';

abstract class NotificationsEvent extends Equatable {
  const NotificationsEvent();

  @override
  List<Object> get props => [];
}

class FetchNotifications extends NotificationsEvent {}

class RefreshNotifications extends NotificationsEvent {}

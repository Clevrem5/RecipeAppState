import 'package:equatable/equatable.dart';
import 'package:recipeapp3/Core/data/models/notification_model.dart';

enum NotificationsStatus { idle, success, loading, error }

class NotificationsState extends Equatable {
  final List<NotificationModel>? notific;
  final NotificationsStatus notificStatus;

  const NotificationsState({
    required this.notific,
    required this.notificStatus,
  });

  factory NotificationsState.initial() {
    return NotificationsState(
      notific: [],
      notificStatus: NotificationsStatus.idle,
    );
  }

  NotificationsState copyWith({List<NotificationModel>? notifications, NotificationsStatus? status}) {
    return NotificationsState(
      notific: notifications ?? notific,
      notificStatus: status ?? notificStatus,
    );
  }

  @override
  List<Object?> get props => [notific,notificStatus];
}

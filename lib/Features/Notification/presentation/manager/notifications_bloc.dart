import 'package:bloc/bloc.dart';
import 'package:recipeapp3/Core/data/repositories/notification_repository.dart';
import 'package:recipeapp3/Features/Notification/presentation/manager/notifications_state.dart';

part 'notifications_event.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationRepository _repo;

  NotificationsBloc({required NotificationRepository repo})
      : _repo = repo,
        super(NotificationsState.initial()) {
    on<NotificationsLoad>(_onLoad);
    add(NotificationsLoad());
  }

  Future<void> _onLoad(NotificationsLoad event, Emitter<NotificationsState> emit) async {
   emit( state.copyWith(status: NotificationsStatus.loading));
    final notific = await _repo.fetchNotification();
    emit(state.copyWith(notifications: notific, status: NotificationsStatus.success));
  }
}

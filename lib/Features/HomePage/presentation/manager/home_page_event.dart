sealed class HomePageEvent {}

final class  HomePageLoad extends HomePageEvent{
final int userId;
HomePageLoad({required this.userId});


}
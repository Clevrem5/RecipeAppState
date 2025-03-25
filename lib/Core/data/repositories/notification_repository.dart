import 'package:recipeapp3/Core/client.dart';
import 'package:recipeapp3/Core/data/models/notification_model.dart';

class NotificationRepository{
  final ApiClient client;
  NotificationRepository({required this.client});

  List<NotificationModel>? notification=[];

  Future<List<NotificationModel>>fetchNotification()async{
    var rawNotification=await client.genericGetRequest<List<dynamic>>('/notifications/list');
    notification=rawNotification.map((e)=>NotificationModel.fromJson(e)).toList();
    return notification!;
  }

}
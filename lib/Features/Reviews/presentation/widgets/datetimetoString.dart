Future<String> createdDateCounter(String created) async {
  DateTime now = DateTime.now();
  DateTime createdDate = DateTime.parse(created);

  Duration difference = now.difference(createdDate);

  if (difference.inDays > 0) {
    return '${difference.inDays} day ago';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} hours ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} minutes ago';
  } else {
    return 'Now';
  }
}

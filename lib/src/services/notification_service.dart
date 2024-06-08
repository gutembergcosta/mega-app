class CustomNotification {
  final int id;
  final String? titulo;
  final String? body;
  final String? payload;

  CustomNotification({
    required this.id,
    required this.titulo,
    required this.body,
    required this.payload,
  });
}

class NotificationService {}

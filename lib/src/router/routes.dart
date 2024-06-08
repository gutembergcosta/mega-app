import 'package:flutter/material.dart';
import 'package:mega_app/src/views/local_notifications/home_notifications.dart';
import 'package:mega_app/src/views/local_notifications/notificacao_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list =
      <String, WidgetBuilder>{
    '/home': (_) => const HomeNotification(),
    '/notificacao': (_) => const NotificacaoPage(),
  };

  static String initial = '/home';

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}

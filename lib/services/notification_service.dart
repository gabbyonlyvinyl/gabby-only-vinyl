import 'dart:developer' as developer;
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  static final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  static Future<void> initialize() async {
    // Vraag toestemming aan de gebruiker (vereist voor iOS en Android 13+)
    final NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    developer.log(
      'User granted notification permission: ${settings.authorizationStatus}',
      name: 'NotificationService',
    );

    // FCM Push Token ophalen voor apparaatregistratie
    final String? token = await _fcm.getToken();
    if (token != null) {
      developer.log('FCM Device Token: $token', name: 'NotificationService');
    }

    // Luister naar berichten terwijl de app open staat (foreground)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      developer.log(
        'Received foreground message: ${message.notification?.title}',
        name: 'NotificationService',
      );
    });
  }
}
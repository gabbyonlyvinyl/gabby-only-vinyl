import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'screens/main_navigation_screen.dart';
import 'services/notification_service.dart';
import 'services/supabase_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Supabase initialisatie
  await SupabaseService.initialize(
    supabaseUrl: 'https://rwdllvrrvbgplpnkvmak.supabase.co',
    supabaseAnonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3ZGxsdnJydmJncGxwbmt2bWFrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODk5MDE1ODAsImV4cCI6MjEwNTQ3NzU4MH0.mYJRVKjEPcsdY-zDsJvjxN2wiSz5DJD2i5oJSCHYYhM',
  );

  // Firebase Push Notifications initialisatie (mobiel)
  if (!kIsWeb) {
    try {
      await NotificationService.initialize();
    } catch (e) {
      developer.log('Notification initialization skipped or failed: $e', name: 'Main');
    }
  }

  runApp(const DjGabbyApp());
}

class DjGabbyApp extends StatelessWidget {
  const DjGabbyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gabby Only Vinyl',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: const ColorScheme.dark(
          primary: Colors.amber,
          surface: Color(0xFF1E1E1E),
        ),
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
    );
  }
}
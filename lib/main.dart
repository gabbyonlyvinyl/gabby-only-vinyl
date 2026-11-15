import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'screens/main_navigation_screen.dart';
import 'services/supabase_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Supabase initialisatie met vangnet (try-catch)
  try {
    await SupabaseService.initialize(
      supabaseUrl: 'https://rwdllvrrvbgplpnkvmak.supabase.co',
      supabaseAnonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ3ZGxsdnJydmJncGxwbmt2bWFrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODk5OI1ODAsImV4cCI6MjEwNTQ3NzU4MH0.mYJRVKjEPcsdY-zDsJvjxN2wiSz5DJD2i5oJSCHYYhM',
    );
  } catch (e) {
    developer.log('Supabase initialisatie mislukt: $e', name: 'Main');
  }

  // Firebase Push Notifications initialisatie (mobiel) tijdelijk uitgeschakeld
  if (!kIsWeb) {
    try {
      // await NotificationService.initialize();
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
        // Diepe bordeaux achtergrond
        scaffoldBackgroundColor: const Color(0xFF2C0A15),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFE91E63), // Helderroze / magenta voor knoppen en actieve elementen
          secondary: Color(0xFF40E0D0), // Mintblauw / turquoise voor golven en accenten
          surface: Color(0xFF3A0D1D),
        ),
        useMaterial3: true,

        // Thema voor standaard actieknoppen (zoals 'English')
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE91E63),
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),

        // Thema voor omlijnde knoppen (zoals 'Español')
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(color: Color(0xFFE91E63), width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),

        // Navigatiebalk onderaan met de roze actieve pil
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: const Color(0xFF2C0A15),
          indicatorColor: const Color(0xFFE91E63),
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: Colors.white);
            }
            return const IconThemeData(color: Color(0xFFA07080));
          }),
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              );
            }
            return const TextStyle(color: Color(0xFFA07080), fontSize: 12);
          }),
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}
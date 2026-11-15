import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C0A15),
      body: SafeArea(
        child: Stack(
          children: [
            // 1. Groot 'GABBY' watermerk op de achtergrond
            Positioned.fill(
              child: Center(
                child: Opacity(
                  opacity: 0.08,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      'GABBY',
                      style: TextStyle(
                        fontSize: 220,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 12,
                        color: const Color(0xFFE91E63),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // 2. Schermcontent
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),

                  // Header titel
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'SUPPORT & ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: 'BOOKINGS',
                          style: TextStyle(
                            color: Color(0xFF40E0D0),
                            shadows: [
                              Shadow(color: Color(0xFF40E0D0), blurRadius: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Centraal beeldmerk: roze vinyl met koptelefoon en oplichtende rand
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF8CE33E),
                        width: 3.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF8CE33E).withOpacity(0.35),
                          blurRadius: 18,
                          spreadRadius: 2,
                        ),
                      ],
                      gradient: const RadialGradient(
                        colors: [
                          Color(0xFFFF4081),
                          Color(0xFFE91E63),
                          Color(0xFF880E4F),
                          Color(0xFF1E050E),
                        ],
                        stops: [0.2, 0.5, 0.8, 1.0],
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.headphones,
                        color: Colors.white,
                        size: 64,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Toelichting / subtitel
                  const Text(
                    'Direct contact opnemen of Gabby boeken voor een event?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Knop 1: Roze actieknop voor contact
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 380),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE91E63),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'NEEM CONTACT OP',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Knop 2: Groene actieknop voor boekingen
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 380),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8CE33E),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'BOEK EEN AFSPRAAK',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Informatiekaart onderaan
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 380),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E050E).withOpacity(0.6),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFE91E63).withOpacity(0.25),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.mail_outline, color: Color(0xFF40E0D0), size: 20),
                        SizedBox(width: 10),
                        Text(
                          'gabbyonlyvinyl@gmail.com',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
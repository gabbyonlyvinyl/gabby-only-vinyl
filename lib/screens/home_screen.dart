import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C0A15),
      body: SafeArea(
        child: Stack(
          children: [
            // 1. Subtiel 'GABBY' watermerk op de achtergrond
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

            // 2. Scherminhoud
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 12),

                  // Header titel
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'DJ ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: 'GABBY ',
                          style: TextStyle(
                            color: Color(0xFF40E0D0), // Neon turquoise accent
                            shadows: [
                              Shadow(color: Color(0xFF40E0D0), blurRadius: 10),
                            ],
                          ),
                        ),
                        TextSpan(
                          text: 'ONLY VINYL',
                          style: TextStyle(
                            color: Color(0xFFE91E63), // Roze accent
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Centraal vinyl beeldmerk met turquoise oplichtende rand
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF40E0D0),
                        width: 3.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF40E0D0).withOpacity(0.35),
                          blurRadius: 20,
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(0.18),
                              width: 1.5,
                            ),
                          ),
                        ),
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(0.22),
                              width: 1.5,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.album,
                          color: Colors.white,
                          size: 72,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Welkomsttekst & Tagline
                  const Text(
                    'Welcome to the Groove',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Pure analoog geluid, rechtstreeks van de draaitafel.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Uitgelichte kaart
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 420),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E050E).withOpacity(0.75),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: const Color(0xFFE91E63).withOpacity(0.35),
                        width: 1.2,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.graphic_eq, color: Color(0xFF8CE33E), size: 20),
                            SizedBox(width: 8),
                            Text(
                              'LATEST VINYL MIX',
                              style: TextStyle(
                                color: Color(0xFF8CE33E),
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Retro Sessions Vol. 1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Een selectie van de beste disco-, funk- en houseplaten.',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Actieknoppen
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow, color: Colors.white),
                      label: const Text(
                        'BELUISTER SETS',
                        style: TextStyle(letterSpacing: 1),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.calendar_today, color: Colors.white, size: 18),
                      label: const Text(
                        'AANKOMENDE OPTREDENS',
                        style: TextStyle(letterSpacing: 1),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
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
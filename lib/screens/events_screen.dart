import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

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
                      text: 'UPCOMING ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: 'EVENTS',
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
                  const SizedBox(height: 24),

                  // Event kaart 1
                  _buildEventCard(
                    dateDay: '14',
                    dateMonth: 'NOV',
                    title: 'Vinyl Only Night',
                    location: 'Club Groove, Rotterdam',
                    time: '22:00 - 04:00',
                    isConfirmed: true,
                  ),
                  const SizedBox(height: 16),

                  // Event kaart 2
                  _buildEventCard(
                    dateDay: '28',
                    dateMonth: 'NOV',
                    title: 'Retro Funk & Soul Session',
                    location: 'Lounge Bar, Den Haag',
                    time: '21:00 - 02:30',
                    isConfirmed: true,
                  ),
                  const SizedBox(height: 16),

                  // Event kaart 3
                  _buildEventCard(
                    dateDay: '12',
                    dateMonth: 'DEC',
                    title: 'Private Party Booking',
                    location: 'Besloten Evenement',
                    time: '20:00 - Late',
                    isConfirmed: false,
                  ),
                  const SizedBox(height: 28),

                  // Boekingsoproep kaart onderaan
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 420),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E050E).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: const Color(0xFF8CE33E).withOpacity(0.35),
                        width: 1.2,
                      ),
                    ),
                    child: Column(
                      children: const [
                        Icon(Icons.event_available, color: Color(0xFF8CE33E), size: 28),
                        SizedBox(height: 8),
                        Text(
                          'Gabby boeken voor jouw feest?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Check het Support-scherm voor directe boekingen en contact.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildEventCard({
    required String dateDay,
    required String dateMonth,
    required String title,
    required String location,
    required String time,
    required bool isConfirmed,
  }) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 420),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E050E).withOpacity(0.75),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE91E63).withOpacity(0.35),
          width: 1.2,
        ),
      ),
      child: Row(
        children: [
          // Datum blok
          Container(
            width: 58,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFE91E63),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(
                  dateDay,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  dateMonth,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          // Event details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 14, color: Color(0xFF40E0D0)),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        location,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 14, color: Color(0xFF40E0D0)),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Status stip
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: (isConfirmed ? const Color(0xFF8CE33E) : Colors.orangeAccent).withOpacity(0.15),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: isConfirmed ? const Color(0xFF8CE33E) : Colors.orangeAccent,
                width: 1,
              ),
            ),
            child: Text(
              isConfirmed ? 'LIVE' : 'OPTIE',
              style: TextStyle(
                color: isConfirmed ? const Color(0xFF8CE33E) : Colors.orangeAccent,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
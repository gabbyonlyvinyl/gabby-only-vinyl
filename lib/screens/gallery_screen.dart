import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

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
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 12),

                        // Header titel
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: 'PHOTO ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2,
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: 'GALLERY',
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
                        const SizedBox(height: 8),
                        const Text(
                          'Sfeerimpressies, vintage vinyl & live optredens',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),

                // Foto grid
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 14.0,
                      crossAxisSpacing: 14.0,
                      childAspectRatio: 0.95,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return _buildGalleryTile(index);
                      },
                      childCount: 6,
                    ),
                  ),
                ),

                const SliverToBoxAdapter(
                  child: SizedBox(height: 28),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildGalleryTile(int index) {
    final List<Map<String, dynamic>> items = [
      {'title': 'Vinyl Crate Digging', 'icon': Icons.album, 'color': const Color(0xFFE91E63)},
      {'title': 'Club Live Set', 'icon': Icons.nightlife, 'color': const Color(0xFF40E0D0)},
      {'title': 'Technics 1200 Setup', 'icon': Icons.headphones, 'color': const Color(0xFF8CE33E)},
      {'title': 'Festival Stage', 'icon': Icons.speaker_group, 'color': const Color(0xFFE91E63)},
      {'title': 'Rare Funk 45s', 'icon': Icons.radio, 'color': const Color(0xFF40E0D0)},
      {'title': 'Crowd & Energy', 'icon': Icons.groups, 'color': const Color(0xFF8CE33E)},
    ];

    final item = items[index % items.length];

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E050E).withOpacity(0.75),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: (item['color'] as Color).withOpacity(0.35),
          width: 1.2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (item['color'] as Color).withOpacity(0.12),
              border: Border.all(
                color: (item['color'] as Color).withOpacity(0.5),
                width: 1.5,
              ),
            ),
            child: Icon(
              item['icon'] as IconData,
              color: item['color'] as Color,
              size: 32,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              item['title'] as String,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
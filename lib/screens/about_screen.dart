import 'package:flutter/material.dart';
import 'admin_screen.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String _selectedLanguage = 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C0A15),
      body: SafeArea(
        child: Stack(
          children: [
            // 1. Het originele Gabby2 artwork direct als achtergrond
            Positioned.fill(
              child: Center(
                child: Opacity(
                  opacity: 0.20,
                  child: Image.asset(
                    'assets/images/Gabby2.jpg',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      // Vangnet voor als de afbeelding nog niet is ingeladen
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ),
            ),

            // 2. Schermcontent
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Bovenbalk met acties en werkende bewerk-knop
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AdminScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Bewerken',
                            style: TextStyle(color: Colors.white70, fontSize: 13),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.share_outlined, color: Colors.white70, size: 20),
                        visualDensity: VisualDensity.compact,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.copy_outlined, color: Colors.white70, size: 20),
                        visualDensity: VisualDensity.compact,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.download_outlined, color: Colors.white70, size: 20),
                        visualDensity: VisualDensity.compact,
                      ),
                    ],
                  ),

                  // Header titel: ABOUT GABBY Only Vinyl
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'ABOUT ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: 'GABBY ',
                          style: TextStyle(
                            color: Color(0xFF40E0D0),
                            shadows: [
                              Shadow(color: Color(0xFF40E0D0), blurRadius: 10),
                            ],
                          ),
                        ),
                        TextSpan(
                          text: 'Only Vinyl',
                          style: TextStyle(
                            color: Color(0xFFE91E63),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Centraal vinyl met koptelefoon
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF40E0D0),
                        width: 3.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF40E0D0).withOpacity(0.4),
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 85,
                          height: 85,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white.withOpacity(0.18), width: 1.5),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white.withOpacity(0.22), width: 1.5),
                          ),
                        ),
                        const Icon(
                          Icons.headphones,
                          color: Colors.white,
                          size: 68,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    'Gabby Only Vinyl',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Taalwisselaar (English / Español)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => _selectedLanguage = 'en'),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                          decoration: BoxDecoration(
                            color: _selectedLanguage == 'en'
                                ? const Color(0xFFE91E63)
                                : Colors.transparent,
                            border: Border.all(
                              color: const Color(0xFFE91E63),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              if (_selectedLanguage == 'en') ...[
                                const Icon(Icons.check, size: 16, color: Colors.white),
                                const SizedBox(width: 4),
                              ],
                              Text(
                                'English',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: _selectedLanguage == 'en'
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () => setState(() => _selectedLanguage = 'es'),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                          decoration: BoxDecoration(
                            color: _selectedLanguage == 'es'
                                ? const Color(0xFFE91E63)
                                : Colors.transparent,
                            border: Border.all(
                              color: const Color(0xFFE91E63),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              if (_selectedLanguage == 'es') ...[
                                const Icon(Icons.check, size: 16, color: Colors.white),
                                const SizedBox(width: 4),
                              ],
                              Text(
                                'Español',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: _selectedLanguage == 'es'
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Biografie kaart
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 420),
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E050E).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFE91E63).withOpacity(0.35),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        _selectedLanguage == 'en'
                            ? 'Biography coming soon.'
                            : 'Biografía próximamente.',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Socials
                  const Text(
                    'Connect & Follow',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIconButton(Icons.music_note),
                      const SizedBox(width: 16),
                      _buildSocialIconButton(Icons.camera_alt_outlined),
                      const SizedBox(width: 16),
                      _buildSocialIconButton(Icons.mail_outline),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIconButton(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: const Color(0xFFE91E63), size: 20),
    );
  }
}
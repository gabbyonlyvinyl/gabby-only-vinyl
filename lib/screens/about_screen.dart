import 'package:flutter/material.dart';
import '../models/bio_item.dart';
import '../services/supabase_service.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  bool isLoading = true;
  String? errorMessage;
  BioItem? profile;
  bool isSpanish = false;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final item = await SupabaseService.getArtistProfile();
      setState(() {
        profile = item;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load profile: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Text(
          'ABOUT DJ GABBY',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.amber),
            onPressed: _loadProfile,
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.amber),
      );
    }

    if (errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.redAccent, size: 48),
              const SizedBox(height: 16),
              Text(
                errorMessage!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                ),
                child: const Text('Try Again'),
              ),
            ],
          ),
        ),
      );
    }

    final artistName = profile?.artistName ?? 'DJ GABBY';
    final currentBio = isSpanish
        ? (profile?.bioEs ?? 'Biografía en español disponible pronto.')
        : (profile?.bioEn ?? 'Biography coming soon.');

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: const Color(0xFF1E1E1E),
            backgroundImage: (profile?.profileImageUrl != null && profile!.profileImageUrl!.isNotEmpty)
                ? NetworkImage(profile!.profileImageUrl!)
                : null,
            child: (profile?.profileImageUrl == null || profile!.profileImageUrl!.isEmpty)
                ? const Icon(Icons.person, size: 60, color: Colors.amber)
                : null,
          ),
          const SizedBox(height: 16),
          Text(
            artistName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChoiceChip(
                label: const Text('English'),
                selected: !isSpanish,
                onSelected: (selected) {
                  if (selected) setState(() => isSpanish = false);
                },
                selectedColor: Colors.amber,
                labelStyle: TextStyle(
                  color: !isSpanish ? Colors.black : Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 12),
              ChoiceChip(
                label: const Text('Español'),
                selected: isSpanish,
                onSelected: (selected) {
                  if (selected) setState(() => isSpanish = true);
                },
                selectedColor: Colors.amber,
                labelStyle: TextStyle(
                  color: isSpanish ? Colors.black : Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Card(
            color: const Color(0xFF1E1E1E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                currentBio,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  height: 1.5,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Connect & Follow',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.music_note, color: Colors.amber, size: 30),
                onPressed: () {},
                tooltip: 'SoundCloud / Spotify',
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.camera_alt, color: Colors.amber, size: 30),
                onPressed: () {},
                tooltip: 'Instagram',
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.mail_outline, color: Colors.amber, size: 30),
                onPressed: () {},
                tooltip: 'Contact / Booking',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
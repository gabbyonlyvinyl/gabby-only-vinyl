import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Text(
          'SUPPORT & BOOKINGS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.favorite_outline,
              color: Colors.amber,
              size: 64,
            ),
            const SizedBox(height: 16),
            const Text(
              'Support DJ GABBY',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Help power the music, live sets, and upcoming tours. Your support makes a direct impact.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 28),
            _buildSupportCard(
              title: 'Tip & Donation',
              description: 'Support production and upcoming tracks directly via PayPal or card.',
              buttonText: 'Send a Tip',
              icon: Icons.coffee_outlined,
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            _buildSupportCard(
              title: 'Bookings & Management',
              description: 'Inquire about festivals, club nights, and private event bookings.',
              buttonText: 'Booking Request',
              icon: Icons.event_available_outlined,
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            _buildSupportCard(
              title: 'Official Merchandise',
              description: 'Exclusive DJ GABBY apparel and accessories coming soon.',
              buttonText: 'Coming Soon',
              icon: Icons.shopping_bag_outlined,
              isSecondary: true,
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportCard({
    required String title,
    required String description,
    required String buttonText,
    required IconData icon,
    required VoidCallback? onPressed,
    bool isSecondary = false,
  }) {
    return Card(
      color: const Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.amber, size: 24),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 13,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSecondary ? const Color(0xFF2C2C2C) : Colors.amber,
                  foregroundColor: isSecondary ? Colors.white54 : Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
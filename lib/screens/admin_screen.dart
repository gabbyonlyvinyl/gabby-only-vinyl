import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  // Beveiliging met pincode
  final TextEditingController _pinController = TextEditingController();
  bool _isAuthenticated = false;
  final String _adminPin = '1234'; // Verander dit naar een gewenste 4-cijferige pincode

  // Controllers voor nieuw evenement
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  bool _isConfirmed = true;
  bool _isSaving = false;

  void _checkPin() {
    if (_pinController.text == _adminPin) {
      setState(() {
        _isAuthenticated = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Onjuiste pincode. Probeer het opnieuw.'),
          backgroundColor: Color(0xFFE91E63),
        ),
      );
    }
  }

  Future<void> _saveEvent() async {
    if (_titleController.text.trim().isEmpty || _dayController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vul minimaal een titel en dag in.')),
      );
      return;
    }

    setState(() => _isSaving = true);

    try {
      // Direct wegschrijven naar de Supabase-tabel 'events'
      await Supabase.instance.client.from('events').insert({
        'day': _dayController.text.trim(),
        'month': _monthController.text.trim().toUpperCase(),
        'title': _titleController.text.trim(),
        'location': _locationController.text.trim(),
        'time': _timeController.text.trim(),
        'is_confirmed': _isConfirmed,
        'created_at': DateTime.now().toIso8601String(),
      });

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Evenement succesvol opgeslagen in Supabase!'),
          backgroundColor: Color(0xFF8CE33E),
        ),
      );

      // Maak de invoervelden leeg voor een volgend item
      _dayController.clear();
      _monthController.clear();
      _titleController.clear();
      _locationController.clear();
      _timeController.clear();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Fout bij opslaan: $e'),
          backgroundColor: const Color(0xFFE91E63),
        ),
      );
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C0A15),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'BEHEERDERS PANEEL',
          style: TextStyle(
            color: Color(0xFF40E0D0),
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: _isAuthenticated ? _buildAdminForm() : _buildPinPrompt(),
      ),
    );
  }

  // 1. Scherm om pincode in te vullen
  Widget _buildPinPrompt() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 360),
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: const Color(0xFF1E050E),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE91E63), width: 1.5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.lock_outline, color: Color(0xFF40E0D0), size: 48),
              const SizedBox(height: 16),
              const Text(
                'Toegang voor beheer',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Voer de 4-cijferige code in om data aan te passen.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _pinController,
                obscureText: true,
                keyboardType: TextInputType.number,
                maxLength: 4,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 24, letterSpacing: 8),
                decoration: InputDecoration(
                  counterText: '',
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.06),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onSubmitted: (_) => _checkPin(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _checkPin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE91E63),
                  minimumSize: const Size.fromHeight(48),
                ),
                child: const Text('ONTGRENDELEN', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 2. Formulier om nieuwe events in te voeren
  Widget _buildAdminForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Nieuw Evenement Toevoegen',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: _buildInput('Dag (bijv. 14)', _dayController, keyboard: TextInputType.number),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: _buildInput('Maand (bijv. NOV)', _monthController),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildInput('Titel van het feest / sessie', _titleController),
              const SizedBox(height: 12),
              _buildInput('Locatie & Stad', _locationController),
              const SizedBox(height: 12),
              _buildInput('Tijd (bijv. 22:00 - 04:00)', _timeController),
              const SizedBox(height: 12),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Status: Bevestigd (LIVE)', style: TextStyle(color: Colors.white)),
                value: _isConfirmed,
                activeColor: const Color(0xFF8CE33E),
                onChanged: (val) => setState(() => _isConfirmed = val),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isSaving ? null : _saveEvent,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8CE33E),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: _isSaving
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(color: Colors.black, strokeWidth: 2),
                      )
                    : const Text(
                        'OPSLAAN IN SUPABASE',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInput(String label, TextEditingController controller, {TextInputType keyboard = TextInputType.text}) {
    return TextField(
      controller: controller,
      keyboardType: keyboard,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white60, fontSize: 13),
        filled: true,
        fillColor: Colors.white.withOpacity(0.06),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF40E0D0)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
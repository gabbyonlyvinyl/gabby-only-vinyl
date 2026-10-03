import 'package:flutter/material.dart';
import '../services/supabase_service.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _eventTitleController = TextEditingController();
  final _eventLocationController = TextEditingController();
  final _eventDateController = TextEditingController();
  final _eventDescController = TextEditingController();

  final _newsTitleController = TextEditingController();
  final _newsContentController = TextEditingController();

  bool _isSaving = false;

  @override
  void dispose() {
    _eventTitleController.dispose();
    _eventLocationController.dispose();
    _eventDateController.dispose();
    _eventDescController.dispose();
    _newsTitleController.dispose();
    _newsContentController.dispose();
    super.dispose();
  }

  Future<void> _addEvent() async {
    if (_eventTitleController.text.trim().isEmpty ||
        _eventLocationController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter at least a title and location.')),
      );
      return;
    }

    setState(() => _isSaving = true);
    try {
      final parsedDate = DateTime.tryParse(_eventDateController.text.trim()) ?? DateTime.now();
      await SupabaseService.createEvent(
        title: _eventTitleController.text.trim(),
        location: _eventLocationController.text.trim(),
        eventDate: parsedDate,
        description: _eventDescController.text.trim().isNotEmpty
            ? _eventDescController.text.trim()
            : null,
      );

      _eventTitleController.clear();
      _eventLocationController.clear();
      _eventDateController.clear();
      _eventDescController.clear();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Event added successfully!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add event: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  Future<void> _addNews() async {
    if (_newsTitleController.text.trim().isEmpty ||
        _newsContentController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both title and content.')),
      );
      return;
    }

    setState(() => _isSaving = true);
    try {
      await SupabaseService.createNews(
        title: _newsTitleController.text.trim(),
        content: _newsContentController.text.trim(),
      );

      _newsTitleController.clear();
      _newsContentController.clear();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('News post published successfully!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to publish news: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Text(
          'ADMIN CONSOLE',
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
            const Text(
              'Add New Event',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildTextField(_eventTitleController, 'Event Title (e.g. Club Nova Set)'),
            const SizedBox(height: 8),
            _buildTextField(_eventLocationController, 'Location (e.g. Amsterdam, NL)'),
            const SizedBox(height: 8),
            _buildTextField(_eventDateController, 'Date (YYYY-MM-DD, e.g. 2026-10-15)'),
            const SizedBox(height: 8),
            _buildTextField(_eventDescController, 'Description (optional)', maxLines: 2),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _isSaving ? null : _addEvent,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: _isSaving
                  ? const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black),
                    )
                  : const Text('Save Event', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const Divider(height: 40, color: Colors.white24),
            const Text(
              'Publish News Announcement',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildTextField(_newsTitleController, 'Headline / Title'),
            const SizedBox(height: 8),
            _buildTextField(_newsContentController, 'Announcement Content', maxLines: 3),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _isSaving ? null : _addNews,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: _isSaving
                  ? const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black),
                    )
                  : const Text('Publish News', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white38),
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      ),
    );
  }
}
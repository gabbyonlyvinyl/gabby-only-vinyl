import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/bio_item.dart';
import '../models/event_item.dart';
import '../models/gallery_item.dart';
import '../models/news_item.dart';

class SupabaseService {
  static Future<void> initialize({
    required String supabaseUrl,
    required String supabaseAnonKey,
  }) async {
    await Supabase.initialize(
      url: supabaseUrl,
      publishableKey: supabaseAnonKey,
    );
  }

  static SupabaseClient get client => Supabase.instance.client;

  // --- Publieke leesfuncties ---

  static Future<List<NewsItem>> getLatestNews() async {
    final response = await client
        .from('news')
        .select()
        .order('created_at', ascending: false)
        .limit(5);

    return (response as List<dynamic>)
        .map((item) => NewsItem.fromMap(item as Map<String, dynamic>))
        .toList();
  }

  static Future<List<EventItem>> getUpcomingEvents() async {
    final response = await client
        .from('events')
        .select()
        .order('event_date', ascending: true);

    return (response as List<dynamic>)
        .map((item) => EventItem.fromMap(item as Map<String, dynamic>))
        .toList();
  }

  static Future<List<GalleryItem>> getGalleryItems() async {
    final response = await client
        .from('gallery')
        .select()
        .order('created_at', ascending: false);

    return (response as List<dynamic>)
        .map((item) => GalleryItem.fromMap(item as Map<String, dynamic>))
        .toList();
  }

  static Future<BioItem?> getArtistProfile() async {
    final response = await client
        .from('settings')
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return BioItem.fromMap(response);
  }

  // --- Beheerfuncties (Admin) ---

  static Future<void> createEvent({
    required String title,
    required String location,
    required DateTime eventDate,
    String? description,
    String? ticketUrl,
  }) async {
    await client.from('events').insert({
      'title': title,
      'location': location,
      'event_date': eventDate.toIso8601String(),
      'description': description,
      'ticket_url': ticketUrl,
    });
  }

  static Future<void> createNews({
    required String title,
    required String content,
  }) async {
    await client.from('news').insert({
      'title': title,
      'content': content,
    });
  }

  static Future<void> deleteItem({
    required String table,
    required String id,
  }) async {
    await client.from(table).delete().eq('id', id);
  }
}
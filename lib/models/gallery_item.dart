class GalleryItem {
  final String id;
  final String title;
  final String mediaUrl;
  final String mediaType; // 'photo' of 'video'
  final DateTime createdAt;

  GalleryItem({
    required this.id,
    required this.title,
    required this.mediaUrl,
    required this.mediaType,
    required this.createdAt,
  });

  factory GalleryItem.fromMap(Map<String, dynamic> map) {
    return GalleryItem(
      id: map['id']?.toString() ?? '',
      title: map['title'] as String? ?? 'Untitled Media',
      mediaUrl: map['media_url'] as String? ?? '',
      mediaType: map['media_type'] as String? ?? 'photo',
      createdAt: DateTime.tryParse(map['created_at'] as String? ?? '') ?? DateTime.now(),
    );
  }
}
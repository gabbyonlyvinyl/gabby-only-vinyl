class NewsItem {
  final String id;
  final String title;
  final String content;
  final String? imageUrl;
  final DateTime createdAt;

  NewsItem({
    required this.id,
    required this.title,
    required this.content,
    this.imageUrl,
    required this.createdAt,
  });

  factory NewsItem.fromMap(Map<String, dynamic> map) {
    return NewsItem(
      id: map['id'] as String,
      title: map['title'] as String? ?? 'Geen titel',
      content: map['content'] as String? ?? '',
      imageUrl: map['image_url'] as String?,
      createdAt: DateTime.tryParse(map['created_at'] as String? ?? '') ?? DateTime.now(),
    );
  }
}
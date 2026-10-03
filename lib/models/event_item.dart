class EventItem {
  final String id;
  final String title;
  final String location;
  final DateTime eventDate;
  final String? ticketUrl;
  final String? description;
  final String? imageUrl;

  EventItem({
    required this.id,
    required this.title,
    required this.location,
    required this.eventDate,
    this.ticketUrl,
    this.description,
    this.imageUrl,
  });

  factory EventItem.fromMap(Map<String, dynamic> map) {
    return EventItem(
      id: map['id']?.toString() ?? '',
      title: map['title'] as String? ?? 'Naamloos evenement',
      location: map['location'] as String? ?? 'Locatie onbekend',
      eventDate: DateTime.tryParse(map['event_date'] as String? ?? '') ?? DateTime.now(),
      ticketUrl: map['ticket_url'] as String?,
      description: map['description'] as String?,
      imageUrl: map['image_url'] as String?,
    );
  }
}
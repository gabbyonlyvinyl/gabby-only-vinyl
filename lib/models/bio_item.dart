class BioItem {
  final String id;
  final String artistName;
  final String bioEn;
  final String? bioEs;
  final String? profileImageUrl;
  final String? instagramUrl;
  final String? soundcloudUrl;
  final String? spotifyUrl;

  BioItem({
    required this.id,
    required this.artistName,
    required this.bioEn,
    this.bioEs,
    this.profileImageUrl,
    this.instagramUrl,
    this.soundcloudUrl,
    this.spotifyUrl,
  });

  factory BioItem.fromMap(Map<String, dynamic> map) {
    return BioItem(
      id: map['id']?.toString() ?? '',
      artistName: map['artist_name'] as String? ?? 'DJ GABBY',
      bioEn: map['bio_en'] as String? ?? 'Biography coming soon.',
      bioEs: map['bio_es'] as String?,
      profileImageUrl: map['profile_image_url'] as String?,
      instagramUrl: map['instagram_url'] as String?,
      soundcloudUrl: map['soundcloud_url'] as String?,
      spotifyUrl: map['spotify_url'] as String?,
    );
  }
}
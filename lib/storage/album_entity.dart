class AlbumEntity {
  final String id;
  final String name;
  final String? url;
  final String? localPath;
  final String? description;

  AlbumEntity({
    required this.id,
    required this.name,
    this.url,
    this.localPath,
    this.description,
  });

  AlbumEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        url = json['url'],
        localPath = json['localPath'],
        description = json['description'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'localPath': localPath,
      'description': description,
    };
  }
}

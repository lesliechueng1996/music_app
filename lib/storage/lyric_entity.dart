class LyricEntity {
  final String id;
  final String name;
  final String localPath;
  final String hash;

  LyricEntity({
    required this.id,
    required this.name,
    required this.localPath,
    required this.hash,
  });

  LyricEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        localPath = json['localPath'],
        hash = json['hash'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'localPath': localPath,
      'hash': hash,
    };
  }
}

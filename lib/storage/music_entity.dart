import 'album_entity.dart';
import 'lyric_entity.dart';
import 'singer_entity.dart';

class MusicEntity {
  final String id;
  final String name;
  final String url;
  final String localPath;
  final String fileHash;
  final String isFavorite;
  final AlbumEntity album;
  final List<SingerEntity> singers;
  final LyricEntity? lyric;

  MusicEntity({
    required this.id,
    required this.name,
    required this.url,
    required this.localPath,
    required this.fileHash,
    required this.isFavorite,
    required this.album,
    required this.singers,
    this.lyric,
  });

  MusicEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        url = json['url'],
        localPath = json['localPath'],
        fileHash = json['fileHash'],
        isFavorite = json['isFavorite'],
        album = AlbumEntity.fromJson(json['album']),
        singers = (json['singers'] as List)
            .map((singer) => SingerEntity.fromJson(singer))
            .toList(),
        lyric =
            json['lyric'] != null ? LyricEntity.fromJson(json['lyric']) : null;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'localPath': localPath,
      'fileHash': fileHash,
      'isFavorite': isFavorite,
      'album': album.toJson(),
      'singers': singers.map((singer) => singer.toJson()).toList(),
      'lyric': lyric?.toJson(),
    };
  }
}

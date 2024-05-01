import 'package:music_app/storage/music_entity.dart';

class MusicPageListItem {
  final String id;
  final String name;
  final String singersName;
  final String albumName;

  MusicPageListItem({
    required this.id,
    required this.name,
    required this.singersName,
    required this.albumName,
  });

  factory MusicPageListItem.fromMusicEntity(MusicEntity musicEntity) {
    final singersname =
        musicEntity.singers.map((singer) => singer.name).take(2).join('、');

    return MusicPageListItem(
      id: musicEntity.id,
      name: musicEntity.name,
      singersName: singersname,
      albumName: musicEntity.album.name,
    );
  }
}

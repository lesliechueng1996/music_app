// import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'album_entity.dart';
import 'lyric_entity.dart';
import 'music_entity.dart';
import 'singer_entity.dart';

class StorageUtil {
  static SharedPreferences? _prefs;

  static Future<List<MusicEntity>> getMusicList() async {
    // final prefs = await getPrefs();
    // final List<MusicEntity> musicList = [];
    // final String? musicListString = prefs.getString('allMusics');
    // if (musicListString != null) {
    //   final List<dynamic> musicListJson = jsonDecode(musicListString);
    //   for (var music in musicListJson) {
    //     musicList.add(MusicEntity.fromJson(music));
    //   }
    // }
    // return musicList;

    final List<MusicEntity> musicList = [
      MusicEntity(
        id: '1',
        name: 'name',
        url: 'url',
        localPath: 'localPath',
        fileHash: 'fileHash',
        isFavorite: 'isFavorite',
        album: AlbumEntity(
          id: '1',
          name: 'name',
          url: 'url',
          localPath: 'localPath',
          description: 'description',
        ),
        singers: [
          SingerEntity(
            id: '1',
            name: 'name',
            url: 'url',
            localPath: 'localPath',
            description: 'description',
          ),
        ],
        lyric: LyricEntity(
          id: '1',
          name: 'name',
          localPath: 'localPath',
          hash: 'hash',
        ),
      ),
    ];

    return musicList;
  }

  static Future<SharedPreferences> getPrefs() async {
    if (_prefs != null) {
      return _prefs!;
    }
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }
}

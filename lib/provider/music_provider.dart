import 'package:flutter/material.dart';
import 'package:music_app/storage/music_entity.dart';

import 'music_page_list_item.dart';

class MusicProvider with ChangeNotifier {
  List<MusicEntity> _musicList = [];

  List<MusicEntity> get musicList => _musicList;

  List<MusicPageListItem> get musicPageListItems => _musicList
      .map((music) => MusicPageListItem.fromMusicEntity(music))
      .toList();

  void refresh(List<MusicEntity> newMusicList) {
    _musicList = newMusicList;
    notifyListeners();
  }
}

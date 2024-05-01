import 'package:flutter/material.dart';
import 'package:music_app/constant/token.dart';
import 'package:music_app/provider/music_page_list_item.dart';

import 'music_action.dart';

class MusicList extends StatelessWidget {
  final List<MusicPageListItem> musicList;

  const MusicList({super.key, required this.musicList});

  void handleListItemMoreClick(context, MusicPageListItem selectedMusic) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return MusicAction(
          id: selectedMusic.id,
          musicName: selectedMusic.name,
          singerName: selectedMusic.singersName,
          albumName: selectedMusic.albumName,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Token.lightBackgroundColor),
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        itemCount: musicList.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Text(
                (index + 1).toString(),
                style: const TextStyle(
                  color: Token.contrastFontColor,
                  fontSize: Token.largerFontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        musicList[index].name,
                        style: const TextStyle(
                          color: Token.contrastFontColor,
                          fontSize: Token.titleFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${musicList[index].singersName} - ${musicList[index].albumName}',
                        style: const TextStyle(
                          color: Token.contrastFontColor,
                          fontSize: Token.smallerFontSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  handleListItemMoreClick(context, musicList[index]);
                },
                icon: const Icon(Icons.more_vert),
              ),
            ],
          );
        },
      ),
    );
  }
}

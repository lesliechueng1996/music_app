import 'package:flutter/material.dart';
import 'package:music_app/constant/token.dart';

class MusicAction extends StatelessWidget {
  final String id;
  final String musicName;
  final String singerName;
  final String albumName;

  const MusicAction({
    super.key,
    required this.id,
    required this.musicName,
    required this.singerName,
    required this.albumName,
  });

  createListTile(
      {required String title,
      required IconData icon,
      Color color = Token.contrastFontColor}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: Token.normalFontSize,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        leading: Icon(
          icon,
          size: Token.normalIconSize,
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const FlutterLogo(
                  size: 60,
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        musicName,
                        style: const TextStyle(
                          fontSize: Token.titleFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        singerName,
                        style: const TextStyle(
                          fontSize: Token.smallerFontSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
        createListTile(
          title: '下一首播放',
          icon: Icons.playlist_play,
        ),
        createListTile(
          title: '收藏到歌单',
          icon: Icons.library_music,
        ),
        createListTile(
          title: '歌手: $singerName',
          icon: Icons.interpreter_mode_outlined,
        ),
        createListTile(
          title: '专辑: $albumName',
          icon: Icons.album_outlined,
        ),
        createListTile(
          title: '删除',
          icon: Icons.delete,
          color: Colors.redAccent,
        ),
      ],
    );
  }
}

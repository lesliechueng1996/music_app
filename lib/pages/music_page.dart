import 'package:flutter/material.dart';
import 'package:music_app/components/music_list.dart';
import 'package:music_app/constant/token.dart';
import 'package:music_app/provider/music_provider.dart';
import 'package:provider/provider.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    final musicList = context.read<MusicProvider>().musicPageListItems;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Token.contrastBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(Token.circleRadius),
              topRight: Radius.circular(Token.circleRadius),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
          child: Row(
            children: [
              Icon(
                Icons.play_circle,
                size: Token.normalIconSize,
                color: Token.primaryBackgroundColor,
              ),
              const SizedBox(width: 10),
              const Text(
                '播放全部',
                style: TextStyle(
                  fontSize: Token.normalFontSize,
                  color: Token.contrastFontColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.sync,
                size: Token.normalIconSize,
                color: Token.middleFontColor,
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.checklist,
                size: Token.normalIconSize,
                color: Token.middleFontColor,
              ),
            ],
          ),
        ),
        Flexible(
          child: MusicList(musicList: musicList),
        ),
      ],
    );
  }
}

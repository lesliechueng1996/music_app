import 'package:flutter/material.dart';
import 'package:music_app/constant/token.dart';
import 'package:music_app/pages/music_list_page.dart';
import 'package:music_app/pages/music_page.dart';
import 'package:music_app/pages/my_page.dart';
import 'package:music_app/provider/music_provider.dart';
import 'package:music_app/storage/storage_util.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();

  bool isSearching = false;
  int currentIndex = 0;

  openSearchBar() {
    setState(() {
      isSearching = true;
    });
  }

  closeSearchBar() {
    setState(() {
      isSearching = false;
    });
  }

  changeCurrentIndex(newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  Text? appBarTitle() => !isSearching
      ? const Text(
          '全部歌曲',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: Token.titleFontSize,
          ),
        )
      : null;

  Widget appBarSearchInput() {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
        child: TextField(
          maxLines: 1,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Token.primaryFontColor,
              size: Token.smallerIconSize,
            ),
            hintText: '搜索歌曲',
            hintStyle: const TextStyle(
              color: Token.primaryFontColor,
              fontSize: Token.normalFontSize,
            ),
            filled: true,
            fillColor: Token.secondaryBackgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Token.circleRadius),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 6),
          ),
          cursorColor: Token.primaryFontColor,
          style: const TextStyle(
            color: Token.primaryFontColor,
            fontSize: Token.normalFontSize,
          ),
        ),
      ),
    );
  }

  List<Widget> appBarActions() {
    if (isSearching) {
      return [
        appBarSearchInput(),
        TextButton(
          onPressed: closeSearchBar,
          child: const Text(
            '取消',
            style: TextStyle(
              color: Token.primaryFontColor,
              fontSize: Token.normalFontSize,
            ),
          ),
        ),
      ];
    }
    return [
      IconButton(
        icon: const Icon(
          Icons.search,
          color: Token.primaryFontColor,
          size: Token.normalIconSize,
        ),
        onPressed: openSearchBar,
      ),
      IconButton(
        icon: const Icon(
          Icons.more_vert,
          color: Token.primaryFontColor,
          size: Token.normalIconSize,
        ),
        onPressed: () {},
      ),
    ];
  }

  NavigationDestination generateNavigationDestination(
      IconData icon, String label, int index) {
    return NavigationDestination(
      icon: Icon(
        icon,
        color: index == currentIndex ? Token.primaryFontColor : null,
        size: Token.smallerIconSize,
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Token.primaryBackgroundColor,
      appBar: AppBar(
        backgroundColor: Token.primaryBackgroundColor,
        title: appBarTitle(),
        actions: appBarActions(),
      ),
      body: PageView(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        onPageChanged: changeCurrentIndex,
        children: const [
          MusicPage(),
          MusicListPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          generateNavigationDestination(Icons.headphones, '歌曲', 0),
          generateNavigationDestination(Icons.queue_music, '歌单', 1),
          generateNavigationDestination(Icons.face, '我的', 2),
        ],
        selectedIndex: currentIndex,
        indicatorColor: Token.primaryBackgroundColor,
        onDestinationSelected: changeCurrentIndex,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    StorageUtil.getMusicList().then((allMusics) {
      context.read<MusicProvider>().refresh(allMusics);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:spotify/data/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/spotify_logo.jpg',
              height: 55.0,
              filterQuality: FilterQuality.high,
            ),
          ),
          const _SideMenuItem(icon: Icons.home, title: 'Home'),
          const _SideMenuItem(icon: Icons.search, title: 'Search'),
          const _SideMenuItem(icon: Icons.audiotrack, title: 'Radio'),
          _LibraryPlaylist(),
        ],
      ),
    );
  }
}

class _SideMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _SideMenuItem({required this.icon, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
        size: 28.0,
      ),
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}

class _LibraryPlaylist extends StatefulWidget {
  _LibraryPlaylist({Key? key}) : super(key: key);

  @override
  State<_LibraryPlaylist> createState() => _LibraryPlaylistState();
}

class _LibraryPlaylistState extends State<_LibraryPlaylist> {
  ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        controller: _scrollController,
        isAlwaysShown: false,
        child: ListView(
          controller: _scrollController,
          children: const [
            _Playlist(title: 'YOUR LIBRARY', dataList: yourLibrary),
            _Playlist(title: 'PLAYLISTS', dataList: playlists),
          ],
        ),
      ),
    );
  }
}

class _Playlist extends StatelessWidget {
  final String title;
  final List<String> dataList;

  const _Playlist({required this.title, required this.dataList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        ...dataList.map((message) => ListTile(
              title: Text(
                message,
                style: Theme.of(context).textTheme.bodyText2,
                overflow: TextOverflow.ellipsis,
              ),
            )),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spotify/data/data.dart';
import 'package:spotify/widgets/playlist_header.dart';
import 'package:spotify/widgets/tracks_list.dart';

class PlaylistW extends StatefulWidget {
  final Playlist playlist;

  const PlaylistW({required this.playlist, Key? key}) : super(key: key);

  @override
  _PlaylistState createState() => _PlaylistState(playlist: playlist);
}

class _PlaylistState extends State<PlaylistW> {
  ScrollController? _scrollController;
  final Playlist playlist;

  _PlaylistState({required this.playlist});

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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140.0,
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(
              primary: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {},
            icon: const Icon(Icons.account_circle_outlined , size: 30.0,),
            label: const Text('My account'),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 30.0,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              _ChevronButton(icon: Icons.chevron_left),
              SizedBox(
                width: 20,
              ),
              _ChevronButton(icon: Icons.chevron_right),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFAF1010),
              Theme.of(context).backgroundColor,
            ],
            stops: const [
              0.0,
              0.3,
            ],
          ),
        ),
        child: Scrollbar(
          isAlwaysShown: false,
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 60.0,
            ),
            children: [
              PlayListHeader(
                playlist: playlist,
              ),
              TrackList(
                listSong: playlist.songs,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChevronButton extends StatelessWidget {
  final IconData icon;

  const _ChevronButton({required this.icon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      child: Container(
        padding: const EdgeInsets.all(6.0),
        decoration: const BoxDecoration(
          color: Colors.black54,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 28,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}

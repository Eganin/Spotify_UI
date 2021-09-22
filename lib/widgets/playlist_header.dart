import 'package:flutter/material.dart';
import 'package:spotify/data/data.dart';

class PlayListHeader extends StatelessWidget {
  final Playlist playlist;

  const PlayListHeader({required this.playlist, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              'assets/lofigirl.jpg',
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              height: 200,
              width: 200,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PLAYLIST',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    playlist.name,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    playlist.description,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Created by ${playlist.creator} - ${playlist.songs.length} songs , ${playlist.duration}',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        _PlaylistButtons(
          countFollowers: playlist.followers,
        ),
      ],
    );
  }
}

class _PlaylistButtons extends StatelessWidget {
  final String countFollowers;

  const _PlaylistButtons({required this.countFollowers, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text('PLAY'),
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.bodyText2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            primary: Theme.of(context).iconTheme.color,
            backgroundColor: Theme.of(context).accentColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 48.0,
              vertical: 20.0,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border,
            size: 30.0,
          ),
          color: Theme.of(context).iconTheme.color,
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz,
            size: 30.0,
          ),
          color: Theme.of(context).iconTheme.color,
        ),
        const Spacer(),
        Text(
          'FOLLOWERS\n$countFollowers',
          style: Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}

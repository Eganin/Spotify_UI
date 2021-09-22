import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:spotify/models/current_track.dart';

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      color: Colors.black87,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            _TrackInfo(),
            const Spacer(),
            _TrackControls(),
            const Spacer(),
            _MoreControls(),
          ],
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  const _TrackInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedTrack = context.watch<CurrentTrackModel>().selectedTrack;
    return selectedTrack == null
        ? const SizedBox.shrink()
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/lofigirl.jpg',
                fit: BoxFit.cover,
                width: 75,
                height: 75,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedTrack.title,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    selectedTrack.album,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    size: 30.0,
                    color: Theme.of(context).iconTheme.color,
                  )),
            ],
          );
  }
}

class _TrackControls extends StatelessWidget {
  const _TrackControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedSong = context.watch<CurrentTrackModel>().selectedTrack;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shuffle),
              iconSize: 20.0,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.skip_previous_outlined),
              iconSize: 20.0,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.play_circle_outline),
              iconSize: 34.0,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.skip_next_outlined),
              iconSize: 20.0,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.repeat),
              iconSize: 20.0,
            ),
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          children: [
            Text(
              '0:00',
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              height: 5,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            selectedSong == null
                ? Text(
                    '0:00',
                    style: Theme.of(context).textTheme.caption,
                  )
                : Text(
                    selectedSong.duration,
                    style: Theme.of(context).textTheme.caption,
                  ),
          ],
        ),
      ],
    );
  }
}

class _MoreControls extends StatelessWidget {
  const _MoreControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.devices_outlined),
          iconSize: 20.0,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.volume_up_outlined),
        ),
        Container(
          height: 5,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(2.5),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.fullscreen_outlined),
          iconSize: 20.0,
        )
      ],
    );
  }
}

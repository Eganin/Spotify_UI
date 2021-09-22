import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:spotify/data/data.dart';
import 'package:spotify/models/current_track.dart';

class TrackList extends StatelessWidget {
  final List<Song> listSong;

  const TrackList({required this.listSong, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle:
          Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
      dataRowHeight: 56.0,
      showCheckboxColumn: false,
      columns: const [
        DataColumn(
          label: Text('TITLE'),
        ),
        DataColumn(
          label: Text('ARTIST'),
        ),
        DataColumn(
          label: Text('ALBUM'),
        ),
        DataColumn(
          label: Icon(Icons.access_time),
        ),
      ],
      rows: listSong.map((song) {
        final selectedSong =
            context.watch<CurrentTrackModel>().selectedTrack?.id == song.id;

        final styleSelectedSong = TextStyle(
          color: selectedSong
              ? Theme.of(context).accentColor
              : Theme.of(context).iconTheme.color,
        );
        return DataRow(
          cells: [
            DataCell(
              Text(
                song.title,
                style: styleSelectedSong,
              ),
            ),
            DataCell(
              Text(
                song.artist,
                style: styleSelectedSong,
              ),
            ),
            DataCell(
              Text(
                song.album,
                style: styleSelectedSong,
              ),
            ),
            DataCell(
              Text(
                song.duration,
                style: styleSelectedSong,
              ),
            ),
          ],
          selected: selectedSong,
          onSelectChanged: (_) => context.read<CurrentTrackModel>().selectTrack(
                track: song,
              ),
        );
      }).toList(),
    );
  }
}

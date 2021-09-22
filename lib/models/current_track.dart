import 'package:flutter/material.dart';
import 'package:spotify/data/data.dart';

class CurrentTrackModel extends ChangeNotifier{
  Song? selectedTrack;

  void selectTrack({required Song track}){
    selectedTrack = track;
    notifyListeners();
  }
}
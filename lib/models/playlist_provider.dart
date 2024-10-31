import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  //PLAYLIST OF SONGS

  final List<Song> _playlist = [
    //SONG 1
    Song(
      songName: 'Done for',
      artistName: 'Bruno Mars',
      albumArtImagePath: 'assets/images/1.jpg',
      audioPath: 'audio/audio.mp3',
    ),

    //SONG 2
    Song(
      songName: 'Chills',
      artistName: 'Doja Cat',
      albumArtImagePath: 'assets/images/2.jpg',
      audioPath: 'audio/audio.mp3',
    ),

    //SONG 3
    Song(
      songName: 'Calm',
      artistName: 'Tanny',
      albumArtImagePath: 'assets/images/3.jpg',
      audioPath: 'audio/audio.mp3',
    ),
  ];

  //CURRENT SONG PLAYING
  int? _currentSongIndex;

  //Getters to fetch

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  //Setters
  set currentSongIndex(int? newIndex) {
    //Update the current song index
    _currentSongIndex = newIndex;

    //Updating the UI
    notifyListeners();
  }
}

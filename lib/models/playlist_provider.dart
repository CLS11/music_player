import 'package:audioplayers/audioplayers.dart';
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

  //Audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  //Playing duration
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //Constructor
  PlaylistProvider() {
    listenToDuration();
  }

  //Check if the song is playing
  bool _isPlaying = false;

  //Play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  //Pause the song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //Resume the song
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //Pause or resume since the button is same
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  //Go to the specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  //Play the next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        currentSongIndex = 0;
      }
    }
  }

  //Play the previous song
  void playPreviousSong() async {
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        currentSongIndex = playlist.length - 1;
      }
    }
  }

  //Listening Duration
  void listenToDuration() {
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  //Getters to fetch

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  //Setters
  set currentSongIndex(int? newIndex) {
    //Update the current song index
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play();
    }

    //Updating the UI
    notifyListeners();
  }
}

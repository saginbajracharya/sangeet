import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:audio_manager/audio_manager.dart';

class MusicController extends ControllerMVC {
  GlobalKey<ScaffoldState> scaffoldKey;
  List<SongInfo> musics = <SongInfo>[];
  List<PlaylistInfo> playlist = <PlaylistInfo>[];
  AudioManager audioManagerInstance = AudioManager.instance;
  var slider;
  var isPlaying;

  MusicController() {
    scaffoldKey = new GlobalKey<ScaffoldState>();
    isPlaying = audioManagerInstance.isPlaying;
  }

  allMusic() async {
    musics = [];
    final List<SongInfo> playlist = await FlutterAudioQuery().getSongs(sortType: SongSortType.DISPLAY_NAME);
    playlist.forEach((value) {
      setState(() {
        musics.add(value);
      });
    });
  }

  void setupAudio() {
    audioManagerInstance.onEvents((events, args) {
      switch (events) {
        case AudioManagerEvents.start:
          slider = 0;
          break;
        case AudioManagerEvents.seekComplete:
          slider = audioManagerInstance.position.inMilliseconds / audioManagerInstance.duration.inMilliseconds;
          setState(() {});
          break;
        case AudioManagerEvents.playstatus:
          isPlaying = audioManagerInstance.isPlaying;
          setState(() {});
          break;
        case AudioManagerEvents.timeupdate:
          slider = audioManagerInstance.position.inMilliseconds / audioManagerInstance.duration.inMilliseconds;
          audioManagerInstance.updateLrc(args["position"].toString());
          setState(() {});
          break;
        case AudioManagerEvents.ended:
          audioManagerInstance.next();
          setState(() {});
          break;
        default:
          break;
      }
    });
  }
  
  String formatDuration(Duration d) {
    if (d == null) return "--:--";
    int minute = d.inMinutes;
    int second = (d.inSeconds > 60) ? (d.inSeconds % 60) : d.inSeconds;
    String format = ((minute < 10) ? "0$minute" : "$minute") +
        ":" +
        ((second < 10) ? "0$second" : "$second");
    return format;
  }

}
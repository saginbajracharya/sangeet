import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class MusicController extends ControllerMVC {
  List<SongInfo> musics = <SongInfo>[];
  List<PlaylistInfo> playlist = <PlaylistInfo>[];

  allMusic() async {
    musics = [];
    final List<SongInfo> playlist = await FlutterAudioQuery().getSongs(sortType: SongSortType.DISPLAY_NAME);
    playlist.forEach((value) {
      setState(() {
        musics.add(value);
      });
    });
  }
}
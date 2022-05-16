import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:sangeet/src/controller/musicController.dart';
import 'package:sangeet/src/widgets/sidebar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends StateMVC<HomePage> {
  MusicController _con;
  _HomePageState() : super(MusicController()) {
    _con = controller;
  }
  void initState() {
    super.initState();
    _con.setupAudio();
  }
  @override
  Widget build(BuildContext context) {
    // final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'Sangeet',
      debugShowCheckedModeBanner: false,
      // theme: themeNotifier.getTheme(),
      home: Scaffold(
        drawer: SideBar(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  Text(
                    _con.formatDuration(_con.audioManagerInstance.position),
                    style: TextStyle(color: Colors.black),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 2,
                            thumbColor: Colors.blueAccent,
                            overlayColor: Colors.blue,
                            thumbShape: RoundSliderThumbShape(
                              disabledThumbRadius: 5,
                              enabledThumbRadius: 5,
                            ),
                            overlayShape: RoundSliderOverlayShape(
                              overlayRadius: 10,
                            ),
                            activeTrackColor: Colors.blueAccent,
                            inactiveTrackColor: Colors.grey,
                          ),
                          child: Slider(
                            value: _con.slider ?? 0,
                            onChanged: (value) {
                              setState(() {
                                _con.slider = value;
                              });
                            },
                            onChangeEnd: (value) {
                              if (_con.audioManagerInstance.duration != null) {
                                Duration msec = Duration(
                                    milliseconds:
                                    (_con.audioManagerInstance.duration.inMilliseconds *
                                        value)
                                        .round());
                                _con.audioManagerInstance.seekTo(msec);
                              }
                            },
                          )),
                    ),
                  ),
                  Text(
                    _con.formatDuration(_con.audioManagerInstance.duration),
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                    child: Center(
                      child: IconButton(
                          icon: Icon(
                            Icons.skip_previous,
                            color: Colors.white,
                          ),
                          onPressed: () => _con.audioManagerInstance.previous()
                      ),
                    ),
                    backgroundColor: Colors.black87,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black87,
                    radius: 30,
                    child: Center(
                      child: IconButton(
                        onPressed: () async {
                          if(_con.audioManagerInstance.isPlaying)
                          _con.audioManagerInstance.toPause();
                          _con.audioManagerInstance.playOrPause();
                        },
                        padding: const EdgeInsets.all(0.0),
                        icon: Icon(
                          _con.audioManagerInstance.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black87,
                    child: Center(
                      child: IconButton(
                          icon: Icon(
                            Icons.skip_next,
                            color: Colors.white,
                          ),
                          onPressed: () => _con.audioManagerInstance.next()
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),// This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
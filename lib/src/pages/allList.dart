import 'package:flutter/material.dart';
import 'package:sangeet/src/controller/musicController.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class AllList extends StatefulWidget {
  @override
  _AllListState createState() => _AllListState();
}

class _AllListState extends StateMVC<AllList> {
  MusicController _con;
  _AllListState() : super(MusicController()) {
    _con = controller;
  }

  @override
  void initState() {
    super.initState();
    _con.allMusic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('All Music'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Expanded(
              child : _con.musics.length < 0
                    ? Center(child: Text('No songs to show'))
                    : ListView.builder(
                      itemCount: _con.musics.length,
                      itemBuilder: (context, index){
                        return Container(
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.white, width: 1)),
                          ),
                          child: ListTile(
                            leading: ClipRRect(
                              child: Image(
                                height: 90,
                                width: 50,
                                fit: BoxFit.cover,
                                image : _con.musics[index].albumArtwork != null 
                                      ? _con.musics[index].albumArtwork
                                      : ExactAssetImage('assets/img/MusicNote.png')
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            title : _con.musics[index].title != ''
                                  ? Text(_con.musics[index].title, style:TextStyle(fontSize: 14.0))
                                  : Text(_con.musics[index].displayName, style:TextStyle(fontSize: 14.0)),
                            subtitle: _con.musics[index].artist != '<unknown>' 
                                    ? Text(_con.musics[index].artist, style:TextStyle(fontSize: 10.0))
                                    : Text(' '),
                            onTap: () {
                              print('Now Playing');
                            }
                          ),
                        );
                      },
                    )
            )
          ],
        ),
      ),
    );
  }

}
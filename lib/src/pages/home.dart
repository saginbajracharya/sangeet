import 'package:flutter/material.dart';
import 'package:sangeet/src/widgets/sidebar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
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
                          onPressed: () => print('Previous')
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
                          print('Play / Pause');
                        },
                        padding: const EdgeInsets.all(0.0),
                        icon: Icon(
                          Icons.play_arrow,
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
                          onPressed: () => print('Next')
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
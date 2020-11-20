import 'package:flutter/material.dart';
import 'package:sangeet/src/pages/allList.dart';
import 'package:sangeet/src/widgets/themeSwitch.dart';

class SideBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('', style: TextStyle(color: Colors.white, fontSize: 25)),
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: NetworkImage('https://media3.s-nbcnews.com/j/newscms/2019_41/3047866/191010-japan-stalker-mc-1121_06b4c20bbf96a51dc8663f334404a899.fit-760w.JPG'),
              )
            ),
          ),
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text('All Music'),
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => AllList()
                ),
              );
            }
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings_display),
            title: ThemeSwitch(),
          ),
        ],
      ),
    );
  }
}
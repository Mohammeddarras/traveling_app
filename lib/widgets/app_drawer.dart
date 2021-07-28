import 'package:flutter/material.dart';
import 'package:traveling_app/screens/filter_screen.dart';
import 'package:traveling_app/screens/tabs_screen.dart';

class appDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            child: Text('دليلك السياحي',
                style: Theme.of(context).textTheme.headline5),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(Icons.card_travel, 'التصنيفات', () {
            Navigator.of(context).pushReplacementNamed(tabsScreen.id);
          }),
          buildListTile(Icons.filter_list, 'الفلترة', () {
            Navigator.of(context).pushReplacementNamed(filterScreen.id);
          }),
        ],
      ),
    );
  }
}

Widget buildListTile(IconData icon, String title, Function onTapLink) {
  return ListTile(
    leading: Icon(
      icon,
      color: Colors.blue,
      size: 30,
    ),
    title: Text(
      title,
      style: TextStyle(
        fontFamily: 'ElMessiri',
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    ),
    onTap: onTapLink,
  );
}

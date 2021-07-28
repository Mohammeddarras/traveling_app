import 'package:flutter/material.dart';
import 'package:traveling_app/models/trips.dart';
import 'package:traveling_app/screens/categories_screen.dart';
import 'package:traveling_app/screens/favorites_screen.dart';
import 'package:traveling_app/widgets/app_drawer.dart';

class tabsScreen extends StatefulWidget {

  static const String id = 'tabsScreen';

  final List<Trip> favoriteTrips;

  tabsScreen(this.favoriteTrips);

  @override
  _tabsScreenState createState() => _tabsScreenState();
}

class _tabsScreenState extends State<tabsScreen> {

  void _selectScreen(int index){
    setState(() {
      _selectScreenIndex = index;
    });
  }

  int _selectScreenIndex = 0;

  List<Map<String,Object>> _screen;

  @override
  void initState() {
    _screen = [
      {
        'screen' : categoriesScreen(),
        'title' : 'تصنيفات الرحلات',
      },
      {
        'screen' : FavoritesScreen(widget.favoriteTrips),
        'title' : 'الرحلات المفضلة',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screen[_selectScreenIndex]['title']),
        centerTitle: true,
      ),
      drawer: appDrawer(),
      body: _screen[_selectScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectScreenIndex,
        onTap: _selectScreen,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}

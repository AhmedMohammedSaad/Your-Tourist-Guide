import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../scrense/fivorert_screen.dart';
import '../scrense/carogares_screns.dart';

class tapeScreen extends StatefulWidget {
  const tapeScreen({super.key});

  @override
  State<tapeScreen> createState() => _tapState();
}

class _tapState extends State<tapeScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectScreenIndex = index;
    });
  }

  int _selectScreenIndex = 0;
  final List<Widget> _Screen = [
    CatogarseScrene(),
    favoritScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: <Widget>[
          Icon(Icons.notification_add),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
          child: Text(
            "دليلك السياحي  ",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
      body: _Screen[_selectScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Color.fromARGB(255, 162, 11, 193),
        unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        currentIndex: _selectScreenIndex,
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

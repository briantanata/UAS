import 'package:dsc/dashboard/favoriteFilm.dart';
import 'package:dsc/profile/profile.dart';
import 'trend.dart';
import 'tv.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentindex = 0;
  final screens = [
    TrendScreen(),
    FavoriteScreen(),
    TrendingScreen(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: Center(
          child: Text(
            "XXI",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent[100],
      ),
      body: IndexedStack(
        index: _currentindex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: "Trending Movies"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Favorite Movies"),
          // BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Movie'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), label: 'Trending on TV'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
        onTap: (value) {
          setState(() {
            _currentindex = value;
          });
        },
      ),
    );
  }
}

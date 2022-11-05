import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'package:food_recipes/widgets/main_drawer.dart';
import './categories_screen.dart';
import './favourties_screen.dart';
import '../widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;

  TabScreen(this.favoriteMeal);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      const {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavouritesScreen(widget.favoriteMeal), 'title': 'Favorites'},
    ];
    super.initState();
  }

  int _selectedIndex = 0;

  _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedIndex]['title'] as String,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: const Color.fromARGB(255, 253, 243, 191),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color.fromARGB(255, 135, 93, 78),
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}

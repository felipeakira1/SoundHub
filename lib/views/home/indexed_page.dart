import 'package:flutter/material.dart';
import 'package:soundhub/widgets/app_bars.dart';
import 'package:soundhub/widgets/custom_indexed_stack.dart';
import 'package:soundhub/widgets/custom_bottom_navigation_bar.dart';
import 'package:soundhub/widgets/drawer.dart'; // Importe o CustomBottomNavigationBar

class IndexedPage extends StatefulWidget {
  @override
  _IndexedPageState createState() => _IndexedPageState();
}

class _IndexedPageState extends State<IndexedPage> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: HomePageAppBar(),
      body: CustomIndexedStack(currentIndex: _currentIndex),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}

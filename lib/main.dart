import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nytflutter/pages/stories_page_recycle_view.dart';

Future<void> main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  static final List<String> _categories = [
    'home',
    'arts',
    'technology',
    'science',
    'world'
  ];

  static final List<Widget> _pages = _categories.map(
    (category) {
      return StoriesPageRecycleView(category: category);
    },
  ).toList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NYTimes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body:  ,
//        body: _pages[_currentIndex],
        bottomNavigationBar: FFNavigationBar(
          theme: FFNavigationBarTheme(
            barBackgroundColor: Colors.white,
            selectedItemBorderColor: Colors.black,
            selectedItemBackgroundColor: Colors.white,
            selectedItemIconColor: Colors.black,
            selectedItemLabelColor: Colors.black,
          ),
          selectedIndex: _currentIndex,
          onSelectTab: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            FFNavigationBarItem(
              iconData: Icons.home,
              label: 'Home',
            ),
            FFNavigationBarItem(
              iconData: Icons.memory,
              label: 'Arts',
            ),
            FFNavigationBarItem(
              iconData: Icons.network_check,
              label: 'Technology',
            ),
            FFNavigationBarItem(
              iconData: Icons.public,
              label: 'Science',
            ),
            FFNavigationBarItem(
              iconData: Icons.color_lens,
              label: 'World',
            ),
          ],
        ),
      ),
    );
  }
}

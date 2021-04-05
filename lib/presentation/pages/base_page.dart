import 'package:flutter/material.dart';
import 'package:flutter_bloc_movie/presentation/pages/home_page.dart';
import 'package:flutter_bloc_movie/presentation/pages/pages.dart';

class BasePage extends StatefulWidget {
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int currentPages = 0;

  List<Widget> listBody = [
    NamePage(),
    HomePage(title: "Pagging"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listBody[currentPages],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentPages = value;
          });
        },
        currentIndex: currentPages,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Shop"),
        ],
      ),
    );
  }
}

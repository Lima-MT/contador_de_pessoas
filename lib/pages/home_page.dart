import 'package:contador_de_numeros/components/my_drawer.dart';
import 'package:contador_de_numeros/pages/card_page.dart';
import 'package:contador_de_numeros/pages/page2.dart';
import 'package:contador_de_numeros/pages/page3.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
        ),
        drawer: MyDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                scrollDirection: Axis.horizontal,
                children: [CardPage(), Page2(), Page3()],
              ),
            ),
            BottomNavigationBar(
              onTap: (value) => pageController.jumpToPage(value),
              currentIndex: currentIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'ABC'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.place),
                  label: 'Place',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

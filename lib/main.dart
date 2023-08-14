import 'dart:ffi';

import 'package:bnb_crowywise_sample/pages/fifth_page.dart';
import 'package:bnb_crowywise_sample/pages/fourth_page.dart';
import 'package:bnb_crowywise_sample/pages/home_page.dart';
import 'package:bnb_crowywise_sample/pages/second_page.dart';
import 'package:bnb_crowywise_sample/pages/third_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SampleApp());
}

class SampleApp extends StatelessWidget {
  const SampleApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bnb Crowywise Sample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 29, 81, 186)),

        ///use SplashColor to change the splash color, including that of the bottom navigation bar
        splashColor: const Color.fromARGB(255, 186, 211, 231),
        useMaterial3: true,
      ),
      home: const BnbSample(),
    );
  }
}

class BnbSample extends StatefulWidget {
  const BnbSample({super.key});

  @override
  State<BnbSample> createState() => _BnbSampleState();
}

class _BnbSampleState extends State<BnbSample> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = <Widget>[
      MyHomePage(title: "First page"),
      SecondPage(),
      ThirdPage(),
      FourthPage(),
      FifthPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bnb Crowywise Sample'),
      ),
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: customBNB(context),
      //  BottomNavigationBar(

      //   currentIndex: _selectedIndex,
      //   elevation: 4,
      //   iconSize: 30,
      //   selectedFontSize: 13,
      //   unselectedFontSize: 13,
      //   selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      //   selectedItemColor: Colors.blue,
      //   unselectedItemColor: Colors.grey,
      //   showSelectedLabels: true,

      //   showUnselectedLabels: true,
      //   type: BottomNavigationBarType.fixed,
      //   onTap: _onItemTapped,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.stacked_bar_chart_sharp),
      //       label: 'Save',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.terrain_rounded),
      //       label: 'Invest',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.explore),
      //       label: 'Explore',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.book),
      //       label: 'Stash',
      //     )
      //   ],
      //),
    );
  }

  Container customBNB(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.5, color: Colors.grey),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          customElevatedButton("Home", Icons.home, 0),
          customElevatedButton("Save", Icons.stacked_bar_chart_sharp, 1),
          customElevatedButton("Invest", Icons.terrain_rounded, 2),
          customElevatedButton("Explore", Icons.explore, 3),
          customElevatedButton("Stash", Icons.book, 4),
        ],
      ),
    );

    // void _onItemTapped(int index) {
    //   setState(() {
    //     _selectedIndex = index;
    //   });
    // }
  }

  Widget customElevatedButton(
    String buttonName,
    IconData icon,
    int index, {
    double iconSize = 30,
    Color selectedBNBColor = Colors.blue,
    Color unselectedBNBColor = Colors.grey,
    double fontSize = 13,
  }) {
    return ElevatedButton(
      clipBehavior: Clip.antiAlias,
      style: ButtonStyle(
        animationDuration: const Duration(microseconds: 10000),
        splashFactory: InkSplash.splashFactory,
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.fromLTRB(0, 0, 0, 0)),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        enableFeedback: false,
        elevation: MaterialStateProperty.all<double>(0),
        shadowColor:MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
           const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(20), right: Radius.circular(20)),
          ),
        ),
      ),
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: _selectedIndex == index
              ? Icon(
                  icon,
                  color: selectedBNBColor,
                  size: iconSize,
                )
              : Icon(
                  icon,
                  color: unselectedBNBColor,
                  size: iconSize,
                ),
        ),
        Text(buttonName,
        style: TextStyle(
          fontWeight:  _selectedIndex == index ? FontWeight.bold: FontWeight.normal,
          fontSize: fontSize,
          color: _selectedIndex == index ? selectedBNBColor: unselectedBNBColor,
        ),
        )
      ]),
    );
  }
}

import 'package:coloncancer/contactus.dart';
import 'package:coloncancer/help.dart';
import 'package:coloncancer/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

int index = 0;

List screens = const [
  HomeScreen(),
  Help(),
  ContactUs(),
];

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer:  Drawer(
            backgroundColor: HexColor('#14455B'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 100,),
                Text('data')
              ],
            ),
            elevation: 20,
          ),
          appBar: AppBar(
            backgroundColor: HexColor('#14455B'),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  child: const Text(
                    'HOME',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )),
              const SizedBox(
                width: 60,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child:  Text(
                    'technology'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )),
              const SizedBox(
                width: 60,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      index = 2;
                    });
                  },
                  child: const Text(
                    'Contact us ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )),
              const SizedBox(
                width: 60,
              ),
            ],
          ),
          body: screens[index],
        ),
      ),
    );
  }
}

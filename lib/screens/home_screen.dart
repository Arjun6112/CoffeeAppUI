// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_coffee_app/utils/coffee_type.dart';
import 'package:flutter_coffee_app/utils/coffee_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeTypes = [
    ['Cappuccino', true],
    ['Latte', false],
    ['Mocha', false],
    ['Americano', false],
    ['Flat White', false]
  ];

  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeTypes.length; i++) {
        coffeTypes[i][1] = false;
      }
      coffeTypes[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,

        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best Coffee for you",
              style: GoogleFonts.bebasNeue(fontSize: 60),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Find your coffee ...",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600))),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeTypes.length,
                  itemBuilder: (context, index) {
                    return CoffeeType(
                        coffeeType: coffeTypes[index][0],
                        onTap: () {
                          coffeeTypeSelected(index);
                        },
                        isSelected: coffeTypes[index][1]);
                  })),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(
                  coffeImagePath: "assets/images/latte.jpg",
                  coffeeName: "Latte",
                  coffeePrice: 5),
              CoffeeTile(
                  coffeImagePath: "assets/images/black.jpg",
                  coffeeName: "Americano",
                  coffeePrice: 5),
              CoffeeTile(
                  coffeImagePath: "assets/images/capp.jpg",
                  coffeeName: "Cappucino",
                  coffeePrice: 6),
              CoffeeTile(
                  coffeImagePath: "assets/images/espresso.jpg",
                  coffeeName: "Espresso",
                  coffeePrice: 2),
              CoffeeTile(
                  coffeImagePath: "assets/images/iced.jpg",
                  coffeeName: "Iced Latte",
                  coffeePrice: 3),
            ],
          ))
        ],
      ),
    );
  }
}

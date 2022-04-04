import 'package:culchr/Screens/interests/Cards.dart';
import 'package:flutter/material.dart';

class Interest extends StatefulWidget {
  const Interest({Key? key}) : super(key: key);

  @override
  State<Interest> createState() => _InterestState();
}

class _InterestState extends State<Interest> {
  List fun = [
    {'title': 'Movies', 'image': 'images/movie.svg'},
    {'title': 'Festival', 'image': 'images/festival.svg'},
    {'title': 'Food', 'image': 'images/food.svg'},
    {'title': 'Music', 'image': 'images/food.svg'},
    {'title': 'Theater', 'image': 'images/food.svg'},
    {'title': 'Sport', 'image': 'images/food.svg'},
    {'title': 'Game', 'image': 'images/food.svg'},
    {'title': 'Touring', 'image': 'images/food.svg'},
    {'title': 'Party', 'image': 'images/food.svg'},
    {'title': 'Beach', 'image': 'images/food.svg'},
    {'title': 'culture', 'image': 'images/food.svg'},
    {'title': 'Camping', 'image': 'images/food.svg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Padding(
            padding: EdgeInsets.all(28.0),
            child: Text(
              "What are you interested in ?",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 23,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 3,
            children: List.generate(
              fun.length,
              (index) => GridCard(
                imageSrc: fun[index]['image'],
                title: fun[index]['title'],
              ),
            ),
          ),
        ),

        // grid of containers
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(300, 60),
          padding: const EdgeInsets.all(16),
          primary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/home');
        },
        child: const Text(
          "Finish",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

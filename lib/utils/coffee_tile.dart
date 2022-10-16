import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String coffeImagePath;
  final String coffeeName;
  final int coffeePrice;
  const CoffeeTile({
    Key? key,
    required this.coffeImagePath,
    required this.coffeeName,
    required this.coffeePrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.black54),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(coffeImagePath)),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coffeeName,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 5),
                Text(
                  "With Oat Milk",
                  style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$ $coffeePrice"),
                InkWell(
                  child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(12)),
                      child: Icon(Icons.add)),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

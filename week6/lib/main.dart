import 'package:flutter/material.dart';

class SelectCard extends StatefulWidget {
  const SelectCard({super.key});

  @override
  State<SelectCard> createState() => _CardSelected();
}

class _CardSelected extends State<SelectCard> {
  String text = "title";
  Color textColor = Colors.blue[400]!;
  String description = "description";
  Color color = Colors.grey;
  String fav = "dislike";

  void swapText() {
    setState(() {
      if (fav == "dislike") {
        fav = "like";
        color = Colors.red;
      } else {
        fav = "dislike";
        color = Colors.grey;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50),
      height: 100,
      decoration: BoxDecoration(
        border:Border.all(color: Colors.grey)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          ),),
          IconButton(
            onPressed: swapText,
            icon: Icon(
              Icons.favorite,
              color: color,
            ),
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: "Ex2",
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Favorite cards",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.blue[500],
      ),
      body: const Center(
        child:Column(
          children: [
            Center(child: SelectCard()),
            SizedBox(height: 10),
            Center(child: SelectCard()),
            SizedBox(height: 10),
            Center(child: SelectCard()),
          ],
        )
      ),
    ),
  ));
}

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: SingleChildScrollView(   // <-- MAKE PAGE SCROLLABLE
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green[700]!, Colors.greenAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CustomCard(subject: "Flutter"),
              SizedBox(height: 20),
              CustomCard(subject: "Dark"),
              SizedBox(height: 20),
              CustomCard(subject: "React"),
              SizedBox(height: 20),
              CustomCard(subject: "Smos"),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    ),
  ));
}

class CustomCard extends StatefulWidget {
  final String subject;

  const CustomCard({super.key, required this.subject});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  double width = 500;
  double length = 0;

  void increase() {
    setState(() {
      if (length < width) {
        length += width * 0.1;
      }
    });
  }

  void decrease() {
    setState(() {
      if (length > 0) {
        length -= width * 0.1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            "My Score in ${widget.subject}",
            style: TextStyle(fontSize: 40, color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                value: "decrease",
                onPressed: decrease,
                buttonColor: Colors.redAccent,
              ),
              CustomButton(
                value: "increase",
                onPressed: increase,
                buttonColor: Colors.greenAccent,
              ),
            ],
          ),
          SizedBox(height: 20),
          Stack(
            children: [
              Container(
                width: width,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                width: length,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String value;
  final VoidCallback onPressed;
  final Color buttonColor;

  const CustomButton({
    super.key,
    required this.value,
    required this.onPressed,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        value == "increase" ? "+" : "-",
        style: TextStyle(fontSize: 30, color: Colors.black),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SelectButton extends StatefulWidget {
  const SelectButton({super.key});

  @override
  State<SelectButton> createState() => _ButtonSelected();
}

class _ButtonSelected extends State<SelectButton> {
  String text = "Not Selected";
  Color bgcolor = Colors.blue[50]!;
  Color textColor = Colors.black;

  void swapText() {
    setState(() {
      if (text == "Not Selected") {
        text = "Selected"; // <-- use assignment =
        bgcolor = Colors.blue[500]!;
        textColor = Colors.white;
      } else {
        text = "Not Selected"; // <-- use assignment =
        bgcolor = Colors.blue[50]!;
        textColor = Colors.black;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          onPressed: swapText, // <-- call the swapText function
          style: ElevatedButton.styleFrom(
            backgroundColor: bgcolor, // set dynamic background color
          ),
          child: Center(
            child: Text(
              text, // <-- dynamic text
              style: TextStyle(color: textColor), // dynamic text color
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: "Ex1",
    home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: const Center(
        child:Column(
          children: [
            Center(child: SelectButton()),
            SizedBox(height: 10),
            Center(child: SelectButton()),
            SizedBox(height: 10),
            Center(child: SelectButton()),
          ],
        )
      ),
    ),
  ));
}

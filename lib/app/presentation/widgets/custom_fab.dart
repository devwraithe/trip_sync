import 'package:flutter/material.dart';

class CustomFAB extends StatefulWidget {
  final List<Icon> icons;
  final List<String> labels;
  final Function(int) onPressed;

  const CustomFAB({
    super.key,
    required this.icons,
    required this.labels,
    required this.onPressed,
  });

  @override
  State<CustomFAB> createState() => _CustomFABState();
}

class _CustomFABState extends State<CustomFAB> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (isOpen)
          Positioned(
            left: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                widget.onPressed(0);
                closeFAB();
              },
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    widget.icons[0],
                    SizedBox(width: 4),
                    Text(
                      widget.labels[0],
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (isOpen)
          Positioned(
            top: 0,
            child: GestureDetector(
              onTap: () {
                widget.onPressed(1);
                closeFAB();
              },
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    widget.icons[1],
                    SizedBox(width: 4),
                    Text(
                      widget.labels[1],
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (isOpen)
          Positioned(
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                widget.onPressed(2);
                closeFAB();
              },
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    widget.icons[2],
                    SizedBox(width: 4),
                    Text(
                      widget.labels[2],
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        FloatingActionButton(
          onPressed: toggleFAB,
          child: Icon(isOpen ? Icons.close : Icons.add),
        ),
      ],
    );
  }

  void toggleFAB() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  void closeFAB() {
    setState(() {
      isOpen = false;
    });
  }
}

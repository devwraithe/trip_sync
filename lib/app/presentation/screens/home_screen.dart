import 'package:flutter/material.dart';

import '../../core/theme/app_text_theme.dart';
import '../widgets/trip.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 34, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Text(
                "My Trips",
                style: AppTextTheme.textTheme.displaySmall,
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return const Trip();
                },
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: Stack(
      //   children: [
      //     const Positioned(
      //       left: 0,
      //       child: Icon(Icons.favorite, color: Colors.red),
      //     ),
      //     const Positioned(
      //       top: 0,
      //       child: Icon(Icons.star, color: Colors.yellow),
      //     ),
      //     const Positioned(
      //       right: 0,
      //       child: Icon(Icons.thumb_up, color: Colors.blue),
      //     ),
      //     FloatingActionButton(
      //       onPressed: () {
      //         isOpen == true ? closeFAB() : toggleFAB();
      //       },
      //       child: Icon(
      //         isOpen == true ? Icons.close : Icons.add,
      //       ),
      //     ),
      //   ],
      // ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: isExpanded,
            child: FloatingActionButton(
              onPressed: () {
                // Add your action for the first icon here
              },
              heroTag: null, // To prevent a tag conflict
              child: Icon(Icons.favorite),
            ),
          ),
          Visibility(
            visible: isExpanded,
            child: SizedBox(height: 16.0), // Spacing between icons
          ),
          Visibility(
            visible: isExpanded,
            child: FloatingActionButton(
              onPressed: () {
                // Add your action for the second icon here
              },
              heroTag: null, // To prevent a tag conflict
              child: Icon(Icons.star),
            ),
          ),
          Visibility(
            visible: isExpanded,
            child: SizedBox(height: 16.0), // Spacing between icons
          ),
          Visibility(
            visible: isExpanded,
            child: FloatingActionButton(
              onPressed: () {
                // Add your action for the third icon here
              },
              heroTag: null, // To prevent a tag conflict
              child: Icon(Icons.thumb_up),
            ),
          ),
          SizedBox(height: 16.0), // Spacing between FAB and icons
          FloatingActionButton(
            onPressed: toggleExpanded,
            child: Icon(isExpanded ? Icons.close : Icons.add),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // bool isOpen = false;
  bool isExpanded = false;

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  // Fab toggling
  // void toggleFAB() {
  //   setState(() {
  //     isOpen = !isOpen;
  //   });
  // }
  //
  // void closeFAB() {
  //   setState(() {
  //     isOpen = false;
  //   });
  // }
}

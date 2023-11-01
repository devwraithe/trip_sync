import 'dart:math' as math;

import 'package:flutter/material.dart';

class FabScreen extends StatefulWidget {
  const FabScreen({super.key});

  @override
  State<FabScreen> createState() => _FabScreenState();
}

class _FabScreenState extends State<FabScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: ExpandableFab(
        distance: 80,
        children: [
          ActionButton(),
          ActionButton(),
          ActionButton(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class ExpandableFab extends StatefulWidget {
  const ExpandableFab(
      {super.key, required this.children, required this.distance});

  final List<Widget> children;
  final double distance;

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          // Action Fab 1
          ..._buildExpandingActionButtons(),

          // Main Fab
          FloatingActionButton(
            onPressed: () => toggleFAB(),
            backgroundColor: Colors.orange,
            child: Icon(
              isFabOpen ? Icons.add : Icons.close,
            ),
          ),
        ],
      ),
    );
  }

  _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 45.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(
        ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  bool isFabOpen = false; // Track the main fab open/close state

  late final AnimationController
      _controller; // controller for the fab action buttons animation
  late final Animation<double>
      _expandAnimation; // fab action buttons animated expansion effect controller

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: isFabOpen ? 1.0 : 0.0,
      duration: const Duration(
        milliseconds: 250,
      ), // how long the animation will take
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // disposing of the animation controller
    super.dispose();
  }

  void toggleFAB() {
    setState(() {
      isFabOpen = !isFabOpen; // Toggle the FAB state
      if (isFabOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }
}

class ExpandingActionButton extends StatelessWidget {
  const ExpandingActionButton({
    super.key,
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  });

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 180.0),
          progress.value * maxDistance,
        );

        return Positioned(
          bottom: offset.dy,
          right: offset.dx,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2,
            child: child,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.airplanemode_active,
          ),
        ),
        const SizedBox(height: 6),
        const Text("Text"),
      ],
    );
  }
}

import 'package:flutter/material.dart';

@immutable
class ExpandingActionButton extends StatelessWidget {
  const ExpandingActionButton({
    super.key,
    this.left,
    this.right,
    this.top,
    this.bottom,
  });

  final double? left, right, top, bottom;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: top,
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.gps_fixed_rounded,
          color: Colors.green,
        ),
      ),
    );
  }
}

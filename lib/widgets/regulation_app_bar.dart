import 'package:flutter/material.dart';

class RegulationAppBar extends StatelessWidget {
  const RegulationAppBar({
    Key? key, required this.child, required this.color,
  }) : super(key: key);
  final Widget child;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      child: child,
      decoration: BoxDecoration(
        border: Border.all(color: color),
      ),
    );
  }
}

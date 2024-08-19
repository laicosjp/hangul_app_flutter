import 'package:flutter/material.dart';

class HorizontalBar extends StatelessWidget {
  final List<BarSegment> data;

  HorizontalBar({required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: data.map((segment) {
        return Expanded(
          flex: (segment.percentage * 100).toInt(),
          child: Container(
            height: 20,
            color: segment.color,
          ),
        );
      }).toList(),
    );
  }
}

class BarSegment {
  final double percentage;
  final Color color;

  BarSegment({required this.percentage, required this.color});
}

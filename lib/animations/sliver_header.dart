import 'package:flutter/material.dart';
import 'dart:math' as math;

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;
  HeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  //* 위젯의 최대높이
  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  //* 위젯의 최소높이
  @override
  double get minExtent => minHeight;

  //* 값이 true일 때 rebuild
  @override
  bool shouldRebuild(HeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

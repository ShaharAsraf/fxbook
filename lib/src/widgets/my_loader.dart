import 'package:flutter/material.dart';

class MyLoader extends StatelessWidget {
  final double size;
  final EdgeInsets padding;
  const MyLoader({this.size = 20, this.padding = EdgeInsets.zero, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: padding,
      child: const CircularProgressIndicator(strokeWidth: 2),
    );
  }
}

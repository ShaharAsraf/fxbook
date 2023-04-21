import 'package:flutter/material.dart';
import 'package:fxbook/src/style/colors.dart';
import 'package:fxbook/src/utils/consts.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const MyAppBar({this.title = 'Top Brokers', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: appBarColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kAppBarHeight);
}

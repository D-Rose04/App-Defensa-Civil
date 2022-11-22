import 'package:flutter/material.dart';

class NavBar extends StatelessWidget with PreferredSizeWidget {
  const NavBar({Key? key,required this.title}) : super(key: key);
  final String title;
  
  @override
  Widget build(BuildContext context) => AppBar(
      title: Text(title),
      backgroundColor: Theme.of(context).primaryColor);

  @override
  Size get preferredSize => const Size.fromHeight(55);
}

import 'package:flutter/material.dart';

import 'custom_search_icon.dart';

class customAppBar extends StatelessWidget {
  customAppBar({ required this.title, required this.icon, this.onPressed}) ;
  final String title;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {

    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
          ),
        ),
        customSearchIcon(
          onPressed: onPressed,
          icon: icon,
        ),
      ],
    );
  }
}

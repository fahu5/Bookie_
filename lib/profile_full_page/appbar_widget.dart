import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  const icon = CupertinoIcons.moon_stars;

  return AppBar(
    leading: const BackButton(color: Colors.white),
    backgroundColor: Colors.deepPurpleAccent,
    elevation: 0,
    actions: [
      IconButton(
        icon: const Icon(icon, color: Colors.white),
        onPressed: () {},
      ),
    ],
    title: const Text(
      'Profile',
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    centerTitle: true, // Center the title
  );
}

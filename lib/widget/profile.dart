import 'package:flutter/material.dart';
import '../profile_full_page/profile_pagedesign.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({
    super.key, required this.iconColor, required this.onPressed,
  });

  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()),
          );
        },
          icon: const Icon(Icons.account_circle, size: 37,),
          color: Colors.white,
        ),

      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem( {
    super.key,
    required this.icon,
    required this.text,
    this.hasNavigation = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
      ).copyWith(
        bottom:  20,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal:  24.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(15),

      ),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size:  24.0,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          if (hasNavigation)
            const Icon(
              LineAwesomeIcons.angle_right,
              size:  24.0,
            ),
        ],
      ),
    );
  }
}
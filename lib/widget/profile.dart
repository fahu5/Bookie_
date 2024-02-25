import 'package:flutter/material.dart';

class Notificationbar extends StatelessWidget {
  const Notificationbar({
    super.key, required this.iconColor, required this.onPressed,
  });

  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: () {},
          icon: const Icon(Icons.notification_add_outlined),
          color: Colors.white,),
        Positioned(
            right: 1,
            child:  Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(25.0)
              ),
             child: Center(
               child: Text(
                 '2',
               style: Theme.of(context).textTheme.labelLarge?.apply(color: Colors.black87, fontSizeFactor: 0.5),
               ),
             ),
            )
        ),
      ],
    );
  }
}

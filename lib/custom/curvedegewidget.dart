import 'package:bookiee/custom/primary_headercontainer.dart';
import 'package:flutter/material.dart';



class CircularContainer extends StatelessWidget {
  const CircularContainer({super.key, required this.backgroundColor});

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
    );
  }
}

class Curveedge extends StatelessWidget {
  const Curveedge({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child:Column(
                children: [
                  //1st card purple
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}



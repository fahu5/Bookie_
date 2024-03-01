import 'package:bookiee/custom/reuseable_widget.dart';
import 'package:flutter/material.dart';
import '../Core/Helper/helpfunction.dart';
import '../Homepage/circularcontainer.dart';


class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key, required this.child,
  });
   final Widget child;
  @override
  Widget build(BuildContext context) {
    return NewWidget(
      child: Container(
        color: Colors.deepPurpleAccent,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 450,
          child: Stack(
            children: [
              Positioned(top: -150, right: -250, child: CircularContainer(backgroundColor: HColors.textcolor.withOpacity(0.1))),
              Positioned(top: 100, right: -300, child: CircularContainer(backgroundColor: HColors.textcolor.withOpacity(0.1))),
             child,
            ],
          ),
        ),
      ),
    );
  }
}

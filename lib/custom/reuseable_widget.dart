import 'package:flutter/cupertino.dart';

import 'curvedwidgets.dart';

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key, this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedWidget(),
      child: child,
    );
  }
}

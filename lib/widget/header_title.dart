import 'package:flutter/material.dart';
import '../Core/Helper/helpfunction.dart';
import 'header.dart';
import 'notification.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HeaderAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(HText.homeAppBarTitle,
            style: Theme
                .of(context)
                .textTheme
                .headlineMedium
                ?.apply(color: Colors.white),
          ),
          Text(HText.homeAppBarSubTitle,
            style: Theme
                .of(context)
                .textTheme
                .labelMedium
                ?.apply(color: Colors.white),
          ),

        ],
      ),
      actions:  [Notificationbar(onPressed: (){}, iconColor: Colors.white)],


    );
  }
}


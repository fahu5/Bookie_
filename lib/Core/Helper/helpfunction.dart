
import 'package:flutter/material.dart';


class HelperFunctions {
  static bool isDarkMode(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark;
  }


}
class HText {
  static String get homeAppBarTitle => 'Bookie';
  static String get homeAppBarSubTitle => 'Dive into the World of Infinite Stories!';

}
class HColors {
  static const Color textcolor = Colors.deepPurpleAccent;
  static Color Dark = Colors.black;

  static Color light =  Colors.white;
}
class Himage{
  //home page icon
  static const String audiobookicon='assets/audiobook_icon.png';
  static const String classicbookicon='assets/classics_icon.png';
  static const String fictionbookicon='assets/fiction_icon.png';
  static const String nonfictionbookicon='assets/Non-fictionbook_icon.png';
  static const String romancebookicon='assets/romancebook_icon.png';
  static const String novelbookicon='assets/novelbook_icon.png';
  static const String actionbookicon='assets/icon/actionbook_icon.png';
  static const String seemoreicon='assets/novelbook_icon.png';

  //google icon for sign in page
  static const String googleicon='assets/google_icon.png';

}
class DeviceUtils {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;

  }
  static double getAppBarHeight(){
    return kToolbarHeight;
  }
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

}

class HeaderappbarTheme{
  HeaderappbarTheme._();

  static const lightAppBarTheme =AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size:3.0 ),
    actionsIconTheme: IconThemeData(color: Colors.black, size:3.0 ),
    titleTextStyle: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600, color: Colors.black),

  );
  static const DarkAppBarTheme =AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.white, size:3.0 ),
    actionsIconTheme: IconThemeData(color: Colors.white, size:3.0 ),
    titleTextStyle: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600, color: Colors.white),
  );

}

class HSizes{
  //padding and margin
  static const double xs= 4.0;
  static const double sm= 8.0;
  static const double md= 16.0;
  static const double lg= 24.0;
  static const double xl= 32.0;

  //icon size
  static const double iconxs= 12.0;
  static const double iconsm= 16.0;
  static const double iconmd= 24.0;
  static const double iconlg= 32.0;


  //font size
  static const double fontsm= 14.0;
  static const double fontmd= 16.0;
  static const double fontlg= 18.0;

  //button size
  static const double buttonheight= 18.0;
  static const double buttonradius= 12.0;
  static const double buttonwidth= 120.0;
  static const double buttonelavation= 4.0;

  //appbar height
  static const double appbarheight= 18.0;

  //default spacing section
  static const double defaultspace= 24.0;
  static const double spacebtwitems= 16.0;
  static const double spacebtwsection= 16.0;

  //border radius
  static const double borderradiusSM= 4.0;
  static const double borderradiusMD= 8.0;
  static const double borderradiusLG= 12.0;

  //divider height
  static const double dividerheight= 1.0;

  static const double gridViewSpacing =16.0;

}

class User {
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final bool isDarkMode;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.isDarkMode,
  });
}

Widget buildDivider() => const SizedBox(
  width: double.infinity,
  child: Divider(
    color: Colors.black,
  ),
);


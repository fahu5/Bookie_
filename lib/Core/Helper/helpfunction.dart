
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

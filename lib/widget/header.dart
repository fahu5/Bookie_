import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Core/Helper/helpfunction.dart';

class HeaderAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HeaderAppbar({
    Key? key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
    this.automaticallyImplyLeading = true, // Added default value
  }) : super(key: key);

  final Widget? title;
  final List<Widget>? actions;
  final IconData? leadingIcon;
  final VoidCallback? leadingOnPressed;
  final bool showBackArrow;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurpleAccent,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: showBackArrow
          ? IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_left))
          : (leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null),
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());
}

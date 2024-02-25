import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Core/Helper/helpfunction.dart';
import '../Homepage/home.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    HelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
            () => CurvedNavigationBar(
              height: 60,
             index: controller.selectedIndex.value,
             backgroundColor: controller.darkMode.value ? Colors.black : Colors.white,
             buttonBackgroundColor: controller.darkMode.value ? Colors.white70 : const Color(0xFF91D3B9),
             color: controller.darkMode.value ? Colors.deepPurpleAccent.withOpacity(0.1) : Colors.black.withOpacity(0.1),
             onTap: (index) => controller.selectedIndex.value = index,
             items: const [
             NavigationDestination(icon: Icons.menu_book_outlined, label: ''),
             NavigationDestination(icon: Icons.gamepad_outlined, label: ''),
             NavigationDestination(icon: Icons.home, label: ''),
             NavigationDestination(icon: Icons.post_add, label: ''),
             NavigationDestination(icon: Icons.messenger, label: ''),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final RxBool darkMode = false.obs;

  final screens = [
    Container(color: Colors.deepPurpleAccent),
    Container(color: Colors.deepPurpleAccent),
    const Homepage(),
    Container(color: Colors.deepPurpleAccent),
    Container(color: Colors.deepPurpleAccent),
  ];
}

class NavigationDestination extends StatelessWidget {
  final IconData icon;
  final String label;

  const NavigationDestination({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(height: 6.0),
        Text(label),
      ],
    );
  }
}

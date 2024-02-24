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
         () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: controller.darkMode.value ? Colors.black : Colors.white,
          indicatorColor: controller.darkMode.value ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.menu_book_outlined), label: 'My Books'),
            NavigationDestination(icon: Icon(Icons.post_add_outlined), label: 'Post'),
            NavigationDestination(icon: Icon(Icons.messenger), label: 'Chats'),
            NavigationDestination(icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
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
    Container(child: const Homepage()),
    Container(color: Colors.deepPurpleAccent),
    Container(color: Colors.deepPurpleAccent),
    Container(color: Colors.deepPurpleAccent),
    Container(color: Colors.deepPurpleAccent),
  ];
}

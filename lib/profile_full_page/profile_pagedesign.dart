import 'package:bookiee/profile_full_page/profile_list.dart';
import 'package:bookiee/profile_full_page/user_button.dart';
import 'package:flutter/material.dart';
import '../Core/Helper/helpfunction.dart';
import 'appbar_widget.dart';
import 'numbers_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: 55,
              height: 50,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(radius: 30, backgroundImage: AssetImage("assets/User_Avatar.png")),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: const Center(
                        child: Icon(Icons.camera_alt_outlined, color: Colors.orange),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const UserButton(),
            const SizedBox(height: 8),
            // Followers information
            const NumbersWidget(),
            const SizedBox(height: 8),
            buildDivider(),
            const SizedBox(height: 24.0),
            const ProfileListItem(
              icon: Icons.settings,
              text: 'Account Settings',
              hasNavigation: true,
              iconColor: Colors.black,
              textColor: Colors.black,
            ),
            const SizedBox(height: 3),
            const ProfileListItem(
              icon: Icons.notifications,
              text: 'Notification',
              hasNavigation: true,
              iconColor: Colors.black,
              textColor: Colors.black,
            ),
            const SizedBox(height: 3),
            const ProfileListItem(
              icon: Icons.privacy_tip,
              text: 'Privacy',
              hasNavigation: true,
              iconColor: Colors.black,
              textColor: Colors.black,
            ),
            const SizedBox(height: 3),
            const ProfileListItem(
              icon: Icons.share,
              text: 'Invite friends',
              hasNavigation: true,
              iconColor: Colors.black,
              textColor: Colors.black,
            ),
            const SizedBox(height: 3),
            const ProfileListItem(
              icon: Icons.logout,
              text: 'Logout',
              hasNavigation: true,
              iconColor: Colors.black,
              textColor: Colors.black,
            ),
            const SizedBox(height: 3),
            const ProfileListItem(
              icon: Icons.delete_forever,
              text: 'Delete Account',
              hasNavigation: false,
              iconColor: Colors.red,
              textColor: Colors.red,
            ),

        ],
      ),

      )

    );
  }
}



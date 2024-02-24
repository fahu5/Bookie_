import 'package:flutter/material.dart';
import '../Core/Helper/helpfunction.dart';
import '../custom/primary_headercontainer.dart';
import '../widget/header_title.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header title
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  const HeaderTitle(),
                  const SizedBox(height: 5.0),
                  // Search bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Container(
                      width: DeviceUtils.getScreenWidth(context),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(color: Colors.white),
                      ),
                      // Add your search bar content here
                      child: const Text("Search..."),
                    ),
                  ),

                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}



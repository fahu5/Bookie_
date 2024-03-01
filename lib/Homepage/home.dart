import 'package:flutter/material.dart';
import '../custom/primary_headercontainer.dart';
import '../widget/header_title.dart';
import '../widget/searchbar.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header title
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  HeaderTitle(),
                  SizedBox(height: 5.0),
                  // Search bar
                  Searchbox(),

                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}




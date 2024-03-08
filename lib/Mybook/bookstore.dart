import 'package:flutter/material.dart';
import '../widget/header_title.dart';
import 'bookmark.dart';

class MyBook extends StatelessWidget {
  const MyBook({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
          child: Column(
           children: [
            HeaderTitle(),
             SizedBox(height: 5,),
             BookListScreen(savedBooks: [], favoriteBooks: [],),

          ]
         ),
        ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/header_title.dart';
import 'bookmark.dart';

class MyBook extends StatelessWidget {
  const MyBook({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderTitle(),
              const SizedBox(height: 5),
              BookListScreen(
                savedBooksList: Provider.of<SavedBookList>(context),
                favoriteBookList: Provider.of<FavoriteBookList>(context),
              ),
            ],
          ),
        ),
      );
  }
}

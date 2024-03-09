import 'package:flutter/material.dart';

import 'bookmark.dart';

class FavoriteBooksScreen extends StatelessWidget {
  final FavoriteBookList favoriteBookList;

  const FavoriteBooksScreen({super.key, required this.favoriteBookList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Books'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: favoriteBookList.favoriteBooks.isEmpty
              ? const Text('No Favorite Books Found')
              : Column(
            children: favoriteBookList.favoriteBooks.map((book) {
              return buildBookTile(context, book);
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget buildBookTile(BuildContext context, SavedBook book) {
    return ListTile(
      title: Text(book.title),
      subtitle: Text(book.author),
      trailing: IconButton(
        icon: const Icon(Icons.favorite),
        onPressed: () => removeFromFavorites(context, book),
      ),
    );
  }

  void removeFromFavorites(BuildContext context, SavedBook book) {
    favoriteBookList.removeFromFavorites(book);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Book removed from Favorites'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

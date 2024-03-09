import 'package:flutter/material.dart';

class Book {
  final String title;
  final String author;

  const Book(this.title, {this.author = ''});
}

class SavedBook extends Book {
  SavedBook({required String title, String author = ''}) : super(title, author: author);
}

class SavedBookList extends ChangeNotifier {
  List<SavedBook> savedBooks = [];

  void addToSaved(SavedBook book) {
    savedBooks.add(book);
    notifyListeners();
  }

  void removeFromSaved(SavedBook book) {
    savedBooks.remove(book);
    notifyListeners();
  }
}

class FavoriteBookList extends ChangeNotifier {
  List<SavedBook> favoriteBooks = [];

  void addToFavorites(SavedBook book) {
    favoriteBooks.add(book);
    notifyListeners();
  }

  void removeFromFavorites(SavedBook book) {
    favoriteBooks.remove(book);
    notifyListeners();
  }
}

class BookListScreen extends StatefulWidget {
  final SavedBookList savedBooksList;
  final FavoriteBookList favoriteBookList;

  const BookListScreen({
    super.key,
    required this.savedBooksList,
    required this.favoriteBookList,
  });

  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Book'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SavedBooksScreen(
                          savedBookList: widget.savedBooksList,
                          favoriteBookList: widget.favoriteBookList,
                        ),
                      ),
                    ),
                    child: const Text('View Saved Books'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavoriteBooksScreen(
                          favoriteBookList: widget.favoriteBookList,
                        ),
                      ),
                    ),
                    child: const Text('View Favorite Books'),
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

class SavedBooksScreen extends StatelessWidget {
  final SavedBookList savedBookList;
  final FavoriteBookList favoriteBookList;

  const SavedBooksScreen({
    super.key,
    required this.savedBookList,
    required this.favoriteBookList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Books'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: savedBookList.savedBooks.isEmpty
              ? const Text('No Saved Books Found')
              : Column(
                  children: savedBookList.savedBooks
                      .map((book) => buildBookTile(context, book))
                      .toList(),
                ),
        ),
      ),
    );
  }

  Widget buildBookTile(BuildContext context, SavedBook book) {
    final isFavorite = favoriteBookList.favoriteBooks.contains(book);
    return ListTile(
      title: Text(book.title),
      subtitle: Text(book.author), // Display author
      trailing: IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_outline,
        ),
        onPressed: () => toggleFavorite(context, book),
      ),
    );
  }

  void toggleFavorite(BuildContext context, SavedBook book) {
    bool isFavorite = favoriteBookList.favoriteBooks.contains(book);

    if (isFavorite) {
      favoriteBookList.removeFromFavorites(book);
    } else {
      favoriteBookList.addToFavorites(book);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isFavorite
              ? 'Book removed from Favorites'
              : 'Book added to Favorites',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

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
                  children: favoriteBookList.favoriteBooks
                      .map((book) => buildBookTile(context, book))
                      .toList(),
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

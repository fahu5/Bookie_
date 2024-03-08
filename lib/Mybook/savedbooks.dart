import 'package:flutter/cupertino.dart';

class SavedBook {
  final String title;

  SavedBook({required this.title});
}

class SavedBookList extends ChangeNotifier {
  final List<SavedBook> savedBooks = [];

  void addBook(SavedBook book) {
    savedBooks.add(book);
    notifyListeners();
  }

  void removeBook(SavedBook book) {
    savedBooks.remove(book);
    notifyListeners();
  }
}

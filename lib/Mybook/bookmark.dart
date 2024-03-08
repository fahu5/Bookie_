import 'package:flutter/material.dart';

import '../widget/header_title.dart';

class Book {
  final String title;

  Book(this.title);
}

class BookListScreen extends StatefulWidget {
  final List<Book> savedBooks;
  final List<Book> favoriteBooks;

  const BookListScreen({super.key, required this.savedBooks, required this.favoriteBooks});

  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  int selectedTabIndex = 0; // 0 for Saved Books, 1 for Favorite Books

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderTitle(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedTabIndex = 0;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedTabIndex == 0 ? Colors.greenAccent.shade100 : null,
                      ),
                      child: const Text(
                        'Saved Books',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedTabIndex = 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedTabIndex == 1 ? Colors.greenAccent.shade100: null,
                      ),
                      child: const Text(
                        'Favorite Books',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          //  const Divider(thickness: 2), // Horizontal divider
            buildBookSection(selectedTabIndex == 0 ? widget.savedBooks : widget.favoriteBooks),
          ],
        ),
      ),
    );
  }

  Widget buildBookSection(List<Book> books) {
    return Container(
      padding: const EdgeInsets.all(16.0), // Padding for book list
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey), // Border around the section
        color: Colors.white, // Background color for the book section
      ),
      child: Column(
        children: books.map((book) => Text(book.title)).toList(),
      ),
    );
  }
}

import 'package:bookiee/Core/Helper/helpfunction.dart';
import 'package:flutter/material.dart';
import '../Books_manage/book page.dart';
import '../Books_manage/books_title.dart';

class BookData {
  final String title;
  final String author;
  final double rating;
  final String assetPath;
  final OpenBookDetailsData? details;

  BookData({
    required this.assetPath,
    required this.title,
    required this.author,
    required this.rating,
    this.details,
  });
}

class BooksGrid extends StatelessWidget {
  const BooksGrid({
    Key? key,
    required this.bookData,
    this.onTap,
    required this.detailsList,
  }) : super(key: key);

  final BookData bookData;
  final VoidCallback? onTap;
  final List<OpenBookDetailsData> detailsList;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookPage(
              openBookDetailsData: detailsList.firstWhere(
                    (details) => details.title == bookData.title,
              ),
            ),
          ),
        );
      },
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: dark ? HColors.Dark : HColors.light,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    bookData.assetPath,
                    fit: BoxFit.cover,
                    height: 180,
                  ),
                ),
                const SizedBox(height: 0.5),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BooksTitle(title: bookData.title, smallSize: true),
                        const SizedBox(height: 3),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bookData.author,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style:
                              Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                        const SizedBox(width: HSizes.xs),
                        Row(
                          children: [
                            buildRatingWidget(bookData.rating),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            buildAddToLIstIcon(context),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: dark
                      ? Colors.black.withOpacity(0.9)
                      : Colors.white.withOpacity(0.9),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildRatingWidget(double rating) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      for (int i = 0; i < 5; i++)
        Icon(
          Icons.star,
          color: i < rating ? Colors.amber : Colors.grey,
          size: 16,
        ),
    ],
  );
}

Widget buildAddToListIcon(BuildContext context, BookData bookData) {
  return GestureDetector(
    onTap: () {
      _saveBookToFolder(context, bookData);
    },
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: const SizedBox(
        width: 35,
        height: 35,
        child: Center(
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    ),
  );
}

void _saveBookToFolder(BuildContext context, BookData bookData) {
  // Assume you have a SavedBookList instance
  Provider.of<SavedBookList>(context, listen: false).addBook(SavedBook(title: bookData.title));

  // Show a snackbar to indicate that the book has been saved
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Book added to Saved Books'),
      duration: Duration(seconds: 2),
    ),
  );
}
}

}
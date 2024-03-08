import 'package:flutter/material.dart';
import '../book_reading/pdf_view.dart';
import 'book_pagedetails.dart';
class OpenBookDetailsData {
  final String title;
  final String author;
  final double rating;
  final String assetPath;
  final String description;

  OpenBookDetailsData(
      {
    required this.assetPath,
    required this.title,
    required this.author,
    required this.rating,
        required this.description,
  });
}

class BookPage extends StatelessWidget {
  const BookPage({super.key, required this.openBookDetailsData, });
  final OpenBookDetailsData openBookDetailsData;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(openBookDetailsData.title),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(openBookDetailsData.assetPath),
            BookDetails(
              title: openBookDetailsData.title,
              author: openBookDetailsData.author,
              rating: openBookDetailsData.rating,
              description: openBookDetailsData.description,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PdfView(bookTitle: openBookDetailsData.title, bookDetails: openBookDetailsData),
                  ),
                );
              },
              child: const Text('Continue Reading'),
            ),
          ],
        ),
      ),
    );
  }
}


List<OpenBookDetailsData> detailsList=[
  OpenBookDetailsData(
    assetPath: 'assets/books/The_Help.jpg',
    title: 'The Help',
    author: 'Kathryn Stockett',
    rating: 4.9,
    description: 'August 1962.MAE MOBLEY was born on a early Sunday morning in August, 1960. A church baby we like to call it.''Taking care a white babies, that’s what I do, along with all the cooking and the cleaning.I done raised seventeen kids in my lifetime. I know how to get them babies to sleep, stop crying.....'
  ),
  OpenBookDetailsData(
    assetPath: 'assets/books/Dopamine-Detox.jpg',
    title: 'Dopamine Detox',
    author: 'Thibaut Meurisse',
    rating: 4.5,
    description: '      ',

  ),
  OpenBookDetailsData(
    assetPath: 'assets/books/Hopeless.jpg',
    title: 'Hopeless',
    author: 'Collen Hoover',
    rating: 4.2,
    description: 'For Vance.Some fathers give you life. Some show you how to live it. Thank you for showing me how to live mine...',

  ),
  OpenBookDetailsData(
    assetPath: 'assets/books/brida.jpg',
    title: 'BRIDA',
    author: 'Paulo Coehlo',
    rating: 4.2,
    description: '. . . what woman having ten silver coins, if she loses one of them, does not light a lamp, sweep the house,and search carefully until she finds it..',

  ),
  OpenBookDetailsData(
    assetPath: 'assets/books/The alchemist.jpg',
    title: 'The ALCHEMIST',
    author: 'Paulo Coehlo',
    rating: 4.5,
    description: '“The story has the comic charm, dramatic tension, and psychological intensity of a fairy tale, but it’s full of specific wisdom as well. . . . A sweetly exotic tale for young and old alike.'
     ' —Publishers Weekl',

  ),
  OpenBookDetailsData(
    assetPath: 'assets/books/like the following river.jpg',
    title: 'Like The Following River',
    author: 'Paulo Coehlo',
    rating: 4.5,
    description: 'When I was fifteen, I said to my mother: ‘I’ve discovered my vocation. I want to be a writer.’‘My dear,’she replied sadly, ‘your father is an engineer. He’s a logical, reasonable man with a very clear vision of the world. Do you actually know what it means to be a writer?’',

  ),
];
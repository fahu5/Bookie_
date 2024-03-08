import 'package:flutter/material.dart';
class BookDetails extends StatelessWidget {
  final String title;
  final String author;
  final double rating;
  final String description;

  const BookDetails({
    super.key,
    required this.title,
    required this.author,
    required this.rating,
    required this.description,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          author,
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),

        Row(
          children: <Widget>[
            for (int i = 0; i < rating.floor(); i++)
              const Icon(Icons.star, color: Colors.amber),
            if (rating - rating.floor() >= 0.76)
              const Icon(Icons.star, color: Colors.amber)
            else if (rating - rating.floor() > 0.25)
              const Icon(Icons.star_half, color: Colors.amber)
            else
              const Icon(Icons.star_border, color: Colors.grey),
          ],
        ),
        Text(
          description,
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}

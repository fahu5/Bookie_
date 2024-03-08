import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookViewer extends StatefulWidget {
  const BookViewer({super.key});

  @override
  _BookViewerState createState() => _BookViewerState();
}

class _BookViewerState extends State<BookViewer> {
  int currentPage = 1;
  bool isPageMarked = false;
  List<int> markedPages = [];

  void nextPage() {
    setState(() {
      currentPage++;
      isPageMarked = markedPages.contains(currentPage);
    });
  }

  void previousPage() {
    if (currentPage > 1) {
      setState(() {
        currentPage--;
        isPageMarked = markedPages.contains(currentPage);
      });
    }
  }

  void toggleMark() {
    setState(() {
      if (markedPages.contains(currentPage)) {
        markedPages.remove(currentPage);
        isPageMarked = false;
      } else {
        markedPages.add(currentPage);
        isPageMarked = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Viewer'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(
            child: SfPdfViewer.asset(
              'assets/books_pdf/the_help_-_kathryn_stockett.pdf',
              onPageChanged: (PdfPageChangedDetails details) {
                setState(() {
                  currentPage = details.newPageNumber;
                  isPageMarked = false;
                });
              },
            ),
          ),

          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: previousPage,
                child: const Text('Previous Page'),
              ),
              IconButton(
                onPressed: toggleMark,
                icon: Icon(
                  isPageMarked ? Icons.check_circle : Icons.check_circle_outline,
                  color: isPageMarked ? Colors.green : Colors.grey,
                  size: 30.0,
                ),
              ),
              ElevatedButton(
                onPressed: nextPage,
                child: const Text('Next Page'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

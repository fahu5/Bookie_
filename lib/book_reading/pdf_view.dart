import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../Books_manage/book page.dart';

class PdfView extends StatefulWidget {
  final String bookTitle;
  final OpenBookDetailsData bookDetails;

  const PdfView({super.key, required this.bookTitle, required this.bookDetails});

  @override
  _BookViewerState createState() => _BookViewerState();
}

class _BookViewerState extends State<PdfView> {
  int currentPage = 1;
  bool isPageMarked = false;
  List<int> markedPages = [];
  String? currentPdfPath;


  void setPdfPath(String bookTitle) {
    final bookPdfPaths = {
      'The Help': 'assets/books_pdf/the_help_-_kathryn_stockett.pdf',
      'Dopamine Detox': 'assets/books_pdf/Dopamine Detox.pdf',
      'Hopeless': 'assets/books_pdf/Hopeless.pdf',
       'BRIDA':'assets/books_pdf/brida_paulo_chaulo.pdf',
      'The ALCHEMIST': 'assets/books_pdf/The-Alchemist-PDF-Book-In-English-By-Paulo-Coelho.pdf',
      'Like The Following River' : 'assets/books_pdf/like_the_following_river.pdf',
    };

    final pdfPath = bookPdfPaths[bookTitle];

    setState(() {
      currentPdfPath = pdfPath;
    });
  }

  @override
  void initState() {
    super.initState();
    setPdfPath(widget.bookTitle);
  }

  void nextPage() {
    if (currentPdfPath != null) {
      setState(() {
        currentPage++;
        isPageMarked = markedPages.contains(currentPage);
      });
    }
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
        title: Text(widget.bookTitle,
            style: const TextStyle(
              color: Colors.white,
        ),
        ),

        backgroundColor: Colors.deepPurple,
      ),
      body: currentPdfPath != null
          ? Column(
           children: [
           Expanded(
            child: SfPdfViewer.asset(
              currentPdfPath!,
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
      )
          : const Center(child: Text('PDF not found')),
    );
  }
}

import 'package:bookiee/Core/Helper/helpfunction.dart';
import 'package:bookiee/custom/section_header.dart';
import 'package:flutter/material.dart';
import '../Books_manage/book page.dart';
import '../Books_manage/booksgrid_layoutformat.dart';
import '../Books_manage/category_list.dart';
import '../Core/Helper/book_list.dart';
import '../custom/primary_headercontainer.dart';
import '../widget/header_title.dart';
import '../widget/searchbar.dart';
import 'GridView_Books.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PrimaryHeaderContainer(
              child: Column(
                children: [

                  HeaderTitle(),
                  SizedBox(height: 5.0),
                  // Search bar
                  Searchbox(),
                  SizedBox(height: 16.0),
                  //books category
                    CategoriesList(
                    categories: [
                      {'image': 'assets/icon/audiobook_icon.png', 'title': '  Audio Books', 'textColor': Colors.white},
                      {'image': 'assets/icon/novelbook_icon.png', 'title': 'Novel', 'textColor': Colors.white},
                      {'image': 'assets/icon/fiction_icon.png', 'title': 'Fiction', 'textColor': Colors.white},
                      {'image': 'assets/icon/Non-fictionbook_icon.png', 'title':'   Non-Fiction', 'textColor': Colors.white},
                      {'image': 'assets/icon/poetry_icon.png', 'title': 'Poetry', 'textColor': Colors.white},
                      {'image': 'assets/icon/romancebook_icon.png', 'title': 'Romance', 'textColor': Colors.white},
                      {'image': 'assets/icon/thrillerbook_icon.png', 'title': 'Thrillers', 'textColor': Colors.white},
                      {'image': 'assets/icon/crimefiction_book_icon.png', 'title': '  Crime Fiction', 'textColor': Colors.white},

                    ],
                 ),
                ],
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(HSizes.defaultspace),
              child: Column(
                children: [
                  const SectionHeader(title: 'Discover Books',),
                  const SizedBox(height: 2.0),
                  BooksGridLayout(
                    itemCount: bookDataList.length,
                    itemBuilder: (context, index) => BooksGrid(
                      bookData: bookDataList[index], detailsList: [detailsList[index]],
                    ),
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








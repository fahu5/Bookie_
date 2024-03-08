

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Core/Helper/helpfunction.dart';
import 'category_icon.dart';

class CategoriesList extends StatelessWidget {
  final List<Map<String, dynamic>> categories;

  const CategoriesList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:const EdgeInsets.only(left: HSizes.defaultspace),
             child: Column(
              children: [  SizedBox(
                height: 100,
                 child: ListView.builder(
                 shrinkWrap: true,
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_,index) {
                    {
                      final category = categories[index];
                      return CategoryIcon(
                        key: Key(category['title']),
                        image: category['image'],
                        title: category['title'],
                        textColor: category['textColor'],
                        onTap: () {
                          // Handle category tap
                        },
                      );
                    }
                  }
      ),
    )
    ]
    )
    );

  }
}

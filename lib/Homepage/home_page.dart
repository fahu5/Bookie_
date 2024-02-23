import 'package:flutter/material.dart';


class Homepage extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const Homepage({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const Row(
            children: [
              Icon(Icons.search, color: Colors.deepPurple),
              SizedBox(width: 8.0),
              Text('Search', style: TextStyle(
                  fontSize: 15,
                  color: Colors.deepPurple
              )),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.purple.shade50, // Background color
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.lightBlue, // Category section color
                alignment: Alignment.center,
                child: const Text('Book Categories'),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green, // Discover section color
                alignment: Alignment.center,
                child: const Text('Discover Most Reviewed Books'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: currentIndex,
        onTap: onTabSelected,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: IconButton(
              onPressed: () {
                onTabSelected(0);
              },
              icon: const Icon(
                Icons.home,
                color: Colors.deepPurple,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'My Books',
            icon: IconButton(
              onPressed: () {
                onTabSelected(1);
              },
              icon: const Icon(
                Icons.menu_book_outlined,
                color: Colors.deepPurple,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Discover Post',
            icon: IconButton(
              onPressed: () {
                onTabSelected(2);
              },
              icon: const Icon(
                  Icons.dynamic_feed_rounded,
                 color: Colors.deepPurple,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Chats',
            icon: IconButton(
              onPressed: () {
                onTabSelected(2);
              },
              icon: const Icon(
                  Icons.message_rounded,
                color: Colors.deepPurple,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: IconButton(
              onPressed: () {
                onTabSelected(2);
              },
              icon: const Icon(
                  Icons.account_circle_outlined,
                color: Colors.deepPurple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
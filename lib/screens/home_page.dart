// File: screens/home_page.dart
import 'package:flutter/material.dart';
import 'package:nimbus/screens/news_page.dart';
import 'package:nimbus/screens/profile_page.dart';

import '../widgets/post_widget.dart';
import 'event_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  String _searchQuery = '';

  final List<Map<String, String>> _posts = [
    {
      'username': 'warriors',
      'imageUrl':
          'https://cdn.britannica.com/21/233921-050-69BE4DB8/Stephen-Curry-Golden-State-Warriors-Dillon-Brooks-Memphis-Grizzlies-NBA-action-2022.jpg',
      'description': '18 threes from the Dubs in the first half',
      'profileImageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSInkyiVrKjT18m4dbpv5Sz4hsSPFjIsyk5lQ&s',
    },
    {
      'username': 'neeraj____chopra',
      'imageUrl':
          'https://bsmedia.business-standard.com/_media/bs/img/about-page/thumb/464_464/1628846015.jpg',
      'description': '🔥❤️',
      'profileImageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc5zQkJkVRlzrzBG9nd7h8bbUXtHiNN0m26w&s',
    },
    {
      "username": "leomessi",
      "imageUrl":
          "https://assets.goal.com/images/v3/blt9a64f1b805baf143/GOAL%20-%20Blank%20WEB%20-%20Facebook%20(30).jpg?auto=webp&format=pjpg&width=3840&quality=60",
      "description": "Feliz 125 Aniversario al mejor Club del Mundo 💙",
      "profileImageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5e6g5670AQpZI4kbZaJ_IiSVzsxhVDkz8pA&s"
    },
    {
      'username': 'virat.kohli',
      'imageUrl':
          'https://revsportz.in/wp-content/uploads/2024/06/Virat-Kohli-with-the-ICC-T20-WC-Trophy.jpg',
      'description': 'Forever grateful 🙏',
      'profileImageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzxrEfkv84uJ2lgB7vz6swkx9QAZ4ZhvODZw&s',
    },
    {
      "username": "pvsindhu1",
      "imageUrl":
          "https://images.herzindagi.info/image/2022/Mar/pv-sindhu-Main.jpg",
      "description": "Paris 2024: A Beautiful Journey but a Difficult Loss ❤️",
      "profileImageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQS-y5c3qJjWkxl7gQeFZ9WWgNmIJONGkziIw&s"
    },
    {
      "username": "kingjames",
      "imageUrl":
          "https://www.maxim.com/wp-content/uploads/2021/05/lebron-james-suit-shorts-1.jpg",
      "description": "👑",
      "profileImageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwS6aIP8m94PX0FFSfePhj8FCS6VyN-NVwwA&s"
    },
    {
      "username": "tombrady",
      "imageUrl":
          "https://compote.slate.com/images/4b196f9b-2ddf-4f4d-a1b7-5707b0b14456.jpeg?crop=1938%2C1292%2Cx0%2Cy0",
      "description": "@nflonfox @raiders @bcfc @nobull",
      "profileImageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-uQDHSNM6m3JK3ZOpuXyi7_JFz-MFYGE5Kg&s"
    },
    {
      "username": "m10_official",
      "imageUrl": "https://pbs.twimg.com/media/EvEfgVMXcAMTPlp.jpg:large",
      "description":
          "8 years later and still a thing of beauty On this day in 2016 ✨",
      "profileImageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIpo4gkxCcgx-v53GUzeTR1ATcvMRv8oLgXA&s"
    }
  ];

  @override
  Widget build(BuildContext context) {
    // Filter posts based on the search query
    final filteredPosts = _posts.where((post) {
      final username = post['username']!.toLowerCase();
      final description = post['description']!.toLowerCase();
      return username.contains(_searchQuery.toLowerCase()) ||
          description.contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Text(
                "Nimbus",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              // Add the search bar at the top
              // HomeSearchBar(
              //   onSearch: (query) {
              //     setState(() {
              //       _searchQuery = query;
              //     });
              //   },
              // ),
              const SizedBox(height: 16),
              Expanded(
                child: IndexedStack(
                  index: _currentIndex,
                  children: [
                    ListView.builder(
                      itemCount: filteredPosts.length,
                      itemBuilder: (context, index) {
                        final post = filteredPosts[index];
                        return PostWidget(
                          username: post['username']!,
                          imageUrl: post['imageUrl']!,
                          description: post['description']!,
                          profileImageUrl: post['profileImageUrl']!,
                        );
                      },
                    ),
                    Center(child: NewsPage()),
                    Center(child: EventPage()),
                    const Center(child: ProfilePage()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF424242),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFFDB80A),
        unselectedItemColor: const Color(0xFF969696),
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_pin),
            label: 'PlayFind',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

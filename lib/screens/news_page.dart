import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Sports News'),
            Tab(text: 'Esports News'),
          ],
        ),
      ),
      body: Column(
        children: [
          TabBarView(
            controller: _tabController,
            children: [
              SportsNews(),
              EsportsNews(),
            ],
          ),
        ],
      ),
    );
  }
}

class SportsNews extends StatelessWidget {
  final List<Map<String, String>> sportsNews = [
    {
      'title': 'Football World Cup Highlights',
      'description':
          'Catch all the action from the latest matches in the World Cup.',
    },
    {
      'title': 'NBA Finals Recap',
      'description':
          'A thrilling showdown in the NBA finals, see who came out on top.',
    },
    {
      'title': 'Olympic Games Updates',
      'description': 'The latest updates from the ongoing Olympic Games.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sportsNews.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(sportsNews[index]['title']!),
            subtitle: Text(sportsNews[index]['description']!),
          ),
        );
      },
    );
  }
}

class EsportsNews extends StatelessWidget {
  final List<Map<String, String>> esportsNews = [
    {
      'title': 'LoL Worlds 2024 Overview',
      'description':
          'An in-depth look at the League of Legends World Championship.',
    },
    {
      'title': 'Dota 2 The International Recap',
      'description': 'The most epic moments from The International.',
    },
    {
      'title': 'CS:GO Major Results',
      'description':
          'Find out who clinched the title in the latest CS:GO Major.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: esportsNews.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(esportsNews[index]['title']!),
            subtitle: Text(esportsNews[index]['description']!),
          ),
        );
      },
    );
  }
}

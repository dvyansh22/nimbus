import 'package:flutter/material.dart';

import '../widgets/event_widget.dart';
import 'event_details_page.dart';

class EventPage extends StatelessWidget {
  final List<Map<String, String>> events = [
    {
      'name': ' Badminton Premiere League',
      'date': '2024-08-10',
      'image':
          'https://i.pinimg.com/474x/69/15/a0/6915a0164788a13072aa3ef02184948a.jpg',
      'poster':
          'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/badminton-tournament-facebook-shared-image-design-template-129afcadd76fd07cde60c7e063d6cc5f_screen.jpg?ts=1658922017',
      'description': 'Description for Concert A',
      'type': 'Music Concert',
      'venue': 'Stadium XYZ, New York',
      'duration': '10:00 PM - 11:00 PM',
      'price': '299',
    },
    {
      'name': 'Event B',
      'date': '2024-09-12',
      'image':
          'https://marketplace.canva.com/EAFHa7oiWLU/1/0/1131w/canva-black-modern-basketball-tournament-poster-portrait-9PYxBKhRiUU.jpg',
      'poster':
          'https://img.freepik.com/free-vector/cartoon-ad-poster-banner-with-basketball-tournament-shining-ball-court_33099-899.jpg',
      'description': 'Description for Concert B',
      'type': 'Sports Event',
      'venue': 'Arena ABC, Los Angeles',
      'duration': '2 hours',
      'price': '75.00',
    },
    {
      "name": "Champions League Final",
      "date": "2024-11-20",
      "image":
          "https://static.picmaker.com/scene-prebuilts/thumbnails/0e562fc0-23fb-4ce0-a40c-e95c6d99a42a.png",
      "poster":
          "https://wallpapers.com/images/hd/classic-uefa-champions-league-rergq5gltabhbbnw.jpg",
      "description":
          "The ultimate showdown between Europe's top football clubs to crown the continental champion.",
      "type": "Football Match",
      "venue": "Wembley Stadium, London",
      "duration": "2.5 hours",
      "price": "150.00"
    },
    {
      "name": "Grand Slam Tennis Finals",
      "date": "2024-09-15",
      "image":
          "https://img.freepik.com/free-vector/tennis-tournament-poster-template_23-2148987323.jpg",
      "poster":
          "https://img.freepik.com/free-vector/tennis-championship-banner-template_23-2148987324.jpg",
      "description":
          "Witness the top tennis players compete for the prestigious Grand Slam title.",
      "type": "Tennis Tournament",
      "venue": "Arthur Ashe Stadium, New York",
      "duration": "3 hours",
      "price": "200.00"
    },
    {
      "name": "World Boxing Championship",
      "date": "2024-10-10",
      "image":
          "https://img.freepik.com/free-vector/boxing-match-poster-template_23-2148987325.jpg",
      "poster":
          "https://img.freepik.com/free-vector/boxing-championship-banner-template_23-2148987326.jpg",
      "description":
          "A high-stakes boxing match to determine the world heavyweight champion.",
      "type": "Boxing Match",
      "venue": "Madison Square Garden, New York",
      "duration": "1.5 hours",
      "price": "250.00"
    },
    {
      "name": "International Marathon",
      "date": "2024-12-05",
      "image":
          "https://img.freepik.com/free-vector/marathon-event-poster-template_23-2148987327.jpg",
      "poster":
          "https://img.freepik.com/free-vector/marathon-race-banner-template_23-2148987328.jpg",
      "description":
          "Join runners from around the world in this prestigious marathon event.",
      "type": "Marathon",
      "venue": "Central Park, New York",
      "duration": "4 hours",
      "price": "100.00"
    },
    {
      "name": "All-Star Basketball Game",
      "date": "2024-11-25",
      "image":
          "https://img.freepik.com/free-vector/basketball-all-star-game-poster-template_23-2148987329.jpg",
      "poster":
          "https://img.freepik.com/free-vector/basketball-tournament-banner-template_23-2148987330.jpg",
      "description":
          "An exhibition game featuring the league's star players in a thrilling matchup.",
      "type": "Basketball Game",
      "venue": "Staples Center, Los Angeles",
      "duration": "2 hours",
      "price": "120.00"
    },
    {
      "name": "World Surfing Championship",
      "date": "2024-10-20",
      "image":
          "https://img.freepik.com/free-vector/surfing-competition-poster-template_23-2148987331.jpg",
      "poster":
          "https://img.freepik.com/free-vector/surfing-championship-banner-template_23-2148987332.jpg",
      "description":
          "Watch the world's best surfers ride the waves in this exciting championship event.",
      "type": "Surfing Competition",
      "venue": "Bondi Beach, Sydney",
      "duration": "5 hours",
      "price": "80.00"
    }
  ];

  EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.57,
      ),
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EventDetailsPage(
                  eventName: event['name']!,
                  eventImage: event['image']!,
                  eventDate: event['date']!,
                  eventType: event['type']!,
                  eventVenue: event['venue']!,
                  eventDuration: event['duration']!,
                  eventPrice: event['price']!,
                  eventDescription: event['description']!,
                  eventPoster: event['poster']!,
                ),
              ),
            );
          },
          child: EventWidget(
            eventName: event['name']!,
            eventDate: event['date']!,
            eventImage: event['image']!,
            eventDescription: event['description']!,
          ),
        );
      },
    );
  }
}

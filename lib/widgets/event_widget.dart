import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final String eventName;
  final String eventDate;
  final String eventImage;
  final String eventDescription;

  const EventWidget({
    super.key,
    required this.eventName,
    required this.eventDate,
    required this.eventImage,
    required this.eventDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(4.0)),
            child: Image.network(
              eventImage,
              width: double.infinity,
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius:
                        BorderRadius.circular(4.0), // Add border radius here
                  ),
                  child: Text(
                    " $eventDate",
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  eventName,
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8.0),
                Text(
                  eventDescription,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

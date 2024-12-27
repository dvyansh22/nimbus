import 'package:flutter/material.dart';

class EventDetailsPage extends StatelessWidget {
  final String eventName;
  final String eventImage;
  final String eventDate;
  final String eventType;
  final String eventVenue;
  final String eventDuration;
  final String eventPrice;
  final String eventDescription;
  final String eventPoster;
  const EventDetailsPage({
    super.key,
    required this.eventName,
    required this.eventImage,
    required this.eventDate,
    required this.eventType,
    required this.eventVenue,
    required this.eventDuration,
    required this.eventPrice,
    required this.eventDescription,
    required this.eventPoster,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      appBar: AppBar(
        title: Text(
          eventName,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Event Poster
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  eventPoster,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 10.0),

              // Event Details
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(100, 50, 50, 50),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Event Date
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: Colors.grey,
                          size: 18,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Date: $eventDate",
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),

                    // Event Duration
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: Colors.grey,
                          size: 18,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Duration: $eventDuration",
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),

                    // Event Type
                    Row(
                      children: [
                        const Icon(
                          Icons.category,
                          color: Colors.grey,
                          size: 18,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Type: $eventType",
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),

                    // Venue Details
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.grey,
                          size: 18,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            "Venue: $eventVenue",
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About The Event",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "$eventDescription",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30, top: 8),
        color: Colors.blueGrey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "₹$eventPrice",
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFDB80A),
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
              ),
              onPressed: () {
                // Handle booking logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Booking Confirmed!'),
                  ),
                );
              },
              child: const Text(
                "Book Now",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),

      // Bottom Sheet with Price and Book Now Button
      // bottomSheet: Container(
      //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      //   color: Colors.white,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       // Event Price
      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           const Text(
      //             "Price",
      //             style: TextStyle(fontSize: 14.0, color: Colors.grey),
      //           ),

      //         ],
      //       ),
      //       // Book Now Button

      //     ],
      //   ),
      // ),
    );
  }
}

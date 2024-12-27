import 'package:flutter/material.dart';

class SportsList extends StatelessWidget {
  final List<Map<String, dynamic>> buttonData = [
    {'icon': Icons.sports_cricket, 'text': 'Cricket'},
    {'icon': Icons.sports_soccer, 'text': 'Football'},
    {'icon': Icons.sports_basketball, 'text': 'Basketball'},
    {'icon': Icons.sports_tennis, 'text': 'Tennis'},
  ];

  SportsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white70,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: buttonData.length,
        itemBuilder: (context, index) {
          final item = buttonData[index];
          return Column(
            children: [
              ListTile(
                leading: Icon(item['icon'], color: Colors.white),
                title: Text(
                  item['text'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  print('Button tapped: ${item['text']}');
                },
              ),
              if (index < buttonData.length - 1)
                const Divider(
                  thickness: 2,
                  height: 0,
                ),
            ],
          );
        },
      ),
    );
  }
}

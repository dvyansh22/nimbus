import 'package:flutter/material.dart';

import '../screens/post_detail_page.dart';

class ProfilePostWidget extends StatelessWidget {
  final String imageUrl;
  final int index;
  final List<String> postImages;
  final List<String> postCaptions;

  const ProfilePostWidget({
    super.key,
    required this.imageUrl,
    required this.index,
    required this.postImages,
    required this.postCaptions,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetailPage(
              postImages: postImages,
              postCaptions: postCaptions,
              initialIndex: index,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 150,
          ),
        ),
      ),
    );
  }
}

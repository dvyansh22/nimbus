import 'package:flutter/material.dart';

import 'comment_section.dart';

class PostDetailPage extends StatefulWidget {
  final List<String> postImages;
  final List<String> postCaptions;
  final int initialIndex;

  const PostDetailPage({
    super.key,
    required this.postImages,
    required this.postCaptions,
    required this.initialIndex,
  });

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  late ScrollController _scrollController;
  final Set<int> likedPosts = {};
  final Map<int, List<String>> comments = {};

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
      initialScrollOffset: widget.initialIndex * 360.0,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void toggleLike(int index) {
    setState(() {
      if (likedPosts.contains(index)) {
        likedPosts.remove(index);
      } else {
        likedPosts.add(index);
      }
    });
  }

  void addComment(int index, String comment) {
    setState(() {
      comments.putIfAbsent(index, () => []);
      comments[index]!.add(comment);
    });
  }

  void openCommentSection(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CommentSection(
          comments: comments[index] ?? [],
          onAddComment: (newComment) {
            addComment(index, newComment);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        controller: _scrollController,
        itemCount: widget.postImages.length,
        itemBuilder: (context, index) {
          bool isLiked = likedPosts.contains(index);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.postImages[index],
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit
                      .cover, // Ensures the image covers the area and crops excess height
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16),
                child: Text(
                  widget.postCaptions[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Colors.white,
                      ),
                      onPressed: () => toggleLike(index),
                    ),
                    IconButton(
                      icon: const Icon(Icons.comment, color: Colors.white),
                      onPressed: () => openCommentSection(context, index),
                    ),
                    Spacer(),
                    IconButton(
                      icon: const Icon(Icons.share, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

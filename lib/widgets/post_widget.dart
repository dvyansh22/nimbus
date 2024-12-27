import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class PostWidget extends StatefulWidget {
  final String username;
  final String imageUrl;
  final String description;
  final String profileImageUrl;

  const PostWidget({
    super.key,
    required this.username,
    required this.imageUrl,
    required this.description,
    required this.profileImageUrl,
  });

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isLiked = false;
  List<String> comments = []; // Store comments

  void addComment(String comment) {
    setState(() {
      comments.add(comment);
    });
  }

  void openCommentSection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CommentSection(
          comments: comments,
          onAddComment: (newComment) {
            addComment(newComment);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      color: const Color(0xFF212121),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.profileImageUrl),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Text(
                  widget.username,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
          // Image of the post
          Image.network(
            widget.imageUrl,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.contain,
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8,
              top: 12,
            ),
            child: Text(
              widget.description,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          // Actions like Like, Comment, Share
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                splashColor: Colors.transparent,
                icon: Icon(
                  size: 28,
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
              ),
              IconButton(
                splashColor: Colors.transparent,
                icon: const Icon(
                  size: 28,
                  Icons.comment,
                  color: Colors.white,
                ),
                onPressed: () {
                  openCommentSection(context);
                },
              ),
              IconButton(
                splashColor: Colors.transparent,
                icon: const Icon(
                  size: 28,
                  Icons.send,
                  color: Colors.white,
                ),
                onPressed: () {
                  Share.share(
                    'Check out this post by ${widget.username}: ${widget.description}\n\n${widget.imageUrl}',
                  );
                },
              ),
            ],
          ),
          if (comments.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: comments.map((comment) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Text(
                      comment,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}

class CommentSection extends StatefulWidget {
  final List<String> comments;
  final Function(String) onAddComment;

  const CommentSection({
    super.key,
    required this.comments,
    required this.onAddComment,
  });

  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _handleAddComment() {
    final comment = _commentController.text;
    if (comment.isNotEmpty) {
      widget.onAddComment(comment);
      _commentController.clear();
      setState(() {}); // Refresh to show the new comment
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.comments.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    widget.comments[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _commentController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Add a comment...',
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send, color: Colors.white),
                onPressed: _handleAddComment,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

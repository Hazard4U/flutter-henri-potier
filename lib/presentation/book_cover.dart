import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  final String coverUrl;

  const BookCover({super.key, required this.coverUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Image(
        image: NetworkImage(coverUrl),
      ),
    );
  }
}

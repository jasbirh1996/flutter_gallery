import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/modal/image_modal.dart';

/// Custom widget to display an image card with likes and views.
class ImageCard extends StatelessWidget {
  final ImageModel image;

  const ImageCard({required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              image.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Likes: ${image.likes}'),
                Text('Views: ${image.views}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork({
    super.key,
    required this.imageUrl,
    this.fit,
    this.width,
    this.height,
  });

  final String imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: const AssetImage('assets/images/default-image.png'),
      image: NetworkImage(imageUrl),
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'assets/images/default-image.png',
          height: height,
          width: width,
          fit: fit ?? BoxFit.fill,
        );
      },
      fit: fit ?? BoxFit.cover,
      width: width ?? 100,
      height: height ?? 100,
      imageSemanticLabel: 'Dynamic Image From Network',
    );
  }
}

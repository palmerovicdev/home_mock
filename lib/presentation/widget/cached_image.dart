import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/locator.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BorderRadius? borderRadius;

  const CachedImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.placeholder,
    this.errorWidget,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      height: height,
      placeholder: (context, url) =>
          placeholder ??
          Container(
            width: width,
            height: height,
            color: Colors.grey.shade800,
            child: Center(
              child: CircularProgressIndicator(
                color: theme.highlight,
              ),
            ),
          ),
      errorWidget: (context, url, error) {
        debugPrint('❌ CachedImage error: $url - Error: $error');
        return errorWidget ??
            Container(
              width: width,
              height: height,
              color: Colors.grey.shade800,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.broken_image_outlined,
                    color: Colors.white38,
                    size: 48,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Error loading image',
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            );
      },
    );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: imageWidget,
      );
    }

    return imageWidget;
  }
}

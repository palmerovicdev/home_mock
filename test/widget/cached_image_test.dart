import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_mock/presentation/widget/cached_image.dart';

void main() {
  group('CachedImage', () {
    testWidgets('should display image with correct URL', (tester) async {
      const imageUrl = 'https://example.com/test-image.jpg';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CachedImage(imageUrl: imageUrl),
          ),
        ),
      );

      expect(find.byType(CachedImage), findsOneWidget);
    });

    testWidgets('should display placeholder while loading', (tester) async {
      const imageUrl = 'https://example.com/test-image.jpg';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CachedImage(imageUrl: imageUrl),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should display custom placeholder when provided', (
      tester,
    ) async {
      const imageUrl = 'https://example.com/test-image.jpg';
      const customPlaceholder = Text('Loading...');

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CachedImage(
              imageUrl: imageUrl,
              placeholder: customPlaceholder,
            ),
          ),
        ),
      );

      expect(find.text('Loading...'), findsOneWidget);
    });

    testWidgets('should display error widget when image fails to load', (
      tester,
    ) async {
      const imageUrl = 'https://invalid-url.com/test-image.jpg';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CachedImage(imageUrl: imageUrl),
          ),
        ),
      );

      await tester.pump(const Duration(seconds: 2));

      expect(find.byIcon(Icons.broken_image_outlined), findsOneWidget);
      expect(find.text('Error loading image'), findsOneWidget);
    });

    testWidgets('should display custom error widget when provided', (
      tester,
    ) async {
      const imageUrl = 'https://invalid-url.com/test-image.jpg';
      const customErrorWidget = Text('Custom Error');

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CachedImage(
              imageUrl: imageUrl,
              errorWidget: customErrorWidget,
            ),
          ),
        ),
      );

      await tester.pump(const Duration(seconds: 2));

      expect(find.text('Custom Error'), findsOneWidget);
    });

    testWidgets('should apply border radius when provided', (tester) async {
      const imageUrl = 'https://example.com/test-image.jpg';
      const borderRadius = BorderRadius.all(Radius.circular(16));

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CachedImage(
              imageUrl: imageUrl,
              borderRadius: borderRadius,
            ),
          ),
        ),
      );

      expect(find.byType(ClipRRect), findsOneWidget);
    });

    testWidgets('should apply correct dimensions when provided', (
      tester,
    ) async {
      const imageUrl = 'https://example.com/test-image.jpg';
      const width = 200.0;
      const height = 150.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CachedImage(
              imageUrl: imageUrl,
              width: width,
              height: height,
            ),
          ),
        ),
      );

      final cachedImage = tester.widget<CachedImage>(find.byType(CachedImage));
      expect(cachedImage.width, equals(width));
      expect(cachedImage.height, equals(height));
    });

    testWidgets('should apply correct fit when provided', (tester) async {
      const imageUrl = 'https://example.com/test-image.jpg';
      const fit = BoxFit.contain;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CachedImage(
              imageUrl: imageUrl,
              fit: fit,
            ),
          ),
        ),
      );

      final cachedImage = tester.widget<CachedImage>(find.byType(CachedImage));
      expect(cachedImage.fit, equals(fit));
    });

    testWidgets('should use default fit when not provided', (tester) async {
      const imageUrl = 'https://example.com/test-image.jpg';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CachedImage(imageUrl: imageUrl),
          ),
        ),
      );

      final cachedImage = tester.widget<CachedImage>(find.byType(CachedImage));
      expect(cachedImage.fit, equals(BoxFit.cover));
    });
  });
}

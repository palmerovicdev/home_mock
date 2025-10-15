// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/ahouse_apartment.json
  String get ahouseApartment => 'assets/animations/ahouse_apartment.json';

  /// File path: assets/animations/failed.json
  String get failed => 'assets/animations/failed.json';

  /// File path: assets/animations/farm_house.json
  String get farmHouse => 'assets/animations/farm_house.json';

  /// File path: assets/animations/house_loader.json
  String get houseLoader => 'assets/animations/house_loader.json';

  /// File path: assets/animations/info.json
  String get info => 'assets/animations/info.json';

  /// File path: assets/animations/like.json
  String get like => 'assets/animations/like.json';

  /// List of all assets
  List<String> get values => [
    ahouseApartment,
    failed,
    farmHouse,
    houseLoader,
    info,
    like,
  ];
}

class $AssetsThemesGen {
  const $AssetsThemesGen();

  /// File path: assets/themes/blue_dark.json
  String get blueDark => 'assets/themes/blue_dark.json';

  /// File path: assets/themes/blue_light.json
  String get blueLight => 'assets/themes/blue_light.json';

  /// File path: assets/themes/pink_dark.json
  String get pinkDark => 'assets/themes/pink_dark.json';

  /// File path: assets/themes/pink_light.json
  String get pinkLight => 'assets/themes/pink_light.json';

  /// File path: assets/themes/purple_dark.json
  String get purpleDark => 'assets/themes/purple_dark.json';

  /// File path: assets/themes/purple_light.json
  String get purpleLight => 'assets/themes/purple_light.json';

  /// List of all assets
  List<String> get values => [
    blueDark,
    blueLight,
    pinkDark,
    pinkLight,
    purpleDark,
    purpleLight,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const AssetGenImage icon = AssetGenImage('assets/icon.png');
  static const AssetGenImage image = AssetGenImage('assets/image.png');
  static const $AssetsThemesGen themes = $AssetsThemesGen();

  /// List of all assets
  static List<AssetGenImage> get values => [icon, image];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

import 'package:flutter/material.dart';
import 'app_sizes.dart';

/// Constantes de border radius para mantener consistencia visual
///
/// Usa la escala de [AppSizes] para mantener coherencia en toda la app.
class AppRadius {
  AppRadius._();

  // Valores base de radius
  /// 0.0 - Sin radio (esquinas cuadradas)
  static const double none = AppSizes.none;

  /// 2.0
  static const double xxs = AppSizes.xxs;

  /// 4.0
  static const double xs = AppSizes.xs;

  /// 6.0
  static const double sm = AppSizes.sm;

  /// 8.0
  static const double smd = AppSizes.smd;

  /// 10.0
  static const double mds = AppSizes.mds;

  /// 12.0
  static const double md = AppSizes.md;

  /// 14.0
  static const double mdl = AppSizes.mdl;

  /// 16.0
  static const double lg = AppSizes.lg;

  /// 18.0
  static const double lgx = AppSizes.lgx;

  /// 20.0
  static const double xl = AppSizes.xl;

  /// 24.0
  static const double xxl = AppSizes.xxl;

  /// 28.0
  static const double xxxl = AppSizes.xxxl;

  /// 32.0
  static const double huge = AppSizes.huge;

  /// 40.0
  static const double massive = AppSizes.massive;

  /// 48.0
  static const double giant = AppSizes.giant;

  /// 999.0 - Completamente circular (pill shape)
  static const double circular = 999.0;

  // BorderRadius getters - Para Container decoration
  /// 0.0
  static BorderRadius get borderNone => BorderRadius.zero;

  /// 2.0
  static BorderRadius get borderXxs => BorderRadius.circular(xxs);

  /// 4.0
  static BorderRadius get borderXs => BorderRadius.circular(xs);

  /// 6.0
  static BorderRadius get borderSm => BorderRadius.circular(sm);

  /// 8.0
  static BorderRadius get borderSmd => BorderRadius.circular(smd);

  /// 10.0
  static BorderRadius get borderMds => BorderRadius.circular(mds);

  /// 12.0
  static BorderRadius get borderMd => BorderRadius.circular(md);

  /// 14.0
  static BorderRadius get borderMdl => BorderRadius.circular(mdl);

  /// 16.0
  static BorderRadius get borderLg => BorderRadius.circular(lg);

  /// 18.0
  static BorderRadius get borderLgx => BorderRadius.circular(lgx);

  /// 20.0
  static BorderRadius get borderXl => BorderRadius.circular(xl);

  /// 24.0
  static BorderRadius get borderXxl => BorderRadius.circular(xxl);

  /// 28.0
  static BorderRadius get borderXxxl => BorderRadius.circular(xxxl);

  /// 32.0
  static BorderRadius get borderHuge => BorderRadius.circular(huge);

  /// 40.0
  static BorderRadius get borderMassive => BorderRadius.circular(massive);

  /// 48.0
  static BorderRadius get borderGiant => BorderRadius.circular(giant);

  /// 999.0 - Completamente circular
  static BorderRadius get borderCircular => BorderRadius.circular(circular);

  // Radius getters - Para esquinas individuales
  /// 0.0
  static Radius get radiusNone => Radius.zero;

  /// 2.0
  static Radius get radiusXxs => Radius.circular(xxs);

  /// 4.0
  static Radius get radiusXs => Radius.circular(xs);

  /// 6.0
  static Radius get radiusSm => Radius.circular(sm);

  /// 8.0
  static Radius get radiusSmd => Radius.circular(smd);

  /// 10.0
  static Radius get radiusMds => Radius.circular(mds);

  /// 12.0
  static Radius get radiusMd => Radius.circular(md);

  /// 14.0
  static Radius get radiusMdl => Radius.circular(mdl);

  /// 16.0
  static Radius get radiusLg => Radius.circular(lg);

  /// 18.0
  static Radius get radiusLgx => Radius.circular(lgx);

  /// 20.0
  static Radius get radiusXl => Radius.circular(xl);

  /// 24.0
  static Radius get radiusXxl => Radius.circular(xxl);

  /// 28.0
  static Radius get radiusXxxl => Radius.circular(xxxl);

  /// 32.0
  static Radius get radiusHuge => Radius.circular(huge);

  /// 40.0
  static Radius get radiusMassive => Radius.circular(massive);

  /// 48.0
  static Radius get radiusGiant => Radius.circular(giant);

  /// 999.0
  static Radius get radiusCircular => Radius.circular(circular);

  // RoundedRectangleBorder - Para botones y cards
  /// 0.0
  static RoundedRectangleBorder get shapeNone => RoundedRectangleBorder(borderRadius: borderNone);

  /// 2.0
  static RoundedRectangleBorder get shapeXxs => RoundedRectangleBorder(borderRadius: borderXxs);

  /// 4.0
  static RoundedRectangleBorder get shapeXs => RoundedRectangleBorder(borderRadius: borderXs);

  /// 6.0
  static RoundedRectangleBorder get shapeSm => RoundedRectangleBorder(borderRadius: borderSm);

  /// 8.0
  static RoundedRectangleBorder get shapeSmd => RoundedRectangleBorder(borderRadius: borderSmd);

  /// 10.0
  static RoundedRectangleBorder get shapeMds => RoundedRectangleBorder(borderRadius: borderMds);

  /// 12.0
  static RoundedRectangleBorder get shapeMd => RoundedRectangleBorder(borderRadius: borderMd);

  /// 14.0
  static RoundedRectangleBorder get shapeMdl => RoundedRectangleBorder(borderRadius: borderMdl);

  /// 16.0
  static RoundedRectangleBorder get shapeLg => RoundedRectangleBorder(borderRadius: borderLg);

  /// 18.0
  static RoundedRectangleBorder get shapeLgx => RoundedRectangleBorder(borderRadius: borderLgx);

  /// 20.0
  static RoundedRectangleBorder get shapeXl => RoundedRectangleBorder(borderRadius: borderXl);

  /// 24.0
  static RoundedRectangleBorder get shapeXxl => RoundedRectangleBorder(borderRadius: borderXxl);

  /// 28.0
  static RoundedRectangleBorder get shapeXxxl => RoundedRectangleBorder(borderRadius: borderXxxl);

  /// 32.0
  static RoundedRectangleBorder get shapeHuge => RoundedRectangleBorder(borderRadius: borderHuge);

  /// 40.0
  static RoundedRectangleBorder get shapeMassive => RoundedRectangleBorder(borderRadius: borderMassive);

  /// 48.0
  static RoundedRectangleBorder get shapeGiant => RoundedRectangleBorder(borderRadius: borderGiant);

  /// 999.0 - Forma circular
  static RoundedRectangleBorder get shapeCircular => RoundedRectangleBorder(borderRadius: borderCircular);

  // BorderRadius.only() - Top corners
  /// 4.0
  static BorderRadius get borderTopXs => BorderRadius.only(topLeft: radiusXs, topRight: radiusXs);

  /// 6.0
  static BorderRadius get borderTopSm => BorderRadius.only(topLeft: radiusSm, topRight: radiusSm);

  /// 8.0
  static BorderRadius get borderTopSmd => BorderRadius.only(topLeft: radiusSmd, topRight: radiusSmd);

  /// 12.0
  static BorderRadius get borderTopMd => BorderRadius.only(topLeft: radiusMd, topRight: radiusMd);

  /// 16.0
  static BorderRadius get borderTopLg => BorderRadius.only(topLeft: radiusLg, topRight: radiusLg);

  /// 20.0
  static BorderRadius get borderTopXl => BorderRadius.only(topLeft: radiusXl, topRight: radiusXl);

  /// 24.0
  static BorderRadius get borderTopXxl => BorderRadius.only(topLeft: radiusXxl, topRight: radiusXxl);

  /// 32.0
  static BorderRadius get borderTopHuge => BorderRadius.only(topLeft: radiusHuge, topRight: radiusHuge);

  // BorderRadius.only() - Bottom corners
  /// 4.0
  static BorderRadius get borderBottomXs => BorderRadius.only(bottomLeft: radiusXs, bottomRight: radiusXs);

  /// 6.0
  static BorderRadius get borderBottomSm => BorderRadius.only(bottomLeft: radiusSm, bottomRight: radiusSm);

  /// 8.0
  static BorderRadius get borderBottomSmd => BorderRadius.only(bottomLeft: radiusSmd, bottomRight: radiusSmd);

  /// 12.0
  static BorderRadius get borderBottomMd => BorderRadius.only(bottomLeft: radiusMd, bottomRight: radiusMd);

  /// 16.0
  static BorderRadius get borderBottomLg => BorderRadius.only(bottomLeft: radiusLg, bottomRight: radiusLg);

  /// 20.0
  static BorderRadius get borderBottomXl => BorderRadius.only(bottomLeft: radiusXl, bottomRight: radiusXl);

  /// 24.0
  static BorderRadius get borderBottomXxl => BorderRadius.only(bottomLeft: radiusXxl, bottomRight: radiusXxl);

  /// 32.0
  static BorderRadius get borderBottomHuge => BorderRadius.only(bottomLeft: radiusHuge, bottomRight: radiusHuge);

  // BorderRadius.only() - Left corners
  /// 4.0
  static BorderRadius get borderLeftXs => BorderRadius.only(topLeft: radiusXs, bottomLeft: radiusXs);

  /// 6.0
  static BorderRadius get borderLeftSm => BorderRadius.only(topLeft: radiusSm, bottomLeft: radiusSm);

  /// 8.0
  static BorderRadius get borderLeftSmd => BorderRadius.only(topLeft: radiusSmd, bottomLeft: radiusSmd);

  /// 12.0
  static BorderRadius get borderLeftMd => BorderRadius.only(topLeft: radiusMd, bottomLeft: radiusMd);

  /// 16.0
  static BorderRadius get borderLeftLg => BorderRadius.only(topLeft: radiusLg, bottomLeft: radiusLg);

  /// 20.0
  static BorderRadius get borderLeftXl => BorderRadius.only(topLeft: radiusXl, bottomLeft: radiusXl);

  // BorderRadius.only() - Right corners
  /// 4.0
  static BorderRadius get borderRightXs => BorderRadius.only(topRight: radiusXs, bottomRight: radiusXs);

  /// 6.0
  static BorderRadius get borderRightSm => BorderRadius.only(topRight: radiusSm, bottomRight: radiusSm);

  /// 8.0
  static BorderRadius get borderRightSmd => BorderRadius.only(topRight: radiusSmd, bottomRight: radiusSmd);

  /// 12.0
  static BorderRadius get borderRightMd => BorderRadius.only(topRight: radiusMd, bottomRight: radiusMd);

  /// 16.0
  static BorderRadius get borderRightLg => BorderRadius.only(topRight: radiusLg, bottomRight: radiusLg);

  /// 20.0
  static BorderRadius get borderRightXl => BorderRadius.only(topRight: radiusXl, bottomRight: radiusXl);
}

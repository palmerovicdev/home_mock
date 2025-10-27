import 'package:flutter/material.dart';
import 'app_sizes.dart';

/// Constantes de espaciado para mantener consistencia en padding y margin
///
/// Usa la escala de [AppSizes] para mantener coherencia en toda la app.
class AppSpacing {
  AppSpacing._();

  // Valores base de espaciado
  /// 0.0
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

  /// 56.0
  static const double mega = AppSizes.mega;

  /// 64.0
  static const double ultra = AppSizes.ultra;

  // EdgeInsets.all() - Padding en todos los lados
  /// 0.0
  static const EdgeInsets paddingNone = EdgeInsets.zero;

  /// 2.0
  static const EdgeInsets paddingXxs = EdgeInsets.all(xxs);

  /// 4.0
  static const EdgeInsets paddingXs = EdgeInsets.all(xs);

  /// 6.0
  static const EdgeInsets paddingSm = EdgeInsets.all(sm);

  /// 8.0
  static const EdgeInsets paddingSmd = EdgeInsets.all(smd);

  /// 10.0
  static const EdgeInsets paddingMds = EdgeInsets.all(mds);

  /// 12.0
  static const EdgeInsets paddingMd = EdgeInsets.all(md);

  /// 14.0
  static const EdgeInsets paddingMdl = EdgeInsets.all(mdl);

  /// 16.0
  static const EdgeInsets paddingLg = EdgeInsets.all(lg);

  /// 18.0
  static const EdgeInsets paddingLgx = EdgeInsets.all(lgx);

  /// 20.0
  static const EdgeInsets paddingXl = EdgeInsets.all(xl);

  /// 24.0
  static const EdgeInsets paddingXxl = EdgeInsets.all(xxl);

  /// 28.0
  static const EdgeInsets paddingXxxl = EdgeInsets.all(xxxl);

  /// 32.0
  static const EdgeInsets paddingHuge = EdgeInsets.all(huge);

  /// 40.0
  static const EdgeInsets paddingMassive = EdgeInsets.all(massive);

  /// 48.0
  static const EdgeInsets paddingGiant = EdgeInsets.all(giant);

  /// 56.0
  static const EdgeInsets paddingMega = EdgeInsets.all(mega);

  /// 64.0
  static const EdgeInsets paddingUltra = EdgeInsets.all(ultra);

  // EdgeInsets.symmetric(horizontal) - Padding horizontal
  /// 0.0
  static const EdgeInsets horizontalNone = EdgeInsets.zero;

  /// 2.0
  static const EdgeInsets horizontalXxs = EdgeInsets.symmetric(horizontal: xxs);

  /// 4.0
  static const EdgeInsets horizontalXs = EdgeInsets.symmetric(horizontal: xs);

  /// 6.0
  static const EdgeInsets horizontalSm = EdgeInsets.symmetric(horizontal: sm);

  /// 8.0
  static const EdgeInsets horizontalSmd = EdgeInsets.symmetric(horizontal: smd);

  /// 10.0
  static const EdgeInsets horizontalMds = EdgeInsets.symmetric(horizontal: mds);

  /// 12.0
  static const EdgeInsets horizontalMd = EdgeInsets.symmetric(horizontal: md);

  /// 14.0
  static const EdgeInsets horizontalMdl = EdgeInsets.symmetric(horizontal: mdl);

  /// 16.0
  static const EdgeInsets horizontalLg = EdgeInsets.symmetric(horizontal: lg);

  /// 18.0
  static const EdgeInsets horizontalLgx = EdgeInsets.symmetric(horizontal: lgx);

  /// 20.0
  static const EdgeInsets horizontalXl = EdgeInsets.symmetric(horizontal: xl);

  /// 24.0
  static const EdgeInsets horizontalXxl = EdgeInsets.symmetric(horizontal: xxl);

  /// 28.0
  static const EdgeInsets horizontalXxxl = EdgeInsets.symmetric(horizontal: xxxl);

  /// 32.0
  static const EdgeInsets horizontalHuge = EdgeInsets.symmetric(horizontal: huge);

  /// 40.0
  static const EdgeInsets horizontalMassive = EdgeInsets.symmetric(horizontal: massive);

  /// 48.0
  static const EdgeInsets horizontalGiant = EdgeInsets.symmetric(horizontal: giant);

  /// 56.0
  static const EdgeInsets horizontalMega = EdgeInsets.symmetric(horizontal: mega);

  /// 64.0
  static const EdgeInsets horizontalUltra = EdgeInsets.symmetric(horizontal: ultra);

  // EdgeInsets.symmetric(vertical) - Padding vertical
  /// 0.0
  static const EdgeInsets verticalNone = EdgeInsets.zero;

  /// 2.0
  static const EdgeInsets verticalXxs = EdgeInsets.symmetric(vertical: xxs);

  /// 4.0
  static const EdgeInsets verticalXs = EdgeInsets.symmetric(vertical: xs);

  /// 6.0
  static const EdgeInsets verticalSm = EdgeInsets.symmetric(vertical: sm);

  /// 8.0
  static const EdgeInsets verticalSmd = EdgeInsets.symmetric(vertical: smd);

  /// 10.0
  static const EdgeInsets verticalMds = EdgeInsets.symmetric(vertical: mds);

  /// 12.0
  static const EdgeInsets verticalMd = EdgeInsets.symmetric(vertical: md);

  /// 14.0
  static const EdgeInsets verticalMdl = EdgeInsets.symmetric(vertical: mdl);

  /// 16.0
  static const EdgeInsets verticalLg = EdgeInsets.symmetric(vertical: lg);

  /// 18.0
  static const EdgeInsets verticalLgx = EdgeInsets.symmetric(vertical: lgx);

  /// 20.0
  static const EdgeInsets verticalXl = EdgeInsets.symmetric(vertical: xl);

  /// 24.0
  static const EdgeInsets verticalXxl = EdgeInsets.symmetric(vertical: xxl);

  /// 28.0
  static const EdgeInsets verticalXxxl = EdgeInsets.symmetric(vertical: xxxl);

  /// 32.0
  static const EdgeInsets verticalHuge = EdgeInsets.symmetric(vertical: huge);

  /// 40.0
  static const EdgeInsets verticalMassive = EdgeInsets.symmetric(vertical: massive);

  /// 48.0
  static const EdgeInsets verticalGiant = EdgeInsets.symmetric(vertical: giant);

  /// 56.0
  static const EdgeInsets verticalMega = EdgeInsets.symmetric(vertical: mega);

  /// 64.0
  static const EdgeInsets verticalUltra = EdgeInsets.symmetric(vertical: ultra);

  // SizedBox - Gaps verticales
  /// 0.0
  static const SizedBox gapNone = SizedBox.shrink();

  /// 2.0
  static const SizedBox gapXxs = SizedBox(height: xxs);

  /// 4.0
  static const SizedBox gapXs = SizedBox(height: xs);

  /// 6.0
  static const SizedBox gapSm = SizedBox(height: sm);

  /// 8.0
  static const SizedBox gapSmd = SizedBox(height: smd);

  /// 10.0
  static const SizedBox gapMds = SizedBox(height: mds);

  /// 12.0
  static const SizedBox gapMd = SizedBox(height: md);

  /// 14.0
  static const SizedBox gapMdl = SizedBox(height: mdl);

  /// 16.0
  static const SizedBox gapLg = SizedBox(height: lg);

  /// 18.0
  static const SizedBox gapLgx = SizedBox(height: lgx);

  /// 20.0
  static const SizedBox gapXl = SizedBox(height: xl);

  /// 24.0
  static const SizedBox gapXxl = SizedBox(height: xxl);

  /// 28.0
  static const SizedBox gapXxxl = SizedBox(height: xxxl);

  /// 32.0
  static const SizedBox gapHuge = SizedBox(height: huge);

  /// 40.0
  static const SizedBox gapMassive = SizedBox(height: massive);

  /// 48.0
  static const SizedBox gapGiant = SizedBox(height: giant);

  /// 56.0
  static const SizedBox gapMega = SizedBox(height: mega);

  /// 64.0
  static const SizedBox gapUltra = SizedBox(height: ultra);

  // SizedBox - Gaps horizontales
  /// 0.0
  static const SizedBox gapHorizontalNone = SizedBox.shrink();

  /// 2.0
  static const SizedBox gapHorizontalXxs = SizedBox(width: xxs);

  /// 4.0
  static const SizedBox gapHorizontalXs = SizedBox(width: xs);

  /// 6.0
  static const SizedBox gapHorizontalSm = SizedBox(width: sm);

  /// 8.0
  static const SizedBox gapHorizontalSmd = SizedBox(width: smd);

  /// 10.0
  static const SizedBox gapHorizontalMds = SizedBox(width: mds);

  /// 12.0
  static const SizedBox gapHorizontalMd = SizedBox(width: md);

  /// 14.0
  static const SizedBox gapHorizontalMdl = SizedBox(width: mdl);

  /// 16.0
  static const SizedBox gapHorizontalLg = SizedBox(width: lg);

  /// 18.0
  static const SizedBox gapHorizontalLgx = SizedBox(width: lgx);

  /// 20.0
  static const SizedBox gapHorizontalXl = SizedBox(width: xl);

  /// 24.0
  static const SizedBox gapHorizontalXxl = SizedBox(width: xxl);

  /// 28.0
  static const SizedBox gapHorizontalXxxl = SizedBox(width: xxxl);

  /// 32.0
  static const SizedBox gapHorizontalHuge = SizedBox(width: huge);

  /// 40.0
  static const SizedBox gapHorizontalMassive = SizedBox(width: massive);

  /// 48.0
  static const SizedBox gapHorizontalGiant = SizedBox(width: giant);

  /// 56.0
  static const SizedBox gapHorizontalMega = SizedBox(width: mega);

  /// 64.0
  static const SizedBox gapHorizontalUltra = SizedBox(width: ultra);
}

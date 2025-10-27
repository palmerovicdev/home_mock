import 'app_sizes.dart';

/// Constantes de UI adicionales para la aplicación
///
/// Usa la escala de [AppSizes] para mantener coherencia.
/// Este archivo solo contiene valores que no se repiten en otros archivos.
class AppUI {
  AppUI._();

  // Elevaciones - Delega a AppSizes
  /// 0.0
  static const double elevationNone = AppSizes.elevationNone;

  /// 1.0
  static const double elevationXs = AppSizes.elevationXs;

  /// 2.0
  static const double elevationSm = AppSizes.elevationSm;

  /// 4.0
  static const double elevationMd = AppSizes.elevationMd;

  /// 6.0
  static const double elevationLg = AppSizes.elevationLg;

  /// 8.0
  static const double elevationXl = AppSizes.elevationXl;

  /// 12.0
  static const double elevationXxl = AppSizes.elevationXxl;

  /// 16.0
  static const double elevationHuge = AppSizes.elevationHuge;

  /// 24.0
  static const double elevationMassive = AppSizes.elevationMassive;

  // Opacidades - Delega a AppSizes
  /// 0.0 - Transparente
  static const double opacityNone = AppSizes.opacityNone;

  /// 0.12 - Hover/Press
  static const double opacityHover = AppSizes.opacityHover;

  /// 0.38 - Deshabilitado
  static const double opacityDisabled = AppSizes.opacityDisabled;

  /// 0.54 - Texto secundario
  static const double opacityMedium = AppSizes.opacityMedium;

  /// 0.70 - Medio alto
  static const double opacityMediumHigh = AppSizes.opacityMediumHigh;

  /// 0.87 - Texto activo
  static const double opacityHigh = AppSizes.opacityHigh;

  /// 1.0 - Opaco
  static const double opacityFull = AppSizes.opacityFull;

  // Tamaños de iconos - Delega a AppSizes
  /// 12.0
  static const double iconXs = AppSizes.iconXs;

  /// 16.0
  static const double iconSm = AppSizes.iconSm;

  /// 20.0
  static const double iconMd = AppSizes.iconMd;

  /// 24.0 - Tamaño estándar Material
  static const double iconLg = AppSizes.iconLg;

  /// 32.0
  static const double iconXl = AppSizes.iconXl;

  /// 40.0
  static const double iconXxl = AppSizes.iconXxl;

  /// 48.0
  static const double iconHuge = AppSizes.iconHuge;

  // Tamaños de avatares - Delega a AppSizes
  /// 24.0
  static const double avatarXs = AppSizes.avatarXs;

  /// 32.0
  static const double avatarSm = AppSizes.avatarSm;

  /// 40.0
  static const double avatarMd = AppSizes.avatarMd;

  /// 48.0
  static const double avatarLg = AppSizes.avatarLg;

  /// 64.0
  static const double avatarXl = AppSizes.avatarXl;

  /// 80.0
  static const double avatarXxl = AppSizes.avatarXxl;

  /// 96.0
  static const double avatarHuge = AppSizes.avatarHuge;

  /// 128.0
  static const double avatarMassive = AppSizes.avatarMassive;

  // Anchos máximos - Delega a AppSizes
  /// 600.0
  static const double maxMobileWidth = AppSizes.maxMobileWidth;

  /// 900.0
  static const double maxTabletWidth = AppSizes.maxTabletWidth;

  /// 1200.0
  static const double maxDesktopWidth = AppSizes.maxDesktopWidth;

  /// 1536.0
  static const double maxContentWidth = AppSizes.maxContentWidth;

  // Aspect Ratios - Delega a AppSizes
  /// 1.0 - Cuadrado (1:1)
  static const double aspectRatioSquare = AppSizes.aspectRatioSquare;

  /// 1.33 - Estándar (4:3)
  static const double aspectRatioStandard = AppSizes.aspectRatioStandard;

  /// 1.5 - Foto (3:2)
  static const double aspectRatioPhoto = AppSizes.aspectRatioPhoto;

  /// 1.78 - Widescreen (16:9)
  static const double aspectRatioWide = AppSizes.aspectRatioWide;

  /// 2.35 - Cinemático (21:9)
  static const double aspectRatioCinematic = AppSizes.aspectRatioCinematic;
}

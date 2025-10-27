/// Sistema de escalado base para toda la aplicación
///
/// Define los tamaños fundamentales que se reutilizan en spacing, radius, etc.
/// Usa una escala consistente y semántica.
class AppSizes {
  AppSizes._();

  // Escala base (0-10)
  /// 0.0 - Sin tamaño
  static const double none = 0.0;

  /// 2.0 - Extra extra pequeño
  static const double xxs = 2.0;

  /// 4.0 - Extra pequeño
  static const double xs = 4.0;

  /// 6.0 - Muy pequeño
  static const double sm = 6.0;

  /// 8.0 - Pequeño a mediano
  static const double smd = 8.0;

  /// 10.0 - Mediano pequeño
  static const double mds = 10.0;

  /// 12.0 - Mediano
  static const double md = 12.0;

  /// 14.0 - Mediano a largo
  static const double mdl = 14.0;

  /// 16.0 - Largo
  static const double lg = 16.0;

  /// 18.0 - Largo a extra largo
  static const double lgx = 18.0;

  /// 20.0 - Extra largo
  static const double xl = 20.0;

  /// 24.0 - Extra extra largo
  static const double xxl = 24.0;

  /// 28.0 - Extra extra extra largo
  static const double xxxl = 28.0;

  /// 32.0 - Enorme
  static const double huge = 32.0;

  /// 40.0 - Masivo
  static const double massive = 40.0;

  /// 48.0 - Gigante
  static const double giant = 48.0;

  /// 56.0 - Mega
  static const double mega = 56.0;

  /// 64.0 - Ultra
  static const double ultra = 64.0;

  /// 80.0 - Extremo
  static const double extreme = 80.0;

  /// 96.0 - Colosal
  static const double colossal = 96.0;

  // Tamaños de iconos (basados en Material Design)
  /// 12.0
  static const double iconXs = 12.0;

  /// 16.0
  static const double iconSm = 16.0;

  /// 20.0
  static const double iconMd = 20.0;

  /// 24.0 - Tamaño estándar de Material
  static const double iconLg = 24.0;

  /// 32.0
  static const double iconXl = 32.0;

  /// 40.0
  static const double iconXxl = 40.0;

  /// 48.0
  static const double iconHuge = 48.0;

  // Tamaños de avatares
  /// 24.0
  static const double avatarXs = 24.0;

  /// 32.0
  static const double avatarSm = 32.0;

  /// 40.0
  static const double avatarMd = 40.0;

  /// 48.0
  static const double avatarLg = 48.0;

  /// 64.0
  static const double avatarXl = 64.0;

  /// 80.0
  static const double avatarXxl = 80.0;

  /// 96.0
  static const double avatarHuge = 96.0;

  /// 128.0
  static const double avatarMassive = 128.0;

  // Anchos máximos (breakpoints)
  /// 600.0 - Ancho máximo para móvil
  static const double maxMobileWidth = 600.0;

  /// 900.0 - Ancho máximo para tablet
  static const double maxTabletWidth = 900.0;

  /// 1200.0 - Ancho máximo para desktop
  static const double maxDesktopWidth = 1200.0;

  /// 1536.0 - Ancho máximo para contenido
  static const double maxContentWidth = 1536.0;

  // Elevaciones (Material Design)
  /// 0.0
  static const double elevationNone = 0.0;

  /// 1.0
  static const double elevationXs = 1.0;

  /// 2.0
  static const double elevationSm = 2.0;

  /// 4.0
  static const double elevationMd = 4.0;

  /// 6.0
  static const double elevationLg = 6.0;

  /// 8.0
  static const double elevationXl = 8.0;

  /// 12.0
  static const double elevationXxl = 12.0;

  /// 16.0
  static const double elevationHuge = 16.0;

  /// 24.0
  static const double elevationMassive = 24.0;

  // Opacidades (Material Design)
  /// 0.0 - Transparente
  static const double opacityNone = 0.0;

  /// 0.12 - Hover/Press sobre superficie
  static const double opacityHover = 0.12;

  /// 0.38 - Deshabilitado
  static const double opacityDisabled = 0.38;

  /// 0.54 - Texto secundario
  static const double opacityMedium = 0.54;

  /// 0.70 - Medio alto
  static const double opacityMediumHigh = 0.70;

  /// 0.87 - Texto activo
  static const double opacityHigh = 0.87;

  /// 1.0 - Opaco
  static const double opacityFull = 1.0;

  // Aspect Ratios
  /// 1.0 - Cuadrado (1:1)
  static const double aspectRatioSquare = 1.0;

  /// 1.33 - Estándar (4:3)
  static const double aspectRatioStandard = 4 / 3;

  /// 1.5 - Foto (3:2)
  static const double aspectRatioPhoto = 3 / 2;

  /// 1.78 - Widescreen (16:9)
  static const double aspectRatioWide = 16 / 9;

  /// 2.35 - Cinemático (21:9)
  static const double aspectRatioCinematic = 21 / 9;
}


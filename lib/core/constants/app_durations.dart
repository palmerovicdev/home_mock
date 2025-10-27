/// Constantes de duración para animaciones y delays en toda la aplicación
///
/// Usa nomenclatura consistente: xs, sm, md, lg, xl para tiempos de animación
/// y nombres específicos para delays de features específicas.
class AppDurations {
  AppDurations._();

  // Duraciones de animación base
  /// 50ms - Ultra rápido
  static const xxs = Duration(milliseconds: 50);

  /// 100ms - Extra rápido
  static const xs = Duration(milliseconds: 100);

  /// 150ms - Muy rápido
  static const sm = Duration(milliseconds: 150);

  /// 200ms - Rápido (ideal para micro-interacciones)
  static const smd = Duration(milliseconds: 200);

  /// 250ms - Mediano rápido
  static const mds = Duration(milliseconds: 250);

  /// 300ms - Mediano (ideal para la mayoría de animaciones)
  static const md = Duration(milliseconds: 300);

  /// 350ms - Mediano lento
  static const mdl = Duration(milliseconds: 350);

  /// 400ms - Lento
  static const lg = Duration(milliseconds: 400);

  /// 500ms - Extra lento
  static const xl = Duration(milliseconds: 500);

  /// 600ms - Extra extra lento
  static const xxl = Duration(milliseconds: 600);

  /// 800ms - Muy lento
  static const xxxl = Duration(milliseconds: 800);

  /// 1000ms (1 segundo) - Enorme
  static const huge = Duration(milliseconds: 1000);

  /// 1500ms (1.5 segundos) - Masivo
  static const massive = Duration(milliseconds: 1500);

  /// 2000ms (2 segundos) - Gigante
  static const giant = Duration(milliseconds: 2000);

  /// 3000ms (3 segundos) - Mega
  static const mega = Duration(milliseconds: 3000);

  // Delays específicos por feature
  /// 1500ms - Delay simulado para llamadas API en modo mock
  static const apiSimulatedDelay = massive;

  /// 1500ms - Duración de la animación shimmer de carga
  static const shimmerAnimation = massive;

  /// 300ms - Debounce para búsqueda (evita llamadas API excesivas)
  static const searchDebounce = md;

  /// 400ms - Debounce para filtros
  static const filterDebounce = lg;

  /// 200ms - Debounce rápido para inputs simples
  static const quickDebounce = smd;

  /// 500ms - Timeout para tooltips
  static const tooltipDelay = xl;

  /// 2000ms - Duración para mostrar snackbars/toasts
  static const snackbarDuration = giant;

  /// 150ms - Duración de página de transición
  static const pageTransition = sm;

  /// 100ms - Duración de hover effects
  static const hoverEffect = xs;

  /// 200ms - Duración de ripple effects
  static const rippleEffect = smd;

  // Nombres legacy (mantener por compatibilidad temporal)
  /// @deprecated Use [xs] instead
  static const ultraFast = xs;

  /// @deprecated Use [smd] instead
  static const fast = smd;

  /// @deprecated Use [md] instead
  static const medium = md;

  /// @deprecated Use [lg] instead
  static const slow = lg;

  /// @deprecated Use [xxxl] instead
  static const verySlow = xxxl;
}

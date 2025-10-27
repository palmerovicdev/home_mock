# Sistema de Constantes de Diseño

Sistema estandarizado de constantes para mantener consistencia visual en toda la aplicación.

## 📐 Arquitectura

### 1. **AppSizes** - Base de todo el sistema
Define los tamaños fundamentales que se reutilizan en todo el sistema.

```dart
// Escala base
AppSizes.xxs  // 2.0
AppSizes.xs   // 4.0
AppSizes.sm   // 6.0
AppSizes.smd  // 8.0  (small-to-medium)
AppSizes.mds  // 10.0 (medium-to-small)
AppSizes.md   // 12.0
AppSizes.mdl  // 14.0 (medium-to-large)
AppSizes.lg   // 16.0
AppSizes.lgx  // 18.0 (large-extra)
AppSizes.xl   // 20.0
AppSizes.xxl  // 24.0
AppSizes.xxxl // 28.0
AppSizes.huge     // 32.0
AppSizes.massive  // 40.0
AppSizes.giant    // 48.0
AppSizes.mega     // 56.0
AppSizes.ultra    // 64.0
AppSizes.extreme  // 80.0
AppSizes.colossal // 96.0
```

### 2. **AppSpacing** - Espaciado (padding, margin, gaps)
Usa `AppSizes` internamente para consistencia.

```dart
// Valores base
AppSpacing.md // 12.0

// EdgeInsets.all()
AppSpacing.paddingMd // EdgeInsets.all(12.0)

// EdgeInsets.symmetric(horizontal)
AppSpacing.horizontalMd // EdgeInsets.symmetric(horizontal: 12.0)

// EdgeInsets.symmetric(vertical)
AppSpacing.verticalMd // EdgeInsets.symmetric(vertical: 12.0)

// SizedBox vertical
AppSpacing.gapMd // SizedBox(height: 12.0)

// SizedBox horizontal
AppSpacing.gapHorizontalMd // SizedBox(width: 12.0)
```

### 3. **AppRadius** - Bordes redondeados
Usa `AppSizes` internamente para consistencia.

```dart
// Valores base
AppRadius.md // 12.0

// BorderRadius
AppRadius.borderMd // BorderRadius.circular(12.0)

// Radius individual
AppRadius.radiusMd // Radius.circular(12.0)

// RoundedRectangleBorder
AppRadius.shapeMd // RoundedRectangleBorder(borderRadius: ...)

// Esquinas específicas
AppRadius.borderTopMd    // Solo top
AppRadius.borderBottomMd // Solo bottom
AppRadius.borderLeftMd   // Solo left
AppRadius.borderRightMd  // Solo right

// Circular completo
AppRadius.circular // 999.0 (pill shape)
```

### 4. **AppDurations** - Duraciones de animación
Sigue la misma nomenclatura.

```dart
AppDurations.xxs  // 50ms
AppDurations.xs   // 100ms
AppDurations.sm   // 150ms
AppDurations.smd  // 200ms
AppDurations.md   // 300ms
AppDurations.lg   // 400ms
AppDurations.xl   // 500ms
AppDurations.xxl  // 600ms
AppDurations.xxxl // 800ms
AppDurations.huge    // 1000ms
AppDurations.massive // 1500ms
AppDurations.giant   // 2000ms
AppDurations.mega    // 3000ms

// Específicos
AppDurations.searchDebounce
AppDurations.pageTransition
AppDurations.hoverEffect
```

### 5. **AppUI** - Constantes de UI
Delega a `AppSizes` para evitar duplicación.

```dart
// Elevaciones
AppUI.elevationMd // 4.0

// Opacidades
AppUI.opacityDisabled // 0.38
AppUI.opacityMedium   // 0.54
AppUI.opacityHigh     // 0.87

// Iconos
AppUI.iconSm   // 16.0
AppUI.iconMd   // 20.0
AppUI.iconLg   // 24.0

// Avatares
AppUI.avatarSm // 32.0
AppUI.avatarMd // 40.0
AppUI.avatarLg // 48.0

// Breakpoints
AppUI.maxMobileWidth  // 600.0
AppUI.maxTabletWidth  // 900.0
AppUI.maxDesktopWidth // 1200.0

// Aspect Ratios
AppUI.aspectRatioSquare // 1.0
AppUI.aspectRatioWide   // 16/9
```

## 🎯 Nomenclatura Estandarizada

Todas las constantes siguen el mismo patrón de nombres:

| Nombre | Valor típico | Uso |
|--------|--------------|-----|
| `none` | 0 | Sin valor |
| `xxs` | 2-50 | Extra extra pequeño |
| `xs` | 4-100 | Extra pequeño |
| `sm` | 6-150 | Pequeño |
| `smd` | 8-200 | Pequeño a mediano |
| `mds` | 10-250 | Mediano pequeño |
| `md` | 12-300 | **Mediano (valor por defecto)** |
| `mdl` | 14-350 | Mediano a largo |
| `lg` | 16-400 | Largo |
| `lgx` | 18 | Largo extra |
| `xl` | 20-500 | Extra largo |
| `xxl` | 24-600 | Extra extra largo |
| `xxxl` | 28-800 | Extra extra extra largo |
| `huge` | 32-1000 | Enorme |
| `massive` | 40-1500 | Masivo |
| `giant` | 48-2000 | Gigante |
| `mega` | 56-3000 | Mega |
| `ultra` | 64 | Ultra |
| `extreme` | 80 | Extremo |
| `colossal` | 96 | Colosal |

## 📦 Uso

### Importación simple
```dart
import 'package:home_mock/core/constants/constants.dart';
```

### Ejemplos

```dart
// Padding
Container(
  padding: AppSpacing.paddingMd,
  child: ...,
)

// Gap entre widgets
Column(
  children: [
    Text('Title'),
    AppSpacing.gapMd,
    Text('Subtitle'),
  ],
)

// Border radius
Container(
  decoration: BoxDecoration(
    borderRadius: AppRadius.borderLg,
  ),
)

// Botón con forma
ElevatedButton(
  style: ElevatedButton.styleFrom(
    shape: AppRadius.shapeMd,
    elevation: AppUI.elevationMd,
  ),
)

// Animación
AnimatedContainer(
  duration: AppDurations.md,
  curve: Curves.easeInOut,
)
```

## ✅ Beneficios

1. **✨ Consistencia**: Misma escala en toda la app
2. **🔧 Mantenibilidad**: Cambios centralizados
3. **📖 Legibilidad**: Nombres semánticos claros
4. **🚫 Sin duplicación**: Un solo lugar para cada valor
5. **💡 Autocompletado**: Fácil de descubrir en el IDE
6. **📏 Escalable**: Fácil agregar nuevos valores

## 🔄 Migración desde código legacy

Si encuentras código con valores antiguos, usa esta guía:

```dart
// ❌ Antes
EdgeInsets.all(16.0)
BorderRadius.circular(14.0)
Duration(milliseconds: 300)

// ✅ Después
AppSpacing.paddingLg
AppRadius.borderMdl
AppDurations.md
```

## 🎨 Design Tokens

Este sistema actúa como **Design Tokens** de la app, similar a:
- Material Design tokens
- Tailwind CSS utilities
- Bootstrap spacing system
- Chakra UI tokens

## 📝 Notas

- Todos los archivos son **const** para optimización
- Los valores están **documentados** con comentarios
- La escala es **progresiva** y lógica
- Compatibilidad con **Material Design 3**


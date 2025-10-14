# 🏠 Home Mock - Flutter Property Finder App

Una aplicación Flutter moderna para buscar y explorar propiedades (casas y apartamentos) con una interfaz elegante y funcionalidades avanzadas.

## 📱 Características Principales

### ✅ Pantalla Principal (Home)
- **Lista de propiedades** con imágenes, nombre, precio y ciudad
- **Scroll infinito** con paginación automática
- **Barra de búsqueda** para filtrar por nombre o ciudad
- **Filtros por categoría** (Apartamentos, Casas, Todos)
- **Modo oscuro/claro** con toggle dinámico
- **Animaciones sutiles** en navegación y interacciones

### ✅ Pantalla de Detalle
- **Imagen grande** con efecto Hero para transiciones suaves
- **Información completa**: nombre, precio, descripción, características
- **Botón de favorito** con persistencia en memoria
- **Información del propietario** con opciones de contacto
- **Características detalladas**: tamaño, habitaciones, baños
- **Botón de compra** con precio destacado

### ✅ Funcionalidades Avanzadas
- **Cache de imágenes** con `cached_network_image`
- **Modo oscuro** completamente funcional
- **Animaciones fluidas** con `flutter_motionly`
- **Arquitectura limpia** con BLoC pattern
- **Navegación moderna** con GoRouter

## 🏗️ Arquitectura

La aplicación sigue una **arquitectura limpia** con separación clara de responsabilidades:

```
lib/
├── core/                    # Configuración base
│   ├── locator.dart        # Dependency injection
│   ├── theme.dart          # Sistema de temas
│   └── router/             # Configuración de rutas
├── data/                   # Capa de datos
│   ├── api/                # API simulada
│   └── repository/         # Repositorios
├── model/                  # Entidades y modelos
│   └── entity/            # Modelos de datos
├── presentation/           # Capa de presentación
│   ├── page/              # Pantallas
│   ├── state/             # BLoC (estado, eventos)
│   └── widget/            # Widgets reutilizables
└── service/               # Servicios de negocio
```

### Patrón BLoC
- **HomesBloc**: Maneja el estado de la lista de propiedades
- **HomesState**: Estado inmutable con todas las propiedades
- **HomesEvent**: Eventos para cambiar el estado
- **Separación clara** entre lógica de negocio y UI

## 🎨 Diseño UI/UX

### Material Design 3
- **Sistema de colores** personalizado con soporte para modo oscuro
- **Tipografía** consistente y legible
- **Espaciado** armonioso siguiendo las guías de Material Design
- **Componentes** modernos con bordes redondeados y sombras sutiles

### Características de Diseño
- **Layout responsivo** que se adapta a tablets y móviles
- **Grid adaptativo** (2 columnas en móvil, 3 en tablet)
- **Hero animations** para transiciones suaves
- **Ripple effects** personalizados
- **Gradientes** y efectos visuales modernos

## 📊 Datos

### API Simulada
La aplicación utiliza una **API simulada** que genera datos realistas:

```dart
// Estructura de datos
{
  "id": "home_1",
  "title": "BF Brockly #1",
  "city": "Sibgong",
  "price": 1200,
  "image": "https://picsum.photos/id/1/1200/1200",
  "description": "A nice apartment located in the city center...",
  "category": "apartment",
  "size": "120 m²",
  "bedrooms": 2,
  "bathrooms": 1,
  "owner": {
    "name": "John Doe",
    "avatarUrl": "https://i.pravatar.cc/150?img=1",
    "city": "New York"
  }
}
```

### Características de los Datos
- **8 propiedades por página** con paginación
- **Búsqueda en tiempo real** por título y ciudad
- **Filtrado por categoría** (apartamento/casa)
- **Datos aleatorios** pero consistentes por página
- **Imágenes de alta calidad** desde Picsum Photos

## 🚀 Tecnologías Utilizadas

### Dependencias Principales
- **flutter_bloc**: Gestión de estado reactiva
- **go_router**: Navegación moderna y declarativa
- **cached_network_image**: Cache inteligente de imágenes
- **dio**: Cliente HTTP (preparado para APIs reales)
- **get_it**: Inyección de dependencias
- **freezed**: Generación de código para modelos inmutables
- **flutter_motionly**: Animaciones personalizadas

### Herramientas de Desarrollo
- **json_serializable**: Serialización automática de JSON
- **build_runner**: Generación de código
- **flutter_lints**: Análisis estático de código
- **flutter_native_splash**: Pantalla de carga personalizada

## 📱 Capturas de Pantalla

### Pantalla Principal
- Lista de propiedades con scroll infinito
- Barra de búsqueda funcional
- Filtros por categoría
- Modo oscuro/claro

### Pantalla de Detalle
- Imagen grande con efecto Hero
- Información completa de la propiedad
- Botón de favorito persistente
- Información del propietario

## 🛠️ Instalación y Configuración

### Prerrequisitos
- Flutter SDK 3.9.2 o superior
- Dart SDK compatible
- Android Studio / VS Code
- Dispositivo o emulador

### Pasos de Instalación

1. **Clonar el repositorio**
```bash
git clone <repository-url>
cd home_mock
```

2. **Instalar dependencias**
```bash
flutter pub get
```

3. **Generar código**
```bash
flutter packages pub run build_runner build
```

4. **Ejecutar la aplicación**
```bash
flutter run
```

### Configuración Adicional

- **Splash Screen**: Configurada automáticamente
- **Iconos**: Generados automáticamente desde `assets/image.png`
- **Temas**: Sistema dual (claro/oscuro) configurado

## 🧪 Testing

La aplicación está preparada para testing con:
- **Estructura modular** que facilita unit tests
- **BLoC pattern** que permite testing de lógica de negocio
- **Dependency injection** para mocking de servicios
- **Widgets reutilizables** para widget testing

## 🎯 Funcionalidades Implementadas

### ✅ Requisitos Básicos
- [x] Lista de propiedades con imagen, nombre, precio y ciudad
- [x] Scroll infinito con paginación
- [x] Barra de búsqueda por nombre o ciudad
- [x] Pantalla de detalle completa
- [x] Botón de favorito con persistencia
- [x] API simulada con datos realistas
- [x] Arquitectura limpia con BLoC
- [x] Material Design responsivo

### ✅ Funcionalidades Extra
- [x] Modo oscuro completo
- [x] Cache de imágenes optimizado
- [x] Animaciones sutiles y fluidas
- [x] Diseño responsivo para tablets
- [x] Hero animations para transiciones
- [x] Sistema de temas personalizado
- [x] Filtros por categoría
- [x] Información detallada del propietario

## 👨‍💻 Desarrollo

Este proyecto fue desarrollado como una **prueba técnica** demostrando:
- Conocimiento de Flutter y Dart
- Arquitectura limpia y escalable
- Buenas prácticas de desarrollo
- UI/UX moderno y funcional
- Gestión de estado reactiva

---

**Desarrollado con ❤️ usando Flutter**

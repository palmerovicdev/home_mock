import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// Título de la aplicación
  ///
  /// In es, this message translates to:
  /// **'Home Mock'**
  String get appTitle;

  /// Pantalla de inicio
  ///
  /// In es, this message translates to:
  /// **'Inicio'**
  String get home;

  /// Pantalla de ajustes
  ///
  /// In es, this message translates to:
  /// **'Ajustes'**
  String get settings;

  /// Acción de búsqueda
  ///
  /// In es, this message translates to:
  /// **'Buscar'**
  String get search;

  /// Placeholder del buscador de casas
  ///
  /// In es, this message translates to:
  /// **'Buscar casas...'**
  String get searchHomes;

  /// Filtros de búsqueda
  ///
  /// In es, this message translates to:
  /// **'Filtros'**
  String get filters;

  /// Acción de limpiar filtros
  ///
  /// In es, this message translates to:
  /// **'Limpiar filtros'**
  String get clearFilters;

  /// Ordenar resultados
  ///
  /// In es, this message translates to:
  /// **'Ordenar por'**
  String get sortBy;

  /// Ordenar por precio ascendente
  ///
  /// In es, this message translates to:
  /// **'Precio: Ascendente'**
  String get priceAscending;

  /// Ordenar por precio descendente
  ///
  /// In es, this message translates to:
  /// **'Precio: Descendente'**
  String get priceDescending;

  /// Ordenar por ciudad
  ///
  /// In es, this message translates to:
  /// **'Por Ciudad'**
  String get sortByCity;

  /// Ciudad
  ///
  /// In es, this message translates to:
  /// **'Ciudad'**
  String get city;

  /// Rango de precio
  ///
  /// In es, this message translates to:
  /// **'Rango de precio'**
  String get priceRange;

  /// No hay resultados
  ///
  /// In es, this message translates to:
  /// **'No se encontraron resultados'**
  String get noResultsFound;

  /// Sugerencia cuando no hay resultados
  ///
  /// In es, this message translates to:
  /// **'Intenta ajustar los filtros para encontrar más opciones'**
  String get tryAdjustingFilters;

  /// Error al cargar datos
  ///
  /// In es, this message translates to:
  /// **'Error al cargar datos'**
  String get errorLoadingData;

  /// Reintentar acción
  ///
  /// In es, this message translates to:
  /// **'Reintentar'**
  String get retry;

  /// Cargando datos
  ///
  /// In es, this message translates to:
  /// **'Cargando'**
  String get loading;

  /// Mensaje de carga 1
  ///
  /// In es, this message translates to:
  /// **'Buscando tu hogar ideal...'**
  String get loadingMessage1;

  /// Mensaje de carga 2
  ///
  /// In es, this message translates to:
  /// **'Preparando las mejores opciones...'**
  String get loadingMessage2;

  /// Mensaje de carga 3
  ///
  /// In es, this message translates to:
  /// **'Explorando propiedades increíbles...'**
  String get loadingMessage3;

  /// Mensaje de carga 4
  ///
  /// In es, this message translates to:
  /// **'Casi listos para mostrarte lo mejor...'**
  String get loadingMessage4;

  /// Mensaje de espera
  ///
  /// In es, this message translates to:
  /// **'Solo tomará un momento'**
  String get justAMoment;

  /// Todos los elementos
  ///
  /// In es, this message translates to:
  /// **'Todos'**
  String get all;

  /// Categoría casa
  ///
  /// In es, this message translates to:
  /// **'Casa'**
  String get house;

  /// Categoría apartamento
  ///
  /// In es, this message translates to:
  /// **'Apartamento'**
  String get apartment;

  /// Categoría villa
  ///
  /// In es, this message translates to:
  /// **'Villa'**
  String get villa;

  /// Perfil de usuario
  ///
  /// In es, this message translates to:
  /// **'Perfil'**
  String get profile;

  /// Cerrar sesión
  ///
  /// In es, this message translates to:
  /// **'Cerrar sesión'**
  String get logout;

  /// Título de confirmación de cierre de sesión
  ///
  /// In es, this message translates to:
  /// **'¿Cerrar sesión?'**
  String get logoutConfirmTitle;

  /// Mensaje de confirmación de cierre de sesión
  ///
  /// In es, this message translates to:
  /// **'Se perderán los datos no guardados'**
  String get logoutConfirmMessage;

  /// Cancelar acción
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get cancel;

  /// Apariencia de la app
  ///
  /// In es, this message translates to:
  /// **'Apariencia'**
  String get appearance;

  /// Tema de la app
  ///
  /// In es, this message translates to:
  /// **'Tema'**
  String get theme;

  /// Tema del sistema
  ///
  /// In es, this message translates to:
  /// **'Sistema'**
  String get themeSystem;

  /// Tema claro
  ///
  /// In es, this message translates to:
  /// **'Claro'**
  String get themeLight;

  /// Tema oscuro
  ///
  /// In es, this message translates to:
  /// **'Oscuro'**
  String get themeDark;

  /// Seleccionar tema
  ///
  /// In es, this message translates to:
  /// **'Seleccionar tema'**
  String get selectTheme;

  /// Configuración de localización
  ///
  /// In es, this message translates to:
  /// **'Localización'**
  String get localization;

  /// Idioma de la app
  ///
  /// In es, this message translates to:
  /// **'Idioma'**
  String get language;

  /// Idioma español
  ///
  /// In es, this message translates to:
  /// **'Español'**
  String get languageSpanish;

  /// Idioma inglés
  ///
  /// In es, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// Seleccionar idioma
  ///
  /// In es, this message translates to:
  /// **'Seleccionar idioma'**
  String get selectLanguage;

  /// Moneda
  ///
  /// In es, this message translates to:
  /// **'Moneda'**
  String get currency;

  /// Dólar estadounidense
  ///
  /// In es, this message translates to:
  /// **'USD - Dólar'**
  String get currencyUSD;

  /// Euro
  ///
  /// In es, this message translates to:
  /// **'EUR - Euro'**
  String get currencyEUR;

  /// Seleccionar moneda
  ///
  /// In es, this message translates to:
  /// **'Seleccionar moneda'**
  String get selectCurrency;

  /// Datos de la app
  ///
  /// In es, this message translates to:
  /// **'Datos'**
  String get data;

  /// Limpiar caché
  ///
  /// In es, this message translates to:
  /// **'Limpiar caché'**
  String get clearCache;

  /// Descripción de limpiar caché
  ///
  /// In es, this message translates to:
  /// **'Liberar espacio de almacenamiento'**
  String get clearCacheDescription;

  /// Título de confirmación de limpieza de caché
  ///
  /// In es, this message translates to:
  /// **'Limpiar caché'**
  String get clearCacheConfirmTitle;

  /// Mensaje de confirmación de limpieza de caché
  ///
  /// In es, this message translates to:
  /// **'¿Estás seguro de que quieres limpiar el caché? Esta acción no se puede deshacer.'**
  String get clearCacheConfirmMessage;

  /// Limpiar
  ///
  /// In es, this message translates to:
  /// **'Limpiar'**
  String get clear;

  /// Mensaje de éxito al limpiar caché
  ///
  /// In es, this message translates to:
  /// **'Caché limpiado exitosamente'**
  String get cacheClearedSuccess;

  /// Detalles de la propiedad
  ///
  /// In es, this message translates to:
  /// **'Detalles'**
  String get details;

  /// Descripción de la propiedad
  ///
  /// In es, this message translates to:
  /// **'Descripción'**
  String get description;

  /// Ubicación de la propiedad
  ///
  /// In es, this message translates to:
  /// **'Ubicación'**
  String get location;

  /// Propietario de la propiedad
  ///
  /// In es, this message translates to:
  /// **'Propietario'**
  String get owner;

  /// Contactar al propietario
  ///
  /// In es, this message translates to:
  /// **'Contactar'**
  String get contact;

  /// Precio mensual
  ///
  /// In es, this message translates to:
  /// **'Precio por mes'**
  String get pricePerMonth;

  /// Sufijo por mes
  ///
  /// In es, this message translates to:
  /// **'/mes'**
  String get perMonth;

  /// Número de habitaciones
  ///
  /// In es, this message translates to:
  /// **'Habitaciones'**
  String get bedrooms;

  /// Número de baños
  ///
  /// In es, this message translates to:
  /// **'Baños'**
  String get bathrooms;

  /// Área de la propiedad
  ///
  /// In es, this message translates to:
  /// **'Área'**
  String get area;

  /// Versión de la aplicación
  ///
  /// In es, this message translates to:
  /// **'Versión'**
  String get version;

  /// Número de filtros activos
  ///
  /// In es, this message translates to:
  /// **'{count} {count, plural, =1{filtro activo} other{filtros activos}}'**
  String activeFiltersCount(int count);

  /// Número de propiedades encontradas
  ///
  /// In es, this message translates to:
  /// **'{count} {count, plural, =0{propiedades} =1{propiedad} other{propiedades}} encontradas'**
  String itemsFound(int count);

  /// Disponible desde el próximo mes
  ///
  /// In es, this message translates to:
  /// **'Desde el próximo mes'**
  String get fromNextMonth;

  /// Mensaje de saludo con nombre de usuario
  ///
  /// In es, this message translates to:
  /// **'Hola, {name}'**
  String hello(String name);

  /// Nombre de usuario predeterminado
  ///
  /// In es, this message translates to:
  /// **'Usuario'**
  String get user;

  /// Primera parte del título de la página de inicio
  ///
  /// In es, this message translates to:
  /// **'Compra Tu'**
  String get buyYour;

  /// Segunda parte del título de la página de inicio con emoji de casa
  ///
  /// In es, this message translates to:
  /// **'Hogar Perfecto 🏠'**
  String get perfectHome;

  /// Texto del placeholder de la barra de búsqueda
  ///
  /// In es, this message translates to:
  /// **'Encuentra tu próximo hogar'**
  String get findYourNextHome;

  /// Título del mensaje de error
  ///
  /// In es, this message translates to:
  /// **'¡Oops! Algo salió mal'**
  String get oopsSomethingWentWrong;

  /// Mensaje de descripción del error
  ///
  /// In es, this message translates to:
  /// **'No pudimos cargar las propiedades'**
  String get couldNotLoadProperties;

  /// Mensaje de estado vacío cuando no existen propiedades
  ///
  /// In es, this message translates to:
  /// **'No hay propiedades disponibles en este momento'**
  String get thereAreNoPropertiesRightNow;

  /// Encabezado de la sección de filtro de ciudad
  ///
  /// In es, this message translates to:
  /// **'Filtrar por Ciudad'**
  String get filterByCity;

  /// Encabezado de la sección de filtro de rango de precio
  ///
  /// In es, this message translates to:
  /// **'Rango de precio'**
  String get priceRangeFilter;

  /// Etiqueta de precio
  ///
  /// In es, this message translates to:
  /// **'Precio'**
  String get price;

  /// Etiqueta del botón de comprar ahora
  ///
  /// In es, this message translates to:
  /// **'Comprar Ahora'**
  String get buyNow;

  /// Número de reseñas
  ///
  /// In es, this message translates to:
  /// **'reseñas'**
  String get reviews;

  /// Número de propiedades
  ///
  /// In es, this message translates to:
  /// **'propiedades'**
  String get properties;

  /// Botón de inicio de sesión
  ///
  /// In es, this message translates to:
  /// **'Iniciar sesión'**
  String get login;

  /// Campo de correo electrónico
  ///
  /// In es, this message translates to:
  /// **'Correo electrónico'**
  String get email;

  /// Campo de contraseña
  ///
  /// In es, this message translates to:
  /// **'Contraseña'**
  String get password;

  /// Placeholder del campo de correo
  ///
  /// In es, this message translates to:
  /// **'Ingresa tu correo'**
  String get enterEmail;

  /// Placeholder del campo de contraseña
  ///
  /// In es, this message translates to:
  /// **'Ingresa tu contraseña'**
  String get enterPassword;

  /// Error cuando el correo está vacío
  ///
  /// In es, this message translates to:
  /// **'El correo es requerido'**
  String get emailRequired;

  /// Error cuando el correo no es válido
  ///
  /// In es, this message translates to:
  /// **'Ingresa un correo válido'**
  String get emailInvalid;

  /// Error cuando la contraseña está vacía
  ///
  /// In es, this message translates to:
  /// **'La contraseña es requerida'**
  String get passwordRequired;

  /// Error cuando la contraseña es muy corta
  ///
  /// In es, this message translates to:
  /// **'La contraseña debe tener al menos 6 caracteres'**
  String get passwordTooShort;

  /// Error de login
  ///
  /// In es, this message translates to:
  /// **'Credenciales inválidas'**
  String get invalidCredentials;

  /// Mensaje de bienvenida en login
  ///
  /// In es, this message translates to:
  /// **'¡Bienvenido de nuevo!'**
  String get welcomeBack;

  /// Subtítulo en login
  ///
  /// In es, this message translates to:
  /// **'Inicia sesión para continuar'**
  String get signInToContinue;

  /// Mensaje mientras se inicia sesión
  ///
  /// In es, this message translates to:
  /// **'Iniciando sesión...'**
  String get loggingIn;

  /// Mensaje en splash mientras verifica auth
  ///
  /// In es, this message translates to:
  /// **'Verificando autenticación...'**
  String get checkingAuth;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

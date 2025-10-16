// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Home Mock';

  @override
  String get home => 'Inicio';

  @override
  String get settings => 'Ajustes';

  @override
  String get search => 'Buscar';

  @override
  String get searchHomes => 'Buscar casas...';

  @override
  String get filters => 'Filtros';

  @override
  String get clearFilters => 'Limpiar filtros';

  @override
  String get sortBy => 'Ordenar por';

  @override
  String get priceAscending => 'Precio: Ascendente';

  @override
  String get priceDescending => 'Precio: Descendente';

  @override
  String get sortByCity => 'Por Ciudad';

  @override
  String get city => 'Ciudad';

  @override
  String get priceRange => 'Rango de precio';

  @override
  String get noResultsFound => 'No se encontraron resultados';

  @override
  String get tryAdjustingFilters => 'Intenta ajustar los filtros para encontrar más opciones';

  @override
  String get errorLoadingData => 'Error al cargar datos';

  @override
  String get retry => 'Reintentar';

  @override
  String get loading => 'Cargando';

  @override
  String get loadingMessage1 => 'Buscando tu hogar ideal...';

  @override
  String get loadingMessage2 => 'Preparando las mejores opciones...';

  @override
  String get loadingMessage3 => 'Explorando propiedades increíbles...';

  @override
  String get loadingMessage4 => 'Casi listos para mostrarte lo mejor...';

  @override
  String get justAMoment => 'Solo tomará un momento';

  @override
  String get all => 'Todos';

  @override
  String get house => 'Casa';

  @override
  String get apartment => 'Apartamento';

  @override
  String get villa => 'Villa';

  @override
  String get profile => 'Perfil';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get logoutConfirmTitle => '¿Cerrar sesión?';

  @override
  String get logoutConfirmMessage => 'Se perderán los datos no guardados';

  @override
  String get cancel => 'Cancelar';

  @override
  String get appearance => 'Apariencia';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get selectTheme => 'Seleccionar tema';

  @override
  String get localization => 'Localización';

  @override
  String get language => 'Idioma';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageEnglish => 'English';

  @override
  String get selectLanguage => 'Seleccionar idioma';

  @override
  String get currency => 'Moneda';

  @override
  String get currencyUSD => 'USD - Dólar';

  @override
  String get currencyEUR => 'EUR - Euro';

  @override
  String get selectCurrency => 'Seleccionar moneda';

  @override
  String get data => 'Datos';

  @override
  String get clearCache => 'Limpiar caché';

  @override
  String get clearCacheDescription => 'Liberar espacio de almacenamiento';

  @override
  String get clearCacheConfirmTitle => 'Limpiar caché';

  @override
  String get clearCacheConfirmMessage => '¿Estás seguro de que quieres limpiar el caché? Esta acción no se puede deshacer.';

  @override
  String get clear => 'Limpiar';

  @override
  String get cacheClearedSuccess => 'Caché limpiado exitosamente';

  @override
  String get details => 'Detalles';

  @override
  String get description => 'Descripción';

  @override
  String get location => 'Ubicación';

  @override
  String get owner => 'Propietario';

  @override
  String get contact => 'Contactar';

  @override
  String get pricePerMonth => 'Precio por mes';

  @override
  String get perMonth => '/mes';

  @override
  String get bedrooms => 'Habitaciones';

  @override
  String get bathrooms => 'Baños';

  @override
  String get area => 'Área';

  @override
  String get version => 'Versión';

  @override
  String activeFiltersCount(int count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'filtros activos',
      one: 'filtro activo',
    );
    return '$countString $_temp0';
  }

  @override
  String itemsFound(int count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'propiedades',
      one: 'propiedad',
      zero: 'propiedades',
    );
    return '$countString $_temp0 encontradas';
  }

  @override
  String get fromNextMonth => 'Desde el próximo mes';

  @override
  String hello(String name) {
    return 'Hola, $name';
  }

  @override
  String get user => 'Usuario';

  @override
  String get buyYour => 'Compra Tu';

  @override
  String get perfectHome => 'Hogar Perfecto 🏠';

  @override
  String get findYourNextHome => 'Encuentra tu próximo hogar';

  @override
  String get oopsSomethingWentWrong => '¡Oops! Algo salió mal';

  @override
  String get couldNotLoadProperties => 'No pudimos cargar las propiedades';

  @override
  String get thereAreNoPropertiesRightNow => 'No hay propiedades disponibles en este momento';

  @override
  String get filterByCity => 'Filtrar por Ciudad';

  @override
  String get priceRangeFilter => 'Rango de precio';

  @override
  String get price => 'Precio';

  @override
  String get buyNow => 'Comprar Ahora';

  @override
  String get reviews => 'reseñas';

  @override
  String get properties => 'propiedades';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get email => 'Correo electrónico';

  @override
  String get password => 'Contraseña';

  @override
  String get enterEmail => 'Ingresa tu correo';

  @override
  String get enterPassword => 'Ingresa tu contraseña';

  @override
  String get emailRequired => 'El correo es requerido';

  @override
  String get emailInvalid => 'Ingresa un correo válido';

  @override
  String get passwordRequired => 'La contraseña es requerida';

  @override
  String get passwordTooShort => 'La contraseña debe tener al menos 6 caracteres';

  @override
  String get invalidCredentials => 'Credenciales inválidas';

  @override
  String get welcomeBack => '¡Bienvenido de nuevo!';

  @override
  String get signInToContinue => 'Inicia sesión para continuar';

  @override
  String get loggingIn => 'Iniciando sesión...';

  @override
  String get checkingAuth => 'Verificando autenticación...';
}

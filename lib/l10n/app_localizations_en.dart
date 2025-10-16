// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Home Mock';

  @override
  String get home => 'Home';

  @override
  String get settings => 'Settings';

  @override
  String get search => 'Search';

  @override
  String get searchHomes => 'Search homes...';

  @override
  String get filters => 'Filters';

  @override
  String get clearFilters => 'Clear filters';

  @override
  String get sortBy => 'Sort by';

  @override
  String get priceAscending => 'Price: Ascending';

  @override
  String get priceDescending => 'Price: Descending';

  @override
  String get sortByCity => 'By City';

  @override
  String get city => 'City';

  @override
  String get priceRange => 'Price range';

  @override
  String get noResultsFound => 'No results found';

  @override
  String get tryAdjustingFilters =>
      'Try adjusting your filters to find more options';

  @override
  String get errorLoadingData => 'Error loading data';

  @override
  String get retry => 'Retry';

  @override
  String get loading => 'Loading';

  @override
  String get loadingMessage1 => 'Finding your ideal home...';

  @override
  String get loadingMessage2 => 'Preparing the best options...';

  @override
  String get loadingMessage3 => 'Exploring amazing properties...';

  @override
  String get loadingMessage4 => 'Almost ready to show you the best...';

  @override
  String get justAMoment => 'Just a moment';

  @override
  String get all => 'All';

  @override
  String get house => 'House';

  @override
  String get apartment => 'Apartment';

  @override
  String get villa => 'Villa';

  @override
  String get profile => 'Profile';

  @override
  String get logout => 'Log out';

  @override
  String get logoutConfirmTitle => 'Log out?';

  @override
  String get logoutConfirmMessage => 'Unsaved data will be lost';

  @override
  String get cancel => 'Cancel';

  @override
  String get appearance => 'Appearance';

  @override
  String get theme => 'Theme';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get selectTheme => 'Select theme';

  @override
  String get localization => 'Localization';

  @override
  String get language => 'Language';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageEnglish => 'English';

  @override
  String get selectLanguage => 'Select language';

  @override
  String get currency => 'Currency';

  @override
  String get currencyUSD => 'USD - Dollar';

  @override
  String get currencyEUR => 'EUR - Euro';

  @override
  String get selectCurrency => 'Select currency';

  @override
  String get data => 'Data';

  @override
  String get clearCache => 'Clear cache';

  @override
  String get clearCacheDescription => 'Free up storage space';

  @override
  String get clearCacheConfirmTitle => 'Clear cache';

  @override
  String get clearCacheConfirmMessage =>
      'Are you sure you want to clear the cache? This action cannot be undone.';

  @override
  String get clear => 'Clear';

  @override
  String get cacheClearedSuccess => 'Cache cleared successfully';

  @override
  String get details => 'Details';

  @override
  String get description => 'Description';

  @override
  String get location => 'Location';

  @override
  String get owner => 'Owner';

  @override
  String get contact => 'Contact';

  @override
  String get pricePerMonth => 'Price per month';

  @override
  String get perMonth => '/month';

  @override
  String get bedrooms => 'Bedrooms';

  @override
  String get bathrooms => 'Bathrooms';

  @override
  String get area => 'Area';

  @override
  String get version => 'Version';

  @override
  String activeFiltersCount(int count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'active filters',
      one: 'active filter',
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
      other: 'properties',
      one: 'property',
      zero: 'properties',
    );
    return '$countString $_temp0 found';
  }

  @override
  String get fromNextMonth => 'From next month';

  @override
  String hello(String name) {
    return 'Hello, $name';
  }

  @override
  String get user => 'User';

  @override
  String get buyYour => 'Buy Your';

  @override
  String get perfectHome => 'Perfect Home 🏠';

  @override
  String get findYourNextHome => 'Find your next home';

  @override
  String get oopsSomethingWentWrong => 'Oops! Something went wrong';

  @override
  String get couldNotLoadProperties => 'We couldn\'t load the properties';

  @override
  String get thereAreNoPropertiesRightNow =>
      'There are no properties available right now';

  @override
  String get filterByCity => 'Filter by City';

  @override
  String get priceRangeFilter => 'Price range';

  @override
  String get price => 'Price';

  @override
  String get buyNow => 'Buy Now';

  @override
  String get reviews => 'reviews';

  @override
  String get properties => 'properties';

  @override
  String get login => 'Log in';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get enterEmail => 'Enter your email';

  @override
  String get enterPassword => 'Enter your password';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get emailInvalid => 'Enter a valid email';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordTooShort => 'Password must be at least 6 characters';

  @override
  String get invalidCredentials => 'Invalid credentials';

  @override
  String get welcomeBack => 'Welcome back!';

  @override
  String get signInToContinue => 'Sign in to continue';

  @override
  String get loggingIn => 'Logging in...';

  @override
  String get checkingAuth => 'Checking authentication...';

  @override
  String get loginRequired => 'You must log in to continue';

  @override
  String get sessionExpired => 'Your session has expired';

  @override
  String get authenticationFailed => 'Authentication failed';

  @override
  String get serverError => 'Server error, please try again';

  @override
  String get networkError => 'Connection error, check your internet';

  @override
  String get unexpectedError => 'Unexpected error, try later';

  @override
  String get purchaseInProgress => 'Processing purchase...';

  @override
  String get contactingOwner => 'Contacting owner...';

  @override
  String get filtersCleared => 'Filters cleared';

  @override
  String get loggedOutSuccessfully => 'Logged out successfully';

  @override
  String get noResultsForSearch => 'No results for your search';
}

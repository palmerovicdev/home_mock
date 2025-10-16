import 'package:intl/intl.dart';

import '../../model/entity/settings.dart';

class CurrencyFormatter {
  static String format(
    double amount, {
    required Currency currency,
    bool compact = false,
  }) {
    final formatter = NumberFormat.currency(
      locale: currency == Currency.usd ? 'en_US' : 'es_ES',
      symbol: currency.symbol,
      decimalDigits: 0,
    );

    if (compact) {
      if (amount >= 1000000) {
        return '${currency.symbol}${(amount / 1000000).toStringAsFixed(1)}M';
      } else if (amount >= 1000) {
        return '${currency.symbol}${(amount / 1000).toStringAsFixed(1)}K';
      }
    }

    return formatter.format(amount);
  }

  static String formatWithSuffix(
    double amount, {
    required Currency currency,
    String suffix = '/m',
  }) {
    return '${format(amount, currency: currency)}$suffix';
  }

  static int convert(int amountUsd, Currency targetCurrency) {
    if (targetCurrency == Currency.usd) {
      return amountUsd;
    }

    return (amountUsd * 0.92).round();
  }
}

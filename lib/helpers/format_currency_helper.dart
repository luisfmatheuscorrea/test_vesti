import 'package:intl/intl.dart';

class FormatCurrencyHelper {
  static format(double value) {
    if (value >= 1e3 && value < 1e6) {
      return '${_formatNumber(value / 1e3)}K';
    }

    if (value >= 1e6 && value < 1e9) {
      return '${_formatNumber(value / 1e6)}M';
    }

    if (value >= 1e9 && value < 1e12) {
      return '${_formatNumber(value / 1e9)}G';
    }

    if (value >= 1e12) {
      return '${_formatNumber(value / 1e12)}T';
    }

    return _formatNumber(value);
  }

  static String _formatNumber(double number) {
    return NumberFormat.currency(symbol: 'R\$').format(number);
  }
}

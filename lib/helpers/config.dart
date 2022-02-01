enum Environment { dev, hom, prod }

class DefaultURL {
  static late Environment env = Environment.dev;

  static String apiURL() => _urls[env.index];

  static const String _dev = 'https://fakestoreapi.com/';
  static const int _defaultTimeout = 10000;

  static const List<String> _urls = [_dev];

  static List<String> urls() => _urls;

  static int defaultTimeout() => _defaultTimeout;
}

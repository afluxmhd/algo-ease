class APIEndpoints {
  static const baseUrl = 'https://algo-ease.vercel.app';

  /// Stocks
  static String stockDetails(String name) => '$baseUrl/stock-price/$name';

  /// Strategy
  static const interpretStrategy = '$baseUrl/strategy/interpret';

  /// Strategy Description
  static const startegyDescription = '$baseUrl/strategy/description';
}

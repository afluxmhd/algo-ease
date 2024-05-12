class Stock {
  final String symbol;
  final String name;
  final double price;
  final DateTime time;
  Stock({
    required this.symbol,
    required this.name,
    required this.price,
    required this.time,
  });

  Stock copyWith({
    String? symbol,
    String? name,
    double? price,
    DateTime? time,
  }) {
    return Stock(
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      price: price ?? this.price,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'symbol': symbol,
      'name': name,
      'price': price,
      'time': time.millisecondsSinceEpoch,
    };
  }

  factory Stock.fromMap(Map<String, dynamic> map) {
    return Stock(
      symbol: map['symbol'] as String,
      name: map['name'] as String,
      price: map['price'] as double,
      time: DateTime.parse(map['time'] ?? DateTime.now().toString()),
    );
  }

  @override
  String toString() {
    return 'Stock(symbol: $symbol, name: $name, price: $price, time: $time)';
  }

  @override
  bool operator ==(covariant Stock other) {
    if (identical(this, other)) return true;

    return other.symbol == symbol && other.name == name && other.price == price && other.time == time;
  }

  @override
  int get hashCode {
    return symbol.hashCode ^ name.hashCode ^ price.hashCode ^ time.hashCode;
  }
}

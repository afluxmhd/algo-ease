class StrategyRequest {
  String strategy;
  StrategyRequest({
    required this.strategy,
  });

  StrategyRequest copyWith({
    String? strategy,
  }) {
    return StrategyRequest(
      strategy: strategy ?? this.strategy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'strategy': strategy,
    };
  }

  factory StrategyRequest.fromMap(Map<String, dynamic> map) {
    return StrategyRequest(
      strategy: map['strategy'] as String,
    );
  }

  @override
  String toString() => 'StrategyRequest(strategy: $strategy)';

  @override
  bool operator ==(covariant StrategyRequest other) {
    if (identical(this, other)) return true;

    return other.strategy == strategy;
  }

  @override
  int get hashCode => strategy.hashCode;
}

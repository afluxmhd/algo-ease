import 'package:algo_ease/models/strategy_request.dart';

class Suggestion {
  final String id;
  final String title;
  final String desc;
  final StrategyRequest strategy;
  Suggestion({
    required this.id,
    required this.title,
    required this.desc,
    required this.strategy,
  });

  Suggestion copyWith({
    String? id,
    String? title,
    String? desc,
    StrategyRequest? strategy,
  }) {
    return Suggestion(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      strategy: strategy ?? this.strategy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'desc': desc,
      'strategy': strategy.toMap(),
    };
  }

  factory Suggestion.fromMap(Map<String, dynamic> map) {
    return Suggestion(
      id: map['id'] as String,
      title: map['title'] as String,
      desc: map['desc'] as String,
      strategy: StrategyRequest.fromMap(map['strategy'] as Map<String, dynamic>),
    );
  }

  @override
  String toString() {
    return 'Suggestion(id: $id, title: $title, desc: $desc, strategy: $strategy)';
  }

  @override
  bool operator ==(covariant Suggestion other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title && other.desc == desc && other.strategy == strategy;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ desc.hashCode ^ strategy.hashCode;
  }
}

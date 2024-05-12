import 'package:algo_ease/models/strategy_response.dart';

class Deploy {
  final String id;
  final String uid;
  final String modelName;
  final StrategyResponse strategyResponse;
  final String modelDescription;
  Deploy(
      {required this.id,
      required this.uid,
      required this.modelName,
      required this.strategyResponse,
      required this.modelDescription});

  Deploy copyWith({
    String? id,
    String? uid,
    String? modelName,
    StrategyResponse? strategyResponse,
    String? modelDescription,
  }) {
    return Deploy(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      modelName: modelName ?? this.modelName,
      strategyResponse: strategyResponse ?? this.strategyResponse,
      modelDescription: modelDescription ?? this.modelDescription,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uid': uid,
      'modelName': modelName,
      'strategyResponse': strategyResponse.toMap(),
      'modelDescription': modelDescription
    };
  }

  factory Deploy.fromMap(Map<String, dynamic> map) {
    return Deploy(
      id: map['id'] as String,
      uid: map['uid'] as String,
      modelName: map['modelName'] as String,
      strategyResponse: StrategyResponse.fromMap(map['strategyResponse'] as Map<String, dynamic>),
      modelDescription: map['modelDescription'] as String,
    );
  }

  @override
  String toString() =>
      'Deploy(id: $id, uid: $uid,modelName: $modelName,strategyResponse: $strategyResponse, modelDescription; $modelDescription)';

  @override
  bool operator ==(covariant Deploy other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.uid == uid &&
        other.modelName == modelName &&
        other.strategyResponse == strategyResponse &&
        other.modelDescription == modelDescription;
  }

  @override
  int get hashCode => id.hashCode ^ uid.hashCode ^ strategyResponse.hashCode ^ modelDescription.hashCode;
}

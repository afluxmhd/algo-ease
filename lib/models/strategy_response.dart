import 'package:algo_ease/enums/strategy_enums.dart';
import 'package:intl/intl.dart';

class StrategyResponse {
  String scrip;
  ModelAction action;
  double entry;
  double exit;
  DateTime? entryTime;
  DateTime? exitTime;
  int quantity;
  double risk;
  double maxLoss;
  double maxProfit;
  double riskReward;
  StrategyResponse({
    required this.scrip,
    required this.action,
    required this.entry,
    required this.exit,
    this.entryTime,
    this.exitTime,
    required this.quantity,
    required this.risk,
    required this.maxLoss,
    required this.maxProfit,
    required this.riskReward,
  });

  StrategyResponse copyWith({
    String? scrip,
    ModelAction? action,
    double? entry,
    double? exit,
    DateTime? entryTime,
    DateTime? exitTime,
    int? quantity,
    double? risk,
    double? maxLoss,
    double? maxProfit,
    double? riskReward,
  }) {
    return StrategyResponse(
      scrip: scrip ?? this.scrip,
      action: action ?? this.action,
      entry: entry ?? this.entry,
      exit: exit ?? this.exit,
      entryTime: entryTime ?? this.entryTime,
      exitTime: exitTime ?? this.exitTime,
      quantity: quantity ?? this.quantity,
      risk: risk ?? this.risk,
      maxLoss: maxLoss ?? this.maxLoss,
      maxProfit: maxProfit ?? this.maxProfit,
      riskReward: riskReward ?? this.riskReward,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'scrip': scrip,
      'action': action.toMap(),
      'entry': entry,
      'exit': exit,
      'entryTime': entryTime?.millisecondsSinceEpoch,
      'exitTime': exitTime?.millisecondsSinceEpoch,
      'quantity': quantity,
      'risk': risk,
      'maxLoss': maxLoss,
      'maxProfit': maxProfit,
      'riskReward': riskReward,
    };
  }

  Map<String, dynamic> toModelDisplay() {
    DateFormat dateFormat = DateFormat('dd MMM yyyy hh:mm a');

    return <String, dynamic>{
      'Scrip': scrip.substring(0, 1).toUpperCase() + scrip.substring(1),
      'Action': action.toMap(),
      'Entry': formatValue(entry),
      'Exit': formatValue(exit),
      'Entry Time': formatValue(entryTime == null ? null : dateFormat.format(entryTime!)),
      'Exit Time': formatValue(exitTime == null ? null : dateFormat.format(exitTime!)),
      'Quantity': formatValue(quantity),
      'Risk': formatValue(risk),
      'Max Loss': formatValue(maxLoss),
      'Max Profit': formatValue(maxProfit),
      'Risk Reward': formatValue(riskReward),
    };
  }

  String formatValue(dynamic value) {
    if (value == -1 || value == "" || value == null) {
      return "N/A";
    } else {
      return value.toString();
    }
  }

  factory StrategyResponse.fromMap(Map<String, dynamic> map) {
    return StrategyResponse(
      scrip: map['scrip'] as String,
      action: ModelAction.fromMap(map['action'] as String),
      entry: map['entry'] as double,
      exit: map['exit'] as double,
      entryTime: map['entryTime'] == null ? null : DateTime.fromMillisecondsSinceEpoch(map['entryTime'] as int),
      exitTime: map['exitTime'] == null ? null : DateTime.fromMillisecondsSinceEpoch(map['exitTime'] as int),
      quantity: map['quantity'] as int,
      risk: map['risk'] as double,
      maxLoss: map['maxLoss'] as double,
      maxProfit: map['maxProfit'] as double,
      riskReward: map['riskReward'] as double,
    );
  }

  factory StrategyResponse.fromServerMap(Map<String, dynamic> map) {
    return StrategyResponse(
      scrip: map['scrip'] as String,
      action: ModelAction.fromMap(map['action'] as String),
      entry: map['entry'] as double,
      exit: map['exit'] as double,
      entryTime: map['entry_time'] == "" ? null : DateTime.parse(map['entry_time'] as String),
      exitTime: map['exit_time'] == "" ? null : DateTime.parse(map['exit_time'] as String),
      quantity: map['quantity'] as int,
      risk: map['risk'] as double,
      maxLoss: map['max_loss'] as double,
      maxProfit: map['max_profit'] as double,
      riskReward: map['risk_reward'] as double,
    );
  }

  @override
  String toString() {
    return 'StrategyResponse(scrip: $scrip, action: $action, entry: $entry, exit: $exit, entryTime: $entryTime, exitTime: $exitTime, quantity: $quantity, risk: $risk, maxLoss: $maxLoss, maxProfit: $maxProfit, riskReward: $riskReward)';
  }

  @override
  bool operator ==(covariant StrategyResponse other) {
    if (identical(this, other)) return true;

    return other.scrip == scrip &&
        other.action == action &&
        other.entry == entry &&
        other.exit == exit &&
        other.entryTime == entryTime &&
        other.exitTime == exitTime &&
        other.quantity == quantity &&
        other.risk == risk &&
        other.maxLoss == maxLoss &&
        other.maxProfit == maxProfit &&
        other.riskReward == riskReward;
  }

  @override
  int get hashCode {
    return scrip.hashCode ^
        action.hashCode ^
        entry.hashCode ^
        exit.hashCode ^
        entryTime.hashCode ^
        exitTime.hashCode ^
        quantity.hashCode ^
        risk.hashCode ^
        maxLoss.hashCode ^
        maxProfit.hashCode ^
        riskReward.hashCode;
  }
}

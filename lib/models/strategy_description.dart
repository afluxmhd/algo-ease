class StrategyDescription {
  String scrip;
  String action;
  String entry;
  String exit;
  String entryTime;
  String exitTime;
  String quantity;
  String risk;
  String maxLoss;
  String maxProfit;
  String riskReward;
  StrategyDescription({
    required this.scrip,
    required this.action,
    required this.entry,
    required this.exit,
    required this.entryTime,
    required this.exitTime,
    required this.quantity,
    required this.risk,
    required this.maxLoss,
    required this.maxProfit,
    required this.riskReward,
  });

  StrategyDescription copyWith({
    String? scrip,
    String? action,
    String? entry,
    String? exit,
    String? entryTime,
    String? exitTime,
    String? quantity,
    String? risk,
    String? maxLoss,
    String? maxProfit,
    String? riskReward,
  }) {
    return StrategyDescription(
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
      'action': action,
      'entry': entry,
      'exit': exit,
      'entryTime': entryTime,
      'exitTime': exitTime,
      'quantity': quantity,
      'risk': risk,
      'maxLoss': maxLoss,
      'maxProfit': maxProfit,
      'riskReward': riskReward,
    };
  }

  factory StrategyDescription.fromMap(Map<String, dynamic> map) {
    return StrategyDescription(
      scrip: map['scrip'] as String,
      action: map['action'] as String,
      entry: map['entry'] as String,
      exit: map['exit'] as String,
      entryTime: map['entry_time'] as String,
      exitTime: map['exit_time'] as String,
      quantity: map['quantity'] as String,
      risk: map['risk'] as String,
      maxLoss: map['max_loss'] as String,
      maxProfit: map['max_profit'] as String,
      riskReward: map['risk_reward'] as String,
    );
  }

  @override
  String toString() {
    return 'StrategyDescription(scrip: $scrip, action: $action, entry: $entry, exit: $exit, entryTime: $entryTime, exitTime: $exitTime, quantity: $quantity, risk: $risk, maxLoss: $maxLoss, maxProfit: $maxProfit, riskReward: $riskReward)';
  }

  @override
  bool operator ==(covariant StrategyDescription other) {
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

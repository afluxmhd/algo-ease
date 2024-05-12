enum ModelAction {
  buy,
  sell;

  String toMap() {
    switch (this) {
      case ModelAction.buy:
        return 'BUY';

      case ModelAction.sell:
        return 'SELL';
    }
  }

  static ModelAction fromMap(String actionString) {
    switch (actionString) {
      case 'BUY':
        return ModelAction.buy;

      case 'SELL':
        return ModelAction.sell;

      default:
        throw ArgumentError('Invalid action string: $actionString');
    }
  }
}

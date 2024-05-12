import 'package:algo_ease/enums/order_enums.dart';
import 'package:algo_ease/models/deploy.dart';

class Order {
  final String id;
  final String uid;
  final Deploy deployModel;
  OrderStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;
  Order({
    required this.id,
    required this.uid,
    required this.deployModel,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  Order copyWith({
    String? id,
    String? uid,
    Deploy? deployModel,
    OrderStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Order(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      deployModel: deployModel ?? this.deployModel,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uid': uid,
      'deployModel': deployModel.toMap(),
      'status': status.toMap(),
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] as String,
      uid: map['uid'] as String,
      deployModel: Deploy.fromMap(map['deployModel'] as Map<String, dynamic>),
      status: OrderStatus.fromMap(map['status'] as String),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  @override
  String toString() {
    return 'Order(id: $id, uid: $uid, deployModel: $deployModel, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant Order other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.uid == uid &&
        other.deployModel == deployModel &&
        other.status == status &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^ uid.hashCode ^ deployModel.hashCode ^ status.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;
  }
}

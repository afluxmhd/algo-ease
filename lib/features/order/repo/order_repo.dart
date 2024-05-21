import 'dart:convert';

import 'package:algo_ease/core/constants/collections.dart';
import 'package:algo_ease/data/remote/api_client.dart';
import 'package:algo_ease/data/remote/api_endpoints.dart';
import 'package:algo_ease/models/order.dart' as stock;
import 'package:algo_ease/models/stock.dart';
import 'package:algo_ease/models/strategy_response.dart';
import 'package:algo_ease/models/suggestion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderRepo {
  final FirebaseFirestore _firestore;
  final APIClient _apiClient;

  OrderRepo({
    required FirebaseFirestore firestore,
    required APIClient apiClient,
  })  : _firestore = firestore,
        _apiClient = apiClient;

  CollectionReference get _orders => _firestore.collection(FirebaseCollections.orders);

  Stream<List<stock.Order>?> getOrders(String uid, String status) {
    return _orders
        .where("uid", isEqualTo: uid)
        .where(
          "status",
          isEqualTo: status,
        )
        .snapshots()
        .map((event) {
      return event.docs
          .map(
            (doc) => stock.Order.fromMap(doc.data() as Map<String, dynamic>),
          )
          .toList();
    });
  }

  Future<void> addOrder(stock.Order order) {
    try {
      return _orders.doc(order.id).set(order.toMap());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateOrder(stock.Order order) {
    try {
      return _orders.doc(order.id).update(order.toMap());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Stock> fetchStockPrice(dynamic body) async {
    try {
      var response = await _apiClient.postData(APIEndpoints.stockDetails, body: body);
      return Stock.fromMap(jsonDecode(response.body));
    } catch (e) {
      throw Exception(e);
    }
  }
}

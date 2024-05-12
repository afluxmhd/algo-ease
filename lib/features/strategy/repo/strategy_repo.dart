import 'dart:convert';

import 'package:algo_ease/core/constants/collections.dart';
import 'package:algo_ease/data/remote/api_client.dart';
import 'package:algo_ease/data/remote/api_endpoints.dart';
import 'package:algo_ease/models/strategy_description.dart';
import 'package:algo_ease/models/strategy_request.dart';
import 'package:algo_ease/models/strategy_response.dart';
import 'package:algo_ease/models/suggestion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StrategyRepo {
  final FirebaseFirestore _firestore;
  final APIClient _apiClient;

  StrategyRepo({
    required FirebaseFirestore firestore,
    required APIClient apiClient,
  })  : _firestore = firestore,
        _apiClient = apiClient;

  CollectionReference get _suggestion => _firestore.collection(FirebaseCollections.suggestions);

  Stream<List<Suggestion>?> getSuggestions() {
    return _suggestion.snapshots().map((event) {
      return event.docs
          .map(
            (doc) => Suggestion.fromMap(doc.data() as Map<String, dynamic>),
          )
          .toList();
    });
  }

  Future<void> addSuggestions(Suggestion suggestion) {
    try {
      return _suggestion.doc(suggestion.id).set(suggestion.toMap());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<StrategyResponse> processStrategy(StrategyRequest strategy) async {
    try {
      var response = await _apiClient.postData(
        APIEndpoints.interpretStrategy,
        body: strategy.toMap(),
      );
      print(response.body);
      return StrategyResponse.fromServerMap(jsonDecode(response.body));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<StrategyDescription> getStrategyDescription() async {
    try {
      var response = await _apiClient.getData(APIEndpoints.startegyDescription);
      return StrategyDescription.fromMap(jsonDecode(response.body));
    } catch (e) {
      throw Exception(e);
    }
  }
}

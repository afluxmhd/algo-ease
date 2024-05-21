import 'package:algo_ease/core/constants/collections.dart';
import 'package:algo_ease/data/remote/api_client.dart';
import 'package:algo_ease/models/deploy.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class DeployRepo {
  final FirebaseFirestore _firestore;
  final APIClient _apiClient;

  DeployRepo({
    required FirebaseFirestore firestore,
    required APIClient apiClient,
  })  : _firestore = firestore,
        _apiClient = apiClient;

  CollectionReference get _deploy => _firestore.collection(FirebaseCollections.deploys);

  Stream<List<Deploy>?> getDeployModels(String uid) {
    return _deploy.where("uid", isEqualTo: uid).snapshots().map((event) {
      return event.docs
          .map(
            (doc) => Deploy.fromMap(doc.data() as Map<String, dynamic>),
          )
          .toList();
    });
  }

  Future<void> addDeployModel(Deploy deployModel) {
    try {
      return _deploy.doc(deployModel.id).set(deployModel.toMap());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> removeDeployModel(String id) {
    try {
      return _deploy.doc(id).delete();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Deploy> getDeployModelById(String id) {
    try {
      return _deploy
          .doc(id)
          .snapshots()
          .map(
            (event) => Deploy.fromMap(event.data() as Map<String, dynamic>),
          )
          .first;
    } catch (e) {
      throw Exception(e);
    }
  }
}

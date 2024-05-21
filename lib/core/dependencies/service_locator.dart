import 'package:algo_ease/data/remote/api_client.dart';
import 'package:algo_ease/features/auth/bloc/auth_bloc.dart';
import 'package:algo_ease/features/auth/repo/auth_repo.dart';
import 'package:algo_ease/features/deploy/bloc/deploy_bloc.dart';
import 'package:algo_ease/features/deploy/repo/deploy_repo.dart';
import 'package:algo_ease/features/order/bloc/order_bloc.dart';
import 'package:algo_ease/features/order/repo/order_repo.dart';
import 'package:algo_ease/features/strategy/bloc/strategy_bloc.dart';
import 'package:algo_ease/features/strategy/repo/strategy_repo.dart';
import 'package:algo_ease/features/user/bloc/user_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  //Api Client
  locator.registerSingleton<APIClient>(APIClient());

  //Firebase Firestore Instance
  locator.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  //Firebase Auth Instance
  locator.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);

  // Auth Bloc
  locator.registerSingleton<AuthBloc>(AuthBloc());

  // User Bloc
  locator.registerSingleton<UserBloc>(UserBloc());

  // Strategy Bloc
  locator.registerSingleton<StrategyBloc>(StrategyBloc());

  // Deploy Bloc
  locator.registerSingleton<DeployBloc>(DeployBloc());

  // Order Bloc
  locator.registerSingleton<OrderBloc>(OrderBloc());

  // Auth Repo
  locator.registerSingleton<AuthRepo>(AuthRepo(auth: locator<FirebaseAuth>()));

  // Strategy Repo
  locator.registerSingleton<StrategyRepo>(StrategyRepo(firestore: locator<FirebaseFirestore>(), apiClient: locator<APIClient>()));

  // Deploy Repo
  locator.registerSingleton<DeployRepo>(DeployRepo(firestore: locator<FirebaseFirestore>(), apiClient: locator<APIClient>()));

  // Order Repo
  locator.registerSingleton<OrderRepo>(OrderRepo(firestore: locator<FirebaseFirestore>(), apiClient: locator<APIClient>()));
}

import 'package:algo_ease/data/remote/api_client.dart';
import 'package:algo_ease/features/deploy/bloc/deploy_bloc.dart';
import 'package:algo_ease/features/deploy/repo/deploy_repo.dart';
import 'package:algo_ease/features/order/bloc/order_bloc.dart';
import 'package:algo_ease/features/order/repo/order_repo.dart';
import 'package:algo_ease/features/strategy/bloc/strategy_bloc.dart';
import 'package:algo_ease/features/strategy/repo/strategy_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  //Api Client
  locator.registerSingleton<APIClient>(APIClient());

  //Firebase Instance
  locator.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  // Strategy Bloc
  locator.registerSingleton<StrategyBloc>(StrategyBloc());

  // Deploy Bloc
  locator.registerSingleton<DeployBloc>(DeployBloc());

  // Order Bloc
  locator.registerSingleton<OrderBloc>(OrderBloc());

  // Strategy Repo
  locator.registerSingleton<StrategyRepo>(StrategyRepo(firestore: locator<FirebaseFirestore>(), apiClient: locator<APIClient>()));

  // Deploy Repo
  locator.registerSingleton<DeployRepo>(DeployRepo(firestore: locator<FirebaseFirestore>(), apiClient: locator<APIClient>()));

  // Order Repo
  locator.registerSingleton<OrderRepo>(OrderRepo(firestore: locator<FirebaseFirestore>(), apiClient: locator<APIClient>()));
}

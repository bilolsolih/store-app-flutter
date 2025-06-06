import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:store_app/core/app_state.dart';
import 'package:store_app/core/client.dart';
import 'package:store_app/core/connection_state.dart';
import 'package:store_app/data/repositories/auth_repository.dart';

final List<SingleChildWidget> dependencies = [
  ChangeNotifierProvider(create: (context) => AppState(), lazy: false),
  RepositoryProvider(create: (context) => ApiClient()),
  RepositoryProvider(create: (context) => AuthRepository(client: context.read())),
  BlocProvider(create: (context) => ConnectionStateCubit()),
];

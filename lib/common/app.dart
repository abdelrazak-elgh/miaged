import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miaged/common/constant.dart';
import 'package:miaged/data/repositories/auth_repository.dart';
import 'package:miaged/logic/bloc/auth/auth_bloc.dart';
import 'package:miaged/presentation/router/app_router.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => AuthRepository(),
        child: BlocProvider(
          create: (context) => AuthBloc(
            authRepository: RepositoryProvider.of<AuthRepository>(context),
          ),
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: Constant.appTitle,
              onGenerateRoute: _appRouter.onGenerateRoute),
        ));
  }
}

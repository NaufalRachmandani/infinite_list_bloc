import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_bloc/bloc/post_bloc.dart';
import 'package:infinite_list_bloc/navigation/app_navigator.dart';

import 'navigation/nav_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavCubit()),
          BlocProvider(
            create: (context) => PostBloc()..add(GetPostListEvent()),
          )
        ],
        child: AppNavigator(),
      ),
    );
  }
}

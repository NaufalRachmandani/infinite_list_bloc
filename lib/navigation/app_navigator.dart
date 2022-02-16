import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_bloc/ui/detail_page.dart';
import 'package:infinite_list_bloc/ui/main_page.dart';

import '../model/post.dart';
import 'nav_cubit.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, Post?>(builder: ((context, post) {
      return Navigator(
        pages: [
          const MaterialPage(child: MainPage()),
          if (post != null) MaterialPage(child: DetailPage(post: post))
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context).popToPosts();
          return route.didPop(result);
        },
      );
    }));
  }
}

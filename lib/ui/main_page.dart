import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_bloc/bloc/post_bloc.dart';
import 'package:infinite_list_bloc/ui/post_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController controller = ScrollController();
  late PostBloc bloc;

  void onScroll() {
    double maxScroll = controller.position.maxScrollExtent;
    double currentScroll = controller.position.pixels;

    if(currentScroll == maxScroll) bloc.add(GetPostListEvent());
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<PostBloc>(context);
    controller.addListener(onScroll);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Infinite list with Bloc"),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoadingState) {
              return const Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is PostLoadedState) {
              return ListView.builder(
                controller: controller,
                itemBuilder: (context, index) => (index < state.list.length)
                    ? PostItem(post: state.list[index])
                    : const Center(
                      child: SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(),
                        ),
                    ),
                itemCount: (state.hasReachedMax)
                    ? state.list.length
                    : state.list.length + 1,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_list_bloc/model/post.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostLoadingState()) {
    on<GetPostListEvent>(_getPostList);
  }

  void _getPostList(
      GetPostListEvent event, Emitter<PostState> emit) async {
    List<Post> list;
    if (state is PostLoadingState) {
      list = await Post.connectToAPI(0, 10);
      emit(PostLoadedState(list: list, hasReachedMax: false));
    } else {
      PostLoadedState postLoadedState = state as PostLoadedState;
      list = await Post.connectToAPI(postLoadedState.list.length, 10);
      emit(PostLoadedState(
          list: postLoadedState.list + list, hasReachedMax: list.isEmpty));
    }
  }
}

part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class PostLoadingState extends PostState {
  @override
  List<Object> get props => [];
}

class PostLoadedState extends PostState {
  final List<Post> list;
  final bool hasReachedMax;

  const PostLoadedState({required this.list, required this.hasReachedMax});

  @override
  List<Object> get props => [list, hasReachedMax];
}

part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class GetPostListEvent extends PostEvent {

  @override
  List<Object?> get props => [];
}
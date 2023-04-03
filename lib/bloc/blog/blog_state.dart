part of 'blog_bloc.dart';

abstract class BlogState extends Equatable {
  const BlogState();

  @override
  List<Object> get props => [];
}

class BlogInitial extends BlogState {}

class BlogLoading extends BlogState {}

class BlogLoaded extends BlogState {
  List<BlogModel> blogList = [];
  BlogLoaded({required this.blogList});
  @override
  List<Object> get props => [blogList];
}

class BlogSuccess extends BlogState {
  String? message;
  BlogSuccess({required this.message});
}

class BlogFailed extends BlogState {}

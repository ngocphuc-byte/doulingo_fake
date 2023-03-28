part of 'blog_bloc.dart';

abstract class BlogEvent extends Equatable {
  const BlogEvent();

  @override
  List<Object> get props => [];
}

class GetBlog extends BlogEvent {}

class CreateBlog extends BlogEvent {
  BlogModel blogModel;
  CreateBlog({required this.blogModel});
  List<Object> get props => [blogModel];
}

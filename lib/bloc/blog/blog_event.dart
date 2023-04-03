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

class UpdateBlog extends BlogEvent{
  BlogModel blogModel;
  UpdateBlog({required this.blogModel});
  List<Object> get props => [blogModel];
}

class RemoveBlog extends BlogEvent{
  String id;
  RemoveBlog({required this.id});
  List<Object> get props => [id];
}

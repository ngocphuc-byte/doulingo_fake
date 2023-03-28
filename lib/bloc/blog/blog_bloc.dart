import 'package:bloc/bloc.dart';
import 'package:doulingo_fake/data/repository/blog_repo.dart';
import 'package:doulingo_fake/models/blog_model.dart';
import 'package:equatable/equatable.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogRepo blogRepo = BlogRepo();
  BlogBloc() : super(BlogInitial()) {
    on<GetBlog>(getAllBlog);
    on<CreateBlog>(createBlog);
  }
  Future<void> getAllBlog(GetBlog event, Emitter<BlogState> emit) async {
    emit(BlogLoading());
    emit(BlogLoaded(blogList: await blogRepo.getAllBlogRepo()));
  }

  Future<void> createBlog(CreateBlog event, Emitter<BlogState> emit) async {
    String message = await blogRepo.createBlogRepo(event.blogModel);
    emit(BlogSuccess(message: message));
  }
}

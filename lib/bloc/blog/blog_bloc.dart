import 'package:bloc/bloc.dart';
import 'package:doulingo_fake/data/repository/blog_repo.dart';
import 'package:doulingo_fake/models/blog_model.dart';
import 'package:equatable/equatable.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogRepo blogRepo = BlogRepo();
  BlogBloc() : super(BlogInitial()) {
    on<GetBlog>(_getAllBlog);
    on<CreateBlog>(_createBlog);
    on<UpdateBlog>(_updateBlog);
    on<RemoveBlog>(_removeBlog);
  }
  Future<void> _getAllBlog(GetBlog event, Emitter<BlogState> emit) async {
    emit(BlogLoading());
    emit(BlogLoaded(blogList: await blogRepo.getAllBlogRepo()));
  }

  Future<void> _createBlog(CreateBlog event, Emitter<BlogState> emit) async {
    String message = await blogRepo.createBlogRepo(event.blogModel);
    emit(BlogSuccess(message: message));
  }

  Future<void> _updateBlog(UpdateBlog event, Emitter<BlogState> emit) async {
    final message = await blogRepo.updateBlog(event.blogModel);
    emit(BlogSuccess(message: message['message']));
  }

  Future<void> _removeBlog(RemoveBlog event, Emitter<BlogState> emit) async {
    final message = await blogRepo.removeBlog(event.id);
  }
}

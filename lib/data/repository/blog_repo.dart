import 'package:doulingo_fake/data/provider/blog_provider.dart';
import 'package:doulingo_fake/models/blog_model.dart';

class BlogRepo {
  BlogProvider blogProvider = BlogProvider();
  Future<List<BlogModel>> getAllBlogRepo() {
    return blogProvider.getAllBlogs();
  }

  Future createBlogRepo(BlogModel blogModel) async {
    return blogProvider.createBlog(blogModel);
  }
}

import 'package:dio/dio.dart';
import 'package:doulingo_fake/data/provider/user_provider.dart';
import 'package:doulingo_fake/models/blog_model.dart';
import 'package:hive_flutter/adapters.dart';

class BlogProvider {
  BaseURL baseURL = BaseURL();
  final dio = Dio();
  final loginBox = Hive.box('login');

  Future<List<BlogModel>> getAllBlogs() async {
    final token = loginBox.getAt(0)['token'];
    var blogList = <BlogModel>[];
    try {
      final response = await dio.get(
        baseURL.blogGetURL,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        response.data.forEach((ele) {
          blogList.add(BlogModel.fromJson(ele));
        });
      } else {
        print(response.data);
      }
    } catch (e) {
      print(e);
    }
    return blogList;
  }

  Future createBlog(BlogModel blogModel) async {
    final token = loginBox.getAt(0)['token'];
    try {
      final response = await dio.post(
        baseURL.blogCreateURL,
        data: blogModel,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
      if (response.statusCode == 200) {
        return response.data['message'];
      } else {
        print(response.data);
      }
    } catch (e) {
      print(e);
    }
  }

  Future updateBlog(BlogModel blogModel) async {
    final token = loginBox.getAt(0)['token'];
    try {
      final response = await dio.post(
        baseURL.blogUpdateURL,
        data: blogModel,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future removeBlog(String id) async {
    final token = loginBox.getAt(0)['token'];
    try {
      final response = await dio.post(
        baseURL.blogRemoveURL,
        data: {'_id': id},
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}

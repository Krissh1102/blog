library blog_bloc;

import 'package:blog/models/blog_model.dart';

import 'package:blog/services/blog_servies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'blog_state.dart';
part 'blog_events.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogService blogService;

  BlogBloc({required this.blogService}) : super(BlogLoading()) {
    on<FetchBlogs>((event, emit) async {
      try {
        final blogs = await blogService.fetchBlogs();
        emit(BlogLoaded(blogs: blogs));
      } catch (e) {
        emit(BlogError(message: e.toString()));
      }
    });
  }
}

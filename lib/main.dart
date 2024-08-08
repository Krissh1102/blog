import 'package:blog/bloc/blog_bloc.dart';
import 'package:blog/screens/blog_list.dart';

import 'package:blog/services/blog_servies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog Explorer',
      darkTheme: ThemeData(),
      home: BlocProvider(
        create: (context) =>
            BlogBloc(blogService: BlogService())..add(FetchBlogs()),
        child: BlogListScreen(),
      ),
    );
  }
}

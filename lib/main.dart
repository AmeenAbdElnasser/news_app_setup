import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_setup/cubits/article_cubit/article_cubit.dart';
import 'package:news_app_setup/service/new_service.dart';
import 'package:news_app_setup/views/home_view.dart';

void main() {
  runApp(BlocProvider(
    create: (context) {
      return ArticleCubit(NewService(Dio()));
    },
      child: const NewsApp()));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

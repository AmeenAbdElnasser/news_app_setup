import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_setup/cubits/article_cubit/article_cubit.dart';
import 'package:news_app_setup/model/article_model.dart';
import 'package:news_app_setup/service/new_service.dart';
import '../widget/categories_list_view.dart';
import '../widget/news_list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              'Cloud',
              style: TextStyle(
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<ArticleCubit, ArticleState>(builder: (context, state) {
        if (state is ArticleLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ArticleSuccess) {
          BlocProvider.of<ArticleCubit>(context).newService;
          return build(context);
        } else if (state is ArticleFailure){
          return const Text(
            'Something went wrong please try again',
          );
        } else {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: CategoriesListView(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 32),
                ),
                NewListViewBuilder(
                  category: 'sports',
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}

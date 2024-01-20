part of 'article_cubit.dart';

@immutable
abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleSuccess extends ArticleState {
  ArticleModel articleModel;
  ArticleSuccess({
    required this.articleModel,
});
}

class ArticleFailure extends ArticleState {
  String errMessage;
  ArticleFailure({required this.errMessage});
}

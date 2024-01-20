import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_setup/model/article_model.dart';
import 'package:news_app_setup/service/new_service.dart';
part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit(this.newService) : super(ArticleInitial());
  NewService newService;
  ArticleModel? articleModel;
  String? category;
  void getToHeadline({required String category}) async {
    emit(ArticleLoading());
    try {
     List<ArticleModel> articleModel = await newService.getTopHeadlines(category: category);
      emit(ArticleSuccess(
        articleModel: ArticleModel.fromJson(articleModel),
      ));
    } on Exception catch (e) {
      emit(ArticleFailure(errMessage: ''));
    }
  }
}

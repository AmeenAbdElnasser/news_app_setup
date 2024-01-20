import 'package:dio/dio.dart';
import 'package:news_app_setup/model/article_model.dart';

class NewService {
  final Dio dio;
  NewService(
    this.dio,
  );
  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=6564bca3d4f04d62ad369ea9451bc35a',
      );
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData["articles"];
      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}

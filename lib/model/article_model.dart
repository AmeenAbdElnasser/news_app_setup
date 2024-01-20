class ArticleModel{
  final String? image;
  final String title;
  final String? desc;
  ArticleModel({
    required this.image,
    required this.title,
    required this.desc,
});
  factory ArticleModel.fromJson(json){
    return ArticleModel(
      image: json['urlToImage'],
      title: json['title'],
      desc: json['description'],
    );
  }
}
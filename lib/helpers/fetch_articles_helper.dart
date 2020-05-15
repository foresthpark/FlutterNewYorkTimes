import 'package:nytflutter/models/Article.dart';
import 'package:nytflutter/services/APIServices.dart';

Future<dynamic> fetchArticles(String category) async {
  String str = category.toLowerCase();

  var data = await APIService().fetchArticlesBySection(str);

  var article = Article.fromJson(data);
  print("HE:LLLOO??");
  print(article.results[1].title);

  return article;
}

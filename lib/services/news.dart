import 'dart:convert';

import 'package:news_flutter/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news=[];

  Future<void> getNews()async{
    String url="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f9940fd5a2f84f99a67db675e1469e69";

    var response= await http.get(Uri.parse(url));

    var jsonData= jsonDecode(response.body);

    if(jsonData['status']=='ok'){
      jsonData["articles"].forEach((element){
          if(element["urlToImage"]!=null && element['description']!=null){
            ArticleModel articleModel= ArticleModel(
              title:element["title"],
              description:element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["content"],
              author: element["author"],
            );
            news.add(articleModel);
          }
      });
    }
  }
}
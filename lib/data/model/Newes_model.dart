class NewsModel{
  String? status;
  int? totalResults;
  List? articles;

  NewsModel.fromJson(Map<String,dynamic>? json){
    status=json?['status'];
    totalResults=json?['totalResults'];
    articles=json?['articles'].map((e) =>Article.fromJson(e)).toList();
  }


}

class Article{

  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  Source? source;

  Article.fromJson(Map<String,dynamic>? json){
    author=json?['author'];
    title=json?['title'];
    description=json?['description'];
    url=json?['url'];
    urlToImage=json?['urlToImage'];
    publishedAt=json?['publishedAt'];
    content=json?['content'];
    source=Source.fromJson(json?['source']);
  }


}

class Source {
  String? id;
  String? name;
  Source.fromJson(Map<String,dynamic>? json){
    id=json?["id"];
    name=json?["name"];
  }
}
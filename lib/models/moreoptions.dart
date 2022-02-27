// To parse this JSON data, do
//
//     final options = optionsFromJson(jsonString);

import 'dart:convert';

Options optionsFromJson(String str) => Options.fromJson(json.decode(str));

String optionsToJson(Options data) => json.encode(data.toJson());

class Options {
    Options({
        this.status,
        this.totalResults,
        this.articles,
    });

    String ?status;
    int ? totalResults;
    List<Article>  ? articles;

    factory Options.fromJson(Map<String, dynamic> json) => Options(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles!.map((x) => x.toJson())),
    };
}

class Article {
    Article({
        this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content,
    });

    Source ?source;
    String ?author;
    String ?title;
    String ?description;
    String ?url;
    String ?urlToImage;
    DateTime ?publishedAt;
    String ?content;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "source": source!.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt!.toIso8601String(),
        "content": content,
    };
}

class Source {
    Source({
        this.id,
        this.name,
    });

    String ? id;
    String ? name;

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name,
    };
}

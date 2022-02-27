import 'dart:convert';

import 'package:flutter_news/models/article.dart';
import 'package:flutter_news/models/moreoptions.dart';
import 'package:flutter_news/models/techModel.dart';
import 'package:flutter_news/service/api_const.dart';
import 'package:http/http.dart' as http;

Future<NewsModel> fetchNews() async {
  final response =  await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=us&apiKey=013f67ed3f814fa691bf9cfe79244c87"));
  // print(response.body);
  if (response.statusCode == 200) {
    return NewsModel.fromJson(jsonDecode(response.body));
  }else{
    throw Exception("Error loading news");  
  }
  
}


Future <TechModel> getTech() async {
  final response = await http.get(Uri.parse("https://newsapi.org/v2/everything?domains=wsj.com&apiKey=013f67ed3f814fa691bf9cfe79244c87"));
  if (response.statusCode == 200) {
    return TechModel.fromJson(jsonDecode(response.body));
  } else{
    throw Exception('Error getting tech news');
  }
}


Future <Options> getOptions(String option) async {
  final response = await http.get(Uri.parse("https://newsapi.org/v2/everything?q=$option&apiKey=013f67ed3f814fa691bf9cfe79244c87"));
  if (response.statusCode == 200) {
    return Options.fromJson(jsonDecode(response.body));
  } else{
    throw Exception('Error getting tech news');
  }
} 
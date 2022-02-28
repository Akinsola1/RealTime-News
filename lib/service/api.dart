import 'dart:convert';
import 'dart:async';
import 'package:flutter_news/models/article.dart';
import 'package:flutter_news/models/bitcoinPrice.dart';
import 'package:flutter_news/models/moreoptions.dart';
import 'package:flutter_news/models/techModel.dart';
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


class CryptoList {
  List <Crypto> _cryptoList = <Crypto>[];


  Future<List<Crypto> > fetchPost() async {
  List<Crypto> _postList = <Crypto>[];
    final response =
    await http.get(Uri.parse("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"));

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      List<dynamic> values= <dynamic>[];
      values = json.decode(response.body);
      if(values.length>0){
        for(int i=0;i<values.length;i++){
          if(values[i]!=null){
            Map<String,dynamic> map=values[i];
            _postList.add(Crypto.fromJson(map));
            print('Id-------${map['id']}');
          }
        }
        _cryptoList = _postList;
      }
      return _postList;

    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}

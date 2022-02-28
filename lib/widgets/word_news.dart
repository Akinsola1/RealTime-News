// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_news/models/article.dart';
import 'package:flutter_news/screens/article_details.dart';
import 'package:flutter_news/service/api.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderRow extends StatefulWidget {
  HeaderRow({
    Key? key,
  }) : super(key: key);

  @override
  State<HeaderRow> createState() => _HeaderRowState();
}

class _HeaderRowState extends State<HeaderRow> {
  late Future<NewsModel> fetchnews;
  @override
  void initState() {
    fetchnews = fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsModel>(
        future: fetchnews,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              height: 400,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    var article = snapshot.data!.articles![index];
                    var formattedTime = DateFormat('dd MMM - HH:mm')
                        .format(article.publishedAt!);
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ArticleaDetails(
                                      imageUrl: article.urlToImage!,
                                      title: article.title!,
                                      author: article.author!,
                                      content: article.content!,
                                      description: article.description!,
                                      time: formattedTime,
                                      url: article.url!,
                                    )));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: Stack(children: [
                            Container(
                                height: 400,
                                width: 250,
                                child: Hero(
                                    tag: "tech-image-${article.urlToImage}",
                                    child: Image(
                                      image: CachedNetworkImageProvider(
                                          article.urlToImage!),
                                      fit: BoxFit.cover,
                                    ))),
                          Container(
                            height: 400,
                            width: 250,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                  Colors.transparent,
                                  Colors.black
                                ])),
                          ),
                          Column(
                            children: [
                              Spacer(),
                              SizedBox(
                                width: 250,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: Text(
                                    article.title!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
                      ),
                    );
                  }),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                        width: 15,
                      ),
                  itemCount: snapshot.data!.articles!.length),
            );
          } else {
            return Center(
                child: Lottie.network(
                    "https://assets9.lottiefiles.com/packages/lf20_vmkcywu4.json",fit: BoxFit.cover));
          }
        });
  }
}

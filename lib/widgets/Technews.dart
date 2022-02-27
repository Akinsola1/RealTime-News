import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../models/techModel.dart';
import '../screens/article_details.dart';
import '../service/api.dart';

class TechNews extends StatefulWidget {
  const TechNews({Key? key}) : super(key: key);

  @override
  _TechNewsState createState() => _TechNewsState();
}

class _TechNewsState extends State<TechNews> {
  late Future<TechModel> techNews;
  List<Article> article = [];

  @override
  void initState() {
    techNews = getTech();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<TechModel>(
        future: techNews,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: ((context, index) {
                    var techArticle = snapshot.data!.articles![index];
                    var formattedTime = DateFormat('dd MMM - HH:mm')
                        .format(techArticle.publishedAt!);
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ArticleaDetails(
                                      imageUrl: techArticle.urlToImage!,
                                      title: techArticle.title!,
                                      author: techArticle.author!,
                                      content: techArticle.content!,
                                      description: techArticle.description!,
                                      time: formattedTime,
                                      url: techArticle.url!,
                                    )));
                      },
                      child: Container(
                          height: 150,
                          width: size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 130,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                techArticle.urlToImage!),
                                            fit: BoxFit.cover))),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        techArticle.title!,
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      formattedTime,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )),
                    );
                  }),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                        height: 10,
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

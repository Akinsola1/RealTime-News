// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/screens/article_details.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_news/models/moreoptions.dart';
import 'package:flutter_news/service/api.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class moreOption extends StatefulWidget {
  final String Option;
  const moreOption({
    Key? key,
    required this.Option,
  }) : super(key: key);

  @override
  _moreOptionState createState() => _moreOptionState();
}

class _moreOptionState extends State<moreOption> {
  late Future<Options> moreOption;
  List<Article> article = [];

  @override
  void initState() {
    moreOption = getOptions(widget.Option);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        Text(
          widget.Option,
          style: GoogleFonts.montserrat(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
        ),
        SizedBox(height: 20,),
        FutureBuilder<Options>(
            future: moreOption,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                        itemCount: snapshot.data!.articles!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: MediaQuery.of(context).orientation ==
                                  Orientation.landscape
                              ? 3
                              : 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 8,
                          childAspectRatio: (0.7),
                        ),
                        itemBuilder: (context, index) {
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
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: CachedNetworkImageProvider(article.urlToImage!),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration:  BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                          gradient: const LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                            Colors.transparent,
                                            Colors.black
                                          ])),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Spacer(),
                                          Text(
                                            article.title!,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 4,
                                            style: GoogleFonts.montserrat(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          );
                        }),
                  ),
                );
              } else {
                return Center(
                child: Column(
                  children: [
                    Lottie.network(
                        "https://assets9.lottiefiles.com/packages/lf20_vmkcywu4.json",fit: BoxFit.cover),
                    Text("Be Patient")
                  ],
                ));
              }
            }),
            SizedBox(height: 10,)
      ])),
    );
  }

}

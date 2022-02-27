// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleaDetails extends StatelessWidget {
  final String imageUrl;
  final String title;
  String? content;
  final String description;
  final String time;
  final String author;
  final String url;
  ArticleaDetails({
    Key? key,
    required this.imageUrl,
    required this.title,
    this.content,
    required this.description,
    required this.time,
    required this.author,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Article Details",
                  style: GoogleFonts.montserrat(
                    color: Colors.grey.shade800,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20,),
                Hero(
                  tag: 'image',
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) {
                      return Center(
                          child: Lottie.network(
                              "https://assets9.lottiefiles.com/packages/lf20_vmkcywu4.json",
                              fit: BoxFit.cover));
                    },
                    errorWidget: (context, url, error) {
                      return Center(
                          child: Lottie.network(
                              "https://assets9.lottiefiles.com/packages/lf20_vmkcywu4.json",
                              fit: BoxFit.cover));
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        author,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                            color: Colors.grey.shade700,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(' • '),
                    time == null
                        ? Text("00 Jan - 00:00",
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))
                        : Text(
                            time,
                            style: GoogleFonts.montserrat(
                              color: Colors.grey.shade700,
                              fontSize: 18,
                            ),
                          ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark_add_outlined,
                          size: 30,
                        ))
                  ],
                ),
                Column(
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),Text(
                            "${description}.",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                              color: Colors.grey.shade800,
                              fontSize: 18,
                            ),
                          ),Text(
                            content!,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                              color: Colors.grey.shade800,
                              fontSize: 18,
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        launch(url);
                      },
                      child: Text(
                        url,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

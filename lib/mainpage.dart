import 'package:flutter/material.dart';
import 'package:flutter_news/widgets/cryptoprice.dart';
import 'package:flutter_news/widgets/moreoption.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import 'widgets/Technews.dart';
import 'widgets/word_news.dart';


class Mainpage extends StatelessWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Breaking News',
            style: GoogleFonts.montserrat(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  LineIcons.verticalEllipsis,
                  color: Colors.black,
                  size: 30,
                ))
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderRow(),
                  const SizedBox(height: 20),
                  Text(
                    'Trending',
                    style: GoogleFonts.montserrat(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 10),
                 const MoreOption(),
                 const SizedBox(height: 20,),
                 Text(
                   'Crypto Price',
                   style: GoogleFonts.montserrat(
                     color: Colors.grey.shade700,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                   )
                 ),
                 CryptoPrice(),
                 const SizedBox(
                     height: 20,
                   ),
                  Text(
                    'Wall Street Journal',
                    style: GoogleFonts.montserrat(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TechNews(),
                ],
              ),
            ),
          ),
        ));
  }
}

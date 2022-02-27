import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/screens/more_option.dart';
import 'package:google_fonts/google_fonts.dart';

List moreOptionList = [
  {
    'title': "Tesla",
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/e/e8/Tesla_logo.png',
  },
  {
    'title': "Bitcoin",
    'image':
        'https://bitcoin.org/img/icons/opengraph.png?1644775669'
  },
  {
    'title': "Apple",
    'image': 'https://media.idownloadblog.com/wp-content/uploads/2018/07/Apple-logo-black-and-white.png'
  },
  {
    'title': "Phones",
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Xiaomi_logo_%282021-%29.svg/640px-Xiaomi_logo_%282021-%29.svg.png',
  },
  {
    'title': "Music",
    'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Spotify_logo_without_text.svg/2048px-Spotify_logo_without_text.svg.png'
  },
  {
    'title': "Movies",
    'image': 'https://cdn.vox-cdn.com/thumbor/Yq1Vd39jCBGpTUKHUhEx5FfxvmM=/39x0:3111x2048/1200x800/filters:focal(39x0:3111x2048)/cdn.vox-cdn.com/uploads/chorus_image/image/49901753/netflixlogo.0.0.png'
  },
];

class MoreOption extends StatelessWidget {
  const MoreOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: moreOptionList.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => moreOption(Option: moreOptionList[index]['title'])));
              },
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  children: [
                Center(
                  child: Container(
                    height: 50,
                  width: 120,
                    child: Image(
                        image: CachedNetworkImageProvider(moreOptionList[index]['image']),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.grey.shade700])),
                ),
                Center(
                  child: Text(
                    moreOptionList[index]['title'],
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

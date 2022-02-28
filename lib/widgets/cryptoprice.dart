import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/bitcoinPrice.dart';
import '../service/api.dart';

class CryptoPrice extends StatefulWidget {
  const CryptoPrice({Key? key}) : super(key: key);

  @override
  _CryptoPriceState createState() => _CryptoPriceState();
}

class _CryptoPriceState extends State<CryptoPrice> {
  late Future<List<Crypto>> crypto;

  @override
  void initState() {
    crypto = CryptoList().fetchPost();
    CryptoList().fetchPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Crypto>>(
        future: crypto,
        builder: (context, snapshot) {
          return SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        )
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              snapshot.data!.elementAt(index).name.toString(),
                              maxLines: 2,
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                              )
                            ),
                            Image.network(snapshot.data!.elementAt(index).image.toString(), height: 50, width: 50,),
                            SizedBox(
                              width: 90,
                              child: Text(
                                " \$ ${snapshot.data!.elementAt(index).currentPrice.toString()}",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                                )
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }))
            );
        });
  }
}

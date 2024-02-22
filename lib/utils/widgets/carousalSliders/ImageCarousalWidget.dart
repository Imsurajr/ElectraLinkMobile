import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../constants.dart';

class ImageCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: AppConstants.screenHeight(context) * 0.15,
        aspectRatio: 16 / 9,
        viewportFraction: 0.80,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: images.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: AppConstants.screenWidth(context) * 0.90,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  child: Image.network(
                    url,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),

    );
  }
  final List<String> images = [
    'https://cdn.discordapp.com/attachments/1050749468728893463/1185093093205233694/img1.jpeg?ex=658e5af3&is=657be5f3&hm=327d6e971e754af31336f3164295707213317f7d978f1170a7feb25023e316d6&',
    'https://cdn.discordapp.com/attachments/1050749468728893463/1185093093687562270/img2.jpeg?ex=658e5af3&is=657be5f3&hm=26d0552242fcd415b26a48251a52fad32c38694f5b2cd5413e7f6aed51206085&',
    'https://cdn.discordapp.com/attachments/1050749468728893463/1185095937404698695/Best_EV_Stocks_in_India.jpg?ex=658e5d99&is=657be899&hm=0288a5eda7a91b4645e2538fd0a2138d66908ffdb0e7d2542f730e2df7e12c1c&',
  ];
}

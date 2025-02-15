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
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
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
              width: AppConstants.screenWidth(context) * 0.9,
              margin: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  child: Image(
                    fit: BoxFit.cover,
                    image: url,
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  final List<ImageProvider> images = [
    AssetImage("assets/images/carousalImage1.jpg"),
  ];
}

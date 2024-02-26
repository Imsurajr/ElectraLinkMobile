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
    //todo change the link
    'https://imgs.search.brave.com/W4e9bNucT6ZcpQuM_SVwOH3v4LxCj6ljLQaf8f6Ct_o/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93d3cu/a2FzYW5kYm94Lm9y/Zy9wcm9ncmFtbWlu/Zy1pbWFnZXMvYXZh/dGFycy9sZWFmZXJz/LXNhcGxpbmcucG5n'];
}

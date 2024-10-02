import 'package:flutter/material.dart';

class size{


  static SizedBox height (double height)=> SizedBox(height: height,);
  static SizedBox width (double width)=> SizedBox(width: width);
  

   static double widthMedia(BuildContext context, double percentage) {
    return MediaQuery.sizeOf(context).width * percentage;
  }

  static double heightMedia(BuildContext context, double percentage) {
    return MediaQuery.sizeOf(context).height * percentage;
  }
}



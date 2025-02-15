import 'package:flutter/material.dart';

RoundedElevatedButton(String text, Color color, void Function() onPressed) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
    ),
    onPressed: onPressed,
    child: Text(
      "$text",
      style: TextStyle(
        fontFamily: "MontserratBold",
        fontSize: 20,
        color: Colors.white,
      ),
    ),
  );
}

LoginSignupAnotherWay(String mainText, Color mainTextColor, String buttonText,
    Color buttonTextColor, void Function() onPressed) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "$mainText",
        style: TextStyle(
            fontFamily: "MontserratBold",
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: mainTextColor),
      ),
      TextButton(
        onPressed: onPressed,
        child: Text(
          "$buttonText",
          style: TextStyle(
              fontFamily: "MontserratBold",
              decoration: TextDecoration.underline,
              decorationThickness: 3.5,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: buttonTextColor),
        ),
      ),
    ],
  );
}

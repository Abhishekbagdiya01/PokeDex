import 'package:flutter/material.dart';

Widget appTitle(title) {
  return Text(
    title,
    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
  );
}

Widget pokemonName(var title) {
  return Text(
    title,
    style: TextStyle(
        color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
  );
}

Widget pokeTypeText({List? title, Color? color, double? fontSize}) {
  return Text(
    title!.join(" , ").toString(),
    style: TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize ?? 20,
        fontWeight: FontWeight.bold),
  );
}

Widget pokeTypeContainer({List? title, Color? color, double? fontSize}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(.30),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Center(
        child: pokeTypeText(color: color, title: title, fontSize: fontSize)),
  );
}

Widget pokeCategoryText({title, Color? color, double? fontSize}) {
  return Text(
    title.toString(),
    style: TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize ?? 20,
        fontWeight: FontWeight.bold),
  );
}

Widget pokeCategoryContainer(
    {title, Color? color, Color? cColor, double? fontSize}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    decoration: BoxDecoration(
      color: cColor?.withOpacity(.30) ?? Colors.white.withOpacity(.30),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Center(
        child:
            pokeCategoryText(color: color, title: title, fontSize: fontSize)),
  );
}

Widget pokeAbout(title) {
  return Text(
    title,
    style: TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
  );
}

Widget normalText({
  title,
  color,
}) {
  return Text(
    title,
    style: TextStyle(
      color: color ?? Colors.black,
      fontSize: 18,
    ),
  );
}

Widget headingText({String? text, Color? color, double? size}) {
  return Text(text!,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
      ));
}

Widget statsBar({int? stats, String? text}) {
  return Row(
    // mainAxisAlignment: MainAxisAlignment.spaceAround,

    children: [
      SizedBox(
          width: 100,
          child: normalText(title: text, color: Colors.black.withOpacity(.6))),
      SizedBox(
        width: 100,
        child: normalText(
          title: stats.toString(),
        ),
      ),
      Container(
          width: stats!.toDouble(),
          height: 3,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          )),
    ],
  );
}

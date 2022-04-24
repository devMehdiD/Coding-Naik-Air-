import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<dynamic> text = [
  "Basketball",
  "Running",
  "Traning",
];

// ignore: camel_case_types
class chose {
  dynamic price;
  dynamic name;
  dynamic decs;
  dynamic txt;
  dynamic image;
  dynamic color;
  chose(
      {required this.name,
      required this.price,
      required this.decs,
      required this.txt,
      required this.image,
      required this.color});
}

List naik = [
  chose(
      name: "NAIK 2021",
      price: "199 \$",
      decs: "AIR JORDAN 3 Mid SE EL",
      txt: "NAIK\nAIR",
      image: "image/Z_003.png",
      color: Colors.green),
  chose(
      name: "NAIK 2020",
      price: "100 \$",
      decs: "AIR JORDAN 1 Mid SE EG",
      txt: "NAIK\nAIR",
      image: "image/J_001.png",
      color: Colors.yellow),
  chose(
      name: "NAIK 2021",
      price: "199 \$",
      decs: "AIR JORDAN 3 Mid SE EL",
      txt: "NAIK\nAIR",
      image: "image/J_002.png",
      color: Colors.lightBlueAccent),
  chose(
      name: "NAIK 2022",
      price: "299 \$",
      decs: "AIR JORDAN 2 Mid SE EP",
      txt: "NAIK\nAIR",
      image: "image/Z_002.png",
      color: Colors.red),
  chose(
      name: "NAIK 2021",
      price: "599 \$",
      decs: "AIR JORDAN 3 Mid SE EL",
      txt: "NAIK\nAIR",
      image: "image/N_001.png",
      color: Colors.deepPurpleAccent),
  chose(
      name: "NAIK 2021",
      price: "599 \$",
      decs: "Naik Ari 3 Mid SE EL",
      txt: "NAIK\nAIR",
      image: "image/N_002.png",
      color: Colors.deepPurple),
  chose(
      name: "NAIK 2021",
      price: "193 \$",
      decs: "AIR JORDAN 3 Mid SE EL",
      txt: "NAIK\nAIR",
      image: "image/N_003.png",
      color: Colors.deepOrange),
];

sizechose(indexsize, Size size) {
  switch (indexsize) {
    case 0:
      return (size.height * 0.09);
    case 1:
      return (size.height * 0.07);
    case 2:
      return (size.height * 0.05);
  }
}

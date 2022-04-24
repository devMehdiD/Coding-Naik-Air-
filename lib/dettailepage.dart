import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'list.dart';

// ignore: must_be_immutable
class Dettaillepage extends StatefulWidget {
  chose selctedchose;
  Dettaillepage({
    Key? key,
    required this.selctedchose,
  }) : super(key: key);

  @override
  _DettaillepageState createState() => _DettaillepageState();
}

class _DettaillepageState extends State<Dettaillepage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int sizeindex = 2;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            right: -size.height * 0.20,
            top: -size.height * 0.15,
            child: TweenAnimationBuilder<double>(
              duration: Duration(milliseconds: 250),
              tween: Tween(begin: 0, end: 1),
              builder: (_, value, child) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 900),
                  height: value * size.height * 0.5,
                  width: value * size.height * 0.5,
                  decoration: BoxDecoration(
                      color: widget.selctedchose.color, shape: BoxShape.circle),
                );
              },
            )),
        Positioned(
            top: size.height * 0.05,
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_outlined)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
                ],
              ),
              width: size.width,
            )),
        Positioned(
            top: size.height * 0.20,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(57),
              child: FittedBox(
                child: Text(
                  widget.selctedchose.name,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
            )),
        AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            top: size.height * 0.20,
            left: sizechose(sizeindex, size),
            right: sizechose(sizeindex, size),
            child: Hero(
                tag: widget.selctedchose.name,
                child: Image(
                  image: AssetImage(
                    widget.selctedchose.image,
                  ),
                ))),
        Positioned(
          top: size.height * 0.6,
          left: 10,
          child: TweenAnimationBuilder<Offset>(
            tween: Tween(begin: Offset(-1, 1), end: Offset.zero),
            curve: Curves.elasticInOut,
            duration: const Duration(milliseconds: 900),
            builder: (_, val, child) {
              return Transform.translate(
                offset: val * 140,
                child: child,
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.selctedchose.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.selctedchose.decs,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        widget.selctedchose.price,
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Row(
                    children:
                        // ignore: unrelated_type_equality_checks
                        List.generate(
                            5,
                            (index) => index == 4
                                ? const Icon(
                                    Icons.star_outline,
                                    color: Colors.white,
                                  )
                                : Icon(Icons.star_outline,
                                    color: widget.selctedchose.color))),
                const Text(
                  "Size",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
                Row(
                    children: List.generate(3, (index) {
                  // ignore: unused_local_variable
                  // chose item = naik[index];

                  return SizedBox(
                      height: 50,
                      width: 50,
                      child: Card(
                          child: MaterialButton(
                        color: index == sizeindex
                            ? widget.selctedchose.color
                            : Colors.white,
                        onPressed: () {
                          setState(() {
                            sizeindex = index;
                          });
                        },
                        child: Text(
                          '${index + 7}',
                          style: TextStyle(color: Colors.black),
                        ),
                      )));
                })),
                const Text(
                  "Color",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
                Row(
                  children: List.generate(naik.length, (index) {
                    chose item = naik[index];
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.selctedchose = item;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 900),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: item == widget.selctedchose
                                        ? Colors.white
                                        : Colors.transparent,
                                    width: 2),
                                color: item.color,
                                shape: BoxShape.circle),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    clipBehavior: Clip.antiAlias,
                    color: widget.selctedchose.color,
                    // ignore: avoid_returning_null_for_void
                    onPressed: () => null,
                    child: const Text("Buy"),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

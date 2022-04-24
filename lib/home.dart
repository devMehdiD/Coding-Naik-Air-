import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nik/dettailepage.dart';
import 'package:nik/list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  ScrollController controller = ScrollController();
  late int selectedindex = 0;
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

  Color color = Colors.green;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0x002f3136),
        leading: Image.asset("image/nike_w.png"),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: text.length,
                itemBuilder: (_, index) {
                  var textvallue = text[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(textvallue,
                        style: index == 0 ? TextStyle(color: color) : null),
                  );
                }),
          ),
          Expanded(
              child: PageView.builder(
                  onPageChanged: (i) {
                    setState(() {
                      selectedindex = i;

                      chose child = naik[i];
                      color = child.color;
                    });
                  },
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: naik.length,
                  itemBuilder: (_, index) {
                    chose item = naik[index];
                    double scale = selectedindex == index ? 1 : 0.9;
                    return TweenAnimationBuilder<double>(
                      curve: Curves.ease,
                      tween: Tween(begin: scale, end: scale),
                      duration: const Duration(seconds: 1),
                      builder: (_, scale, child) {
                        return Transform.scale(
                          scale: scale * 0.9,
                          child: child,
                        );
                      },
                      child: Stack(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 50,
                            right: 50,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Dettaillepage(
                                            selctedchose: item,
                                          )));
                            },
                            child: Container(
                              height: 600,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              width: MediaQuery.of(context).size.width - 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      "${item.name}",
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      "${item.decs}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      "${item.price}",
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      "${item.txt}",
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 80,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 500,
                            left: 262,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    color: item.color,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    )),
                                height: 100,
                                width: 100,
                                child: const Icon(Icons.add),
                              ),
                            )),
                        Positioned(
                          top: size * 0.2,
                          left: size * 0.020,
                          right: size * 0.020,
                          child: SizedBox(
                            height: 300,
                            child: Hero(
                                tag: item.name,
                                child: Image.asset("${item.image}")),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: size * 0.050,
                          right: size * 0.050,
                          child: Container(
                            height: 60,
                            width: 300,
                            decoration: BoxDecoration(
                                color: item.color,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(Icons.add),
                                Icon(Icons.home),
                                Icon(Icons.shopping_bag)
                              ],
                            ),
                          ),
                        )
                      ]),
                    );
                  }))
        ],
      ),
    );
  }
}

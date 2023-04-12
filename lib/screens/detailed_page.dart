import 'package:flutter/material.dart';
import 'package:pokedesk_app/screens/home_screen.dart';

import '../const/ui_helper.dart';

class DetailedScreen extends StatelessWidget {
  DetailedScreen({required this.index, required this.data, super.key});
  late var index;
  final data;
  late var newdata;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_sharp),
            onPressed: () => Navigator.pop(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        HomeScreen(),
                    transitionDuration: Duration(seconds: 1))),
          ),
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
              width: double.infinity,
              color: Colors.redAccent,
              padding: EdgeInsets.only(left: 10),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      "assets/images/pokeball.png",
                      height: 200,
                      width: 200,
                      color: Colors.white.withOpacity(.40),
                    ),
                  ),
                  pokemonName(data[index]["name"]),
                  Positioned(
                    top: 35,
                    child: Row(
                      children: [
                        pokeTypeContainer(title: data[index]["typeofpokemon"]),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: 75,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.7),
                                borderRadius: BorderRadius.circular(25)),
                            child: Icon(
                              Icons.catching_pokemon,
                              size: 40,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          pokeCategoryContainer(
                              cColor: Colors.yellowAccent,
                              title: data[index]["category"]),
                        ],
                      )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Hero(
                      tag: index,
                      child: Image.network(
                        data[index]["imageurl"],
                        height: 250,
                        width: 250,
                      ),
                    ),
                  ),
                ],
              ),
            )),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                child: Column(
                  children: [
                    TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                              child: Text(
                            "About",
                          )),
                          Tab(
                              child: Text(
                            "Power stats",
                          ))
                        ]),
                    Expanded(
                      child: TabBarView(children: [
                        Container(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                pokeAbout(data[index]["xdescription"]),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: 80,
                                    width: width - 100,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      elevation: 1,
                                      color: Colors.white.withOpacity(.5),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              normalText(title: "Height"),
                                              normalText(title: "Weight")
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              normalText(
                                                  title: data[index]["height"]),
                                              normalText(
                                                  title: data[index]["weight"])
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                headingText(text: "Breading", size: 20),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text("Gender"),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text("Male")
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text("Egg cycle"),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(data[index]["egg_groups"])
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "category",
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(data[index]["category"])
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                statsBar(stats: data[index]["hp"], text: "Hp"),
                                statsBar(
                                    stats: data[index]["attack"],
                                    text: "Attack"),
                                statsBar(
                                    stats: data[index]["defense"],
                                    text: "Defense"),
                                statsBar(
                                    stats: data[index]["speed"], text: "Speed"),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  child: Row(
                                    children: [
                                      normalText(
                                        title: "Weaknesses : ",
                                        color: Colors.black.withOpacity(.5),
                                      ),
                                      pokeTypeContainer(
                                          color: Colors.black,
                                          fontSize: 20,
                                          title: data[index]["weaknesses"])
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  child: Row(
                                    children: [
                                      normalText(
                                        title: "Ability : ",
                                        color: Colors.black.withOpacity(.5),
                                      ),
                                      pokeTypeContainer(
                                          color: Colors.black,
                                          title: data[index]["abilities"])
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

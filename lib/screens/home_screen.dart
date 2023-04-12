import 'package:flutter/material.dart';
import 'package:pokedesk_app/apis/poke_api.dart';
import 'package:pokedesk_app/const/ui_helper.dart';
import 'package:pokedesk_app/screens/detailed_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Center(child: appTitle("Pokedex")),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: FutureBuilder(
                future: getApi(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data;
                    return GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: width <= 600
                              ? 2
                              : width <= 1000
                                  ? 4
                                  : 6,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      DetailedScreen(index: index, data: data),
                              transitionDuration: Duration(seconds: 1),
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 8,
                              left: 8,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(12)),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: -20,
                                  right: -20,
                                  child: Image.asset(
                                    "assets/images/pokeball.png",
                                    height: 150,
                                    width: 150,
                                    color: Colors.white.withOpacity(.40),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Hero(
                                    tag: index,
                                    child: Image.network(
                                      data[index]["imageurl"],
                                      height: 150,
                                      width: 150,
                                    ),
                                  ),
                                ),
                                pokemonName(data[index]["name"]),
                                Positioned(
                                    top: 35,
                                    child: pokeTypeContainer(
                                        title: data[index]["typeofpokemon"])),
                                // Positioned(
                                //     top: 75,
                                //     child: pokeTypeContainer(
                                //         data[index]["typeofpokemon"])),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else
                    return Center(
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.grey)),
                    );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:bringin_assesment/presentation/screen/pokemon_details_screen.dart';
import 'package:bringin_assesment/presentation/state_holders/pokemon_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final PokemonController _pokemonController = Get.find<PokemonController>();
  void _searchPokemon() {
    _pokemonController.getPokemon(_searchController.text.trim().toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Pokemon'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      labelText: 'Search Pokemon',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _searchPokemon,
                  icon: const Icon(
                    CupertinoIcons.search,
                    size: 40,
                  ),
                ),
              ],
            ),
            GetBuilder<PokemonController>(
              builder: (controller) {
                if (controller.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (controller.errorMessage.isNotEmpty) {
                  return Center(
                    child: Text(controller.errorMessage),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: controller.pokemonList.length,
                      itemBuilder: (context, index) {
                        final pokemon = controller.pokemonList[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              () => PokemonDetailsScreen(pokemon: pokemon),
                            );
                            _searchController.clear();
                          },
                          child: Card(
                            elevation: 4,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              side: BorderSide(
                                color: Colors.black12,
                                width: 4.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.transparent,
                                    child: SvgPicture.network(
                                      pokemon.image,
                                    ),
                                  ),
                                  Text(
                                    pokemon.name,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

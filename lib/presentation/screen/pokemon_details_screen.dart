import 'package:bringin_assesment/data/models/pokemon_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PokemonDetailsScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailsScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details for ${pokemon.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: SvgPicture.network(
                    pokemon.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    side: BorderSide(
                      color: Colors.black,
                      width: 4.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "#${pokemon.id}",
                          style: const TextStyle(
                            fontSize: 24.0,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          pokemon.name,
                          style: const TextStyle(
                            fontSize: 34.0,
                            color: Colors.black87,
                          ),
                        ),
                        Text("Type: ${pokemon.type}",
                            style: const TextStyle(fontSize: 18)),
                        Text("Abilities: ${getAbilitiesText()}",
                            style: const TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getAbilitiesText() {
    final abilitiesList = pokemon.abilities.map((ability) {
      return ability['ability']['name'];
    }).toList();

    return abilitiesList.join(', ');
  }
}

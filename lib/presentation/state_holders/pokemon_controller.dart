import 'package:bringin_assesment/data/models/network_response.dart';
import 'package:bringin_assesment/data/models/pokemon_models.dart';
import 'package:bringin_assesment/data/services/network_caller.dart';
import 'package:bringin_assesment/data/utils/urls.dart';
import 'package:get/get.dart';

class PokemonController extends GetxController {
  bool isLoading = false;
  List<Pokemon> pokemonList = [];
  String errorMessage = '';
  Future<void> getPokemon(String name) async {
    isLoading = true;
    errorMessage = '';
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.pokemonUrl(name));
    isLoading = false;
    update();
    if (response.isSuccess) {
      pokemonList.clear();
      pokemonList.add(Pokemon.fromJson(response.responseJson));
    } else {
      errorMessage =
          'Pokemon data fetch failed! Please check the name and try again.';
    }
    update();
  }
}

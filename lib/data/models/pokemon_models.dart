class Pokemon {
  final int id;
  final String name;
  final String type;
  final List abilities;
  final String image;

  const Pokemon(
      {required this.id,
      required this.name,
      required this.type,
      required this.abilities,
      required this.image});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      type: json['types'][0]['type']['name'],
      abilities: json['abilities'],
      image: json['sprites']['other']['dream_world']['front_default'],
    );
  }
}

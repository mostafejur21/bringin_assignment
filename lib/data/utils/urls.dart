class Urls{
  Urls._();
  static String usersUrl = "https://jsonplaceholder.typicode.com/users";
  static String postUrl = "https://jsonplaceholder.typicode.com/posts";
  static String commentsUrl = "https://jsonplaceholder.typicode.com/comments";
  static String pokemonUrl(String name) => "https://pokeapi.co/api/v2/pokemon/$name";
}
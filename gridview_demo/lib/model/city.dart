class City {
  final String name;

  final String image;

  final String population;

  final String country;

  City({this.name, this.image, this.population, this.country});

  static List<City> allCities() {
    var cities = List<City>();

    cities.add(City(
      name: "Delhi",
      country: "India",
      population: "19 mill",
      image: "delhi.png",
    ));
    cities.add(City(
      name: "London",
      country: "Britain",
      population: "8 mill",
      image: "london.png",
    ));
    cities.add(City(
      name: "Vancouver",
      country: "Canada",
      population: "2.4 mill",
      image: "vancouver.png",
    ));
    cities.add(City(
      name: "New York",
      country: "USA",
      population: "8.1 mill",
      image: "newyork.png",
    ));
    cities.add(City(
      name: "Paris",
      country: "France",
      population: "2.2 mill",
      image: "paris.png",
    ));
    cities.add(City(
      name: "Berlin",
      country: "Germany",
      population: "3.7 mill",
      image: "berlin.png",
    ));
    return cities;
  }
}
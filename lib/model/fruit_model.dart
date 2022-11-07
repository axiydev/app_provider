enum FruitType { sitrus, hol, quruq }

class Fruit {
  String? name;
  FruitType? type;
  bool? isFavourite;
  String? imageUrl;
  Fruit({this.name, this.type, this.isFavourite, this.imageUrl});

  Fruit copyWith(
          {String? name,
          FruitType? type,
          bool? isFavourite,
          String? imageUrl}) =>
      Fruit(
          name: name ?? this.name,
          type: type ?? this.type,
          isFavourite: isFavourite ?? this.isFavourite,
          imageUrl: imageUrl ?? this.imageUrl);
}

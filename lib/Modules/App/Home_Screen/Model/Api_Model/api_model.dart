class FakeStoreData {
  int id;
  String title;
  dynamic price;
  String description;
  String category;
  String image;
  Map rating;

  FakeStoreData({
    required this.id,
    required this.category,
    required this.price,
    required this.image,
    required this.title,
    required this.description,
    required this.rating,
  });

  factory FakeStoreData.fromAPI({required Map map_data}) {
    return FakeStoreData(
      id: map_data['id'],
      category: map_data['category'],
      price: map_data['price'],
      image: map_data['image'],
      title: map_data['title'],
      description: map_data['description'],
      rating: map_data['rating'],
    );
  }
}

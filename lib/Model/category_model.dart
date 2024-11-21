class CategoryModel {
  final String image, name;

  CategoryModel({required this.image, required this.name});
}

List<CategoryModel> myCategories = [
  CategoryModel(
    image: 'assets/ramen/fullset_ramen.png',
    name: 'Ramen',
  ),
  CategoryModel(
    image: 'assets/burger/cheese-burger.png',
    name: 'Burger',
  ),
  CategoryModel(
    image: 'assets/salad.png',
    name: 'Salad',
  ),
  CategoryModel(
    image: 'assets/berry-bonanza-waffle.png',
    name: 'Waffle',
  ),
];

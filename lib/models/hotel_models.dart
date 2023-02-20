class RestaurantModel {
  final String img, title;
  int id;

  RestaurantModel({required this.title, required this.id, required this.img});
}



List<RestaurantModel> restaurantsData=[

  RestaurantModel(title: "Restaurant 1", id: 1, img: "assets/images/Restaurant1.jpg"),
  RestaurantModel(title: "Restaurant 2", id: 2, img: "assets/images/Restaurant2.jpg"),
  RestaurantModel(title: "Restaurant 3", id: 3, img: "assets/images/Restaurant3.jpg"),
  RestaurantModel(title: "Restaurant 4", id: 4, img: "assets/images/Restaurant4.jpg"),


];
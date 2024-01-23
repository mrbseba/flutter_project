// class for the model - that are importen in the main & second page
class Product {
  final String name;
  final String category;
  final String price;
  final String imagePath;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.imagePath,
  });
}


class Review {
  final String name;
  final String date;
  final String text;
  final int rating;

  Review({required this.name, required this.date, required this.text, required this.rating});
}

// Example list of reviews (populate with actual data)
List<Review> reviews = [
  Review(name: "Ronald Richards", date: "13 Sep, 2020", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...", rating: 4),

];


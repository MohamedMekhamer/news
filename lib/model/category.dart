class Category {
  String id;
  String title;
  String imagePath;
  int color;
  Category(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.color});
  static List<Category> getCategory() {
    return [
      Category(
          id: 'sports',
          title: 'Sports',
          imagePath: 'assets/images/ball.png',
          color: 0xffC91C22),
      Category(
          id: 'business',
          title: 'Business',
          imagePath: 'assets/images/bussines.png',
          color: 0xffCF7E48),
      Category(
          id: 'entertainment',
          title: 'Entertainment',
          imagePath: 'assets/images/entertainment.png',
          color: 0xff003e90),
      Category(
          id: 'health',
          title: 'Health',
          imagePath: 'assets/images/health.png',
          color: 0xffED1E79),
      Category(
          id: 'science',
          title: 'Science',
          imagePath: 'assets/images/science.png',
          color: 0xffF2D352),
      Category(
          id: 'technology',
          title: 'technology',
          imagePath: 'assets/images/technology.png',
          color: 0xff003E90),
      Category(
          id: 'general',
          title: 'General',
          imagePath: 'assets/images/genral.png',
          color: 0xff4F5A69),
    ];
  }
}

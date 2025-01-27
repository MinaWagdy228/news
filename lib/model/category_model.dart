class CategoryModel {
  String id;
  String title;
  String imgPath;
  CategoryModel({
    required this.title,
    required this.id,
    required this.imgPath,
  });

  static List<CategoryModel> getCategoriesList(bool isDark) {
    return [
      CategoryModel(
          title: 'General',
          id: 'general',
          imgPath: isDark
              ? 'assets/Images/generalLight.png'
              : 'assets/Images/generalDark.png'),
      CategoryModel(
          title: 'Business',
          id: 'business',
          imgPath: isDark
              ? 'assets/Images/businessLight.png'
              : 'assets/Images/businessDark.png'),
      CategoryModel(
          title: 'Sports',
          id: 'sports',
          imgPath: isDark
              ? 'assets/Images/sportsLight.png'
              : 'assets/Images/sportDark.png'),
      CategoryModel(
          title: 'Technology',
          id: 'technology',
          imgPath: isDark
              ? 'assets/Images/technologyLight.png'
              : 'assets/Images/technologyDark.png'),
      CategoryModel(
          title: 'Entertainment',
          id: 'entertainment',
          imgPath: isDark
              ? 'assets/Images/entertaimentLight.png'
              : 'assets/Images/entertaimentDark.png'),
      CategoryModel(
          title: 'Health',
          id: 'health',
          imgPath: isDark
              ? 'assets/Images/healthLight.png'
              : 'assets/Images/healthDark.png'),
      CategoryModel(
          title: 'Science',
          id: 'science',
          imgPath: isDark
              ? 'assets/Images/scienceLight.png'
              : 'assets/Images/scienceDark.png'),
    ];
  }
}

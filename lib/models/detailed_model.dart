class Individual {
  String strMeal;
  String strMealThumb;
  String idMeal;
  Individual(
      {required this.idMeal,
      required this.strMeal,
      required this.strMealThumb});

  factory Individual.fromJson(Map<String, dynamic> json) {
    return Individual(
        idMeal: json['idMeal'],
        strMeal: json['strMeal'],
        strMealThumb: json['strMealThumb']
    );
  }
}

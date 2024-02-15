class Type {
  String idCategory;
  String strCategory;
  String strCategoryThumb;
  String strCategoryDescription;
  Type(
      {required this.idCategory,
      required this.strCategory,
      required this.strCategoryDescription,
      required this.strCategoryThumb});

  factory Type.fromJson(Map<String,dynamic> json) {
    return Type(
        idCategory: json["idCategory"],
        strCategory: json["strCategory"],
        strCategoryDescription: json["strCategoryDescription"],
        strCategoryThumb: json["strCategoryThumb"]
    );
  }
}

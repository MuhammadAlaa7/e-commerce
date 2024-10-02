class ProductAttributeModel {
  final String name;
  final List<String> values;

  ProductAttributeModel({required this.name,required  this.values});

  static empty() => ProductAttributeModel(name: '', values: []);
  /// Json Format
  Map<String, dynamic > toJson() {
    return {'name': name, 'values': values};
  }


  /// Map Json oriented document snapshot from Firebase to Model
  factory ProductAttributeModel.fromJson(Map<String, dynamic> json) {

    if ( json.isEmpty) return ProductAttributeModel.empty();

    return ProductAttributeModel(
      name: json['name'] ?? '',
      values: List<String>.from(json['values'] ?? []),
    );
  }
}

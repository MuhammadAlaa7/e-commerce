import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
   String id;
   String name;
   String image;
   bool isFeatured;
   // if the parent category is null or empty it means that the category is a super category not a sub category
   String parentId;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
  });

  // empty category model
  static CategoryModel empty() =>
      CategoryModel(id: '', name: '', image: '', isFeatured: false);

// convert model to json structure so that you can store data in the firebase database

// convert model to json

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'isFeatured': isFeatured,
        'parentId': parentId,
      };

// Map json oriented document snapshot from firebase to model
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null ) {
        

        final data = document.data()!; 

        return CategoryModel(
          id: document.id,
          name: data['name'] ,
          image: data['image'] ,
          isFeatured: data['isFeatured'] ,
          parentId: data['parentId'] ,
        );

      } else {
          return CategoryModel.empty();

      }
      

  }
}

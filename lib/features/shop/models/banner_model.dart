import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  final String imageUrl;
  final String targetScreen;
  final bool active;

  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });


// empty model
  static BannerModel empty() {
    return BannerModel(
      imageUrl: '',
      targetScreen: '',
      active: false,
    );
  }


// to json method
  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'targetScreen': targetScreen,
      'active': active,
    };
  }

// from snapshot
  factory BannerModel.fromJson(
      DocumentSnapshot<Map<String, dynamic>> jsonDocument) {
    // if the data exists
   if (jsonDocument.data() != null) {
      final data = jsonDocument.data()!;

         

    return BannerModel(
      imageUrl: data['imageUrl'] , 
      targetScreen: data['targetScreen'],
      active: data['active'] ,
    );
  }
  else 
  {
    return BannerModel.empty();}
      }


}

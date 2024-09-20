import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store/core/utils/formatter/formatter.dart';

class AddressModel {
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final DateTime? date;
  bool isSelected;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.date,
    this.isSelected =
        true, // default is true , because the new address is selected by default
  });

// get formatted phone number
  String get getFormattedPhoneNumber =>
      AppFormatter.formatPhoneNumber(phoneNumber);

  // empty address
  static AddressModel empty() => AddressModel(
        id: '',
        name: '',
        phoneNumber: '',
        street: '',
        city: '',
        state: '',
        postalCode: '',
        country: '',
        isSelected: false,
      );

  // to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phoneNumber': phoneNumber,
        'street': street,
        'city': city,
        'state': state,
        'postalCode': postalCode,
        'country': country,
        'date': DateTime.now(),
        'isSelected': isSelected,
      };

// from json
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      street: json['street'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postalCode'],
      country: json['country'],
      date: (json['date'] as Timestamp).toDate(),
      isSelected: json['isSelected'],
    );
  }

// from document snapshot  [ - firebase - ]
  factory AddressModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return AddressModel(
      id: snapshot.id,
      name: data['name'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      street: data['street'] ?? '',
      city: data['city'] ?? '',
      state: data['state'] ?? '',
      postalCode: data['postalCode'] ?? '',
      country: data['country'] ?? '',
      date: (data['date'] as Timestamp).toDate(),
      isSelected: data['isSelected'] ?? true,
    );
  }

  @override
  String toString() {
    return '$street street - $city - $state - $country - postal code : $postalCode';
  }
}

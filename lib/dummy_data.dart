import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store/features/personalization/models/address_model.dart';
import 'package:store/features/personalization/models/user_model.dart';
import 'package:store/features/shop/models/brand_model.dart';
import 'package:store/features/shop/models/cart_item_model.dart';
import 'package:store/features/shop/models/cart_model.dart';
import 'package:store/features/shop/models/category_model.dart';
import 'package:store/routes/app_routes.dart';
import 'package:store/routes/routes.dart';
import 'package:store/utils/constants/image_strings.dart';

import 'features/shop/models/banner_model.dart';

class DummyData {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   static Future<void>
//  uploadDummyData() async {
//     // Sample dummy data
//     final productsData = [
//       {
//         'Id': '1',
//         'IsFeatured': true,
//         'Name': 'Nike',
//         'ProductsCount': 265,
//         'CategoryId': '',
//         'Description': 'Green Nike sports shoe',
//         'Images': [
//                       'https://firebasestorage.googleapis.com/v0/b/ecommerce-d7adf.appspot.com/o/images%2FNikeAirJOrdonWhiteRed.png?alt=media&token=123092ce-71ba-4d19-8696-391a23026a83',
//                       'https://firebasestorage.googleapis.com/v0/b/ecommerce-d7adf.appspot.com/o/images%2Fnike-shoes.png?alt=media&token=35e6141d-d410-4eb5-a6bc-ce9fae757748',
//                       'https://firebasestorage.googleapis.com/v0/b/ecommerce-d7adf.appspot.com/o/images%2Fproduct-jacket.png?alt=media&token=294480b4-ba85-4dc2-8e66-38d03759f547',

//           ],
//         'Price': 135,
//         'ProductAttributes': [
//           {
//             'Name': 'Color',
//             'Values': ['Green', 'Black', 'Red'],
//           },
//           {
//             'Name': 'Size',
//             'Values': ['EU 39'],
//           },
//         ],
//       },
//       // ... more products
//     ];

//     // Create a batch to improve performance
//     final batch = FirebaseFirestore.instance.batch();

//     for (final productData in productsData) {
//       final productRef = _firestore.collection('Products').doc();
//       batch.set(productRef, productData);
//     }

//     await batch.commit();
//   }

  // Banners ---

  static final List<BannerModel> banners = [
    BannerModel(
      imageUrl: CImages.banner1,
      targetScreen: Routes.store,
      active: false,
    ),
    BannerModel(
      imageUrl: CImages.banner2,
      targetScreen: Routes.cart,
      active: true,
    ),
    BannerModel(
      imageUrl: CImages.banner3,
      targetScreen: Routes.settings,
      active: true,
    ),
    BannerModel(
      imageUrl: CImages.banner4,
      targetScreen: Routes.userProfile,
      active: true,
    ),
    BannerModel(
      imageUrl: CImages.banner5,
      targetScreen: Routes.forgetPassword,
      active: true,
    ),
  ];

// single user --

  static final UserModel user = UserModel(
    id: '1',
    firstName: 'Coding',
    lastName: 'with T',
    username: 'tprogramming',
    email: 'support@codingwitht.com',
    phoneNumber: '+14155552671',
    profilePicture: CImages.userProfile,
    addresses: [
      AddressModel(
        id: '1',
        name: 'Coding with T',
        phoneNumber: '+923178095928',
        street: '82356 Timmy Coves',
        city: 'South Liana',
        state: 'Maine',
        postalCode: '87665',
        country: 'USA',
      ),
      AddressModel(
        id: '6',
        name: 'John Doe',
        phoneNumber: '+923165496531',
        street: '1234 John Street',
        city: 'Sample City',
        state: 'Sample State',
        postalCode: '12345',
        country: 'USA',
      ),
    ],
  );

// // Cart ---
//   static final CartModel cart = CartModel(
//     id: '001',
//     items: [
//       CartItemModel(
//         productId: '001',
//         variationId: '1',
//         quantity: 1,
//         title: products[0].title,
//         image: products[0].thumbnail,
//         brandName: products[0].brand!.name,
//         price: products[0].productVariations![0].price,
//         selectedVariation: products[0].productVariations![0].attributeValues,
//       ),
//       CartItemModel(
//         productId: '002',
//         variationId: '',
//         quantity: 1,
//         title: products[1].title,
//         image: products[1].thumbnail,
//         brandName: products[1].brand!.name,
//         price: products[1].productVariations![0].price,
//         selectedVariation: products[1].productVariations![0].attributeValues,
//       ),
//     ],
//   );

  // orders ---

  // static final List<OrderModel> orders = [
  //   OrderModel(
  //       id: 'CW0001',
  //       userId: userId,
  //       status: status,
  //       date: date,
  //       total: total,
  //       items: items),
  //   OrderModel(
  //       id: 'CW0001',
  //       userId: userId,
  //       status: status,
  //       date: date,
  //       total: total,
  //       items: items),
  // ];

  /// List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      image: CImages.sportIcon,
      name: 'Sports',
      isFeatured: true,
    ),
    CategoryModel(
        id: '5',
        image: CImages.furnitureIcon,
        name: 'Furniture',
        isFeatured: true),
    CategoryModel(
        id: '2',
        image: CImages.electronicsIcon,
        name: 'Electronics',
        isFeatured: true),
    CategoryModel(
      id: '3',
      image: CImages.clothIcon,
      name: 'Clothes',
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      image: CImages.animalIcon,
      name: 'Animals',
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      image: CImages.shoesIcon,
      name: 'Shoes',
      isFeatured: true,
    ),
    CategoryModel(
        id: '7',
        image: CImages.cosmeticsIcon,
        name: 'Cosmetics',
        isFeatured: true),
    CategoryModel(
        id: '14',
        image: CImages.jewelryIcon,
        name: 'Jewelry',
        isFeatured: true),
  ];

// list of all sub categories ---

  static final List<CategoryModel> subCategories = [
    ///subcategories
    CategoryModel(
        id: '8',
        image: CImages.sportIcon,
        name: 'Sport Shoes',
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '9',
        image: CImages.sportIcon,
        name: 'Track suits',
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '10',
        image: CImages.sportIcon,
        name: 'Sports Equipments',
        parentId: '1',
        isFeatured: false),

    //furniture
    CategoryModel(
        id: '11',
        image: CImages.furnitureIcon,
        name: 'Bedroom furniture',
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '12',
        image: CImages.furnitureIcon,
        name: 'Kitchen furniture',
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '13',
        image: CImages.furnitureIcon,
        name: 'Office furniture',
        parentId: '5',
        isFeatured: false),

    //electronics
    CategoryModel(
        id: '14',
        image: CImages.electronicsIcon,
        name: 'Laptop',
        parentId: '2',
        isFeatured: false),
    CategoryModel(
        id: '15',
        image: CImages.electronicsIcon,
        name: 'Mobile',
        parentId: '2',
        isFeatured: false),
  ];




// --------------- all brands --------------
static final List<BrandModel> brands = [
    BrandModel(
        id: '1',
        image: CImages.nikeLogo,
        name: 'Nike',
        productsCount: 265,
        isFeatured: true),
    BrandModel(
        id: '2',
        image: CImages.adidasLogo,
        name: 'Adidas',
        productsCount: 95,
        isFeatured: true),
    BrandModel(
        id: '8',
        image: CImages.kenwoodLogo,
        name: 'Kenwood',
        productsCount: 36,
        isFeatured: false),
    BrandModel(
        id: '9',
        image: CImages.ikeaLogo,
        name: 'IKEA',
        productsCount: 36,
        isFeatured: false),
    BrandModel(
        id: '5',
        image: CImages.appleLogo,
        name: 'Apple',
        productsCount: 16,
        isFeatured: true),
    BrandModel(
        id: '10',
        image: CImages.acerLogo,
        name: 'Acer',
        productsCount: 36,
        isFeatured: false),
    BrandModel(
        id: '3',
        image: CImages.jordanLogo,
        name: 'Jordan',
        productsCount: 36,
        isFeatured: true),
    BrandModel(
        id: '4',
        image: CImages.pumaLogo,
        name: 'Puma',
        productsCount: 65,
        isFeatured: true),
    BrandModel(
        id: '6',
        image: CImages.zaraLogo,
        name: 'ZARA',
        productsCount: 36,
        isFeatured: true),
    BrandModel(
        id: '7',
        image: CImages.electronicsIcon,
        name: 'Samsung',
        productsCount: 36,
        isFeatured: false),
  ];




}

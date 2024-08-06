import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store/features/personalization/models/address_model.dart';
import 'package:store/features/personalization/models/user_model.dart';
import 'package:store/features/shop/models/brand_model.dart';
import 'package:store/features/shop/models/cart_item_model.dart';
import 'package:store/features/shop/models/cart_model.dart';
import 'package:store/features/shop/models/category_model.dart';
import 'package:store/features/shop/models/product_attributes_model.dart';
import 'package:store/features/shop/models/product_category_model.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/routes/app_routes.dart';
import 'package:store/routes/routes.dart';
import 'package:store/utils/constants/image_strings.dart';

import 'features/shop/models/banner_model.dart';
import 'features/shop/models/brand_category_model.dart';
import 'features/shop/models/product_variation_model.dart';

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
    profilePicture: CImages.userProfileImage1,
    //   addresses: [
    //     AddressModel(
    //       id: '1',
    //       name: 'Coding with T',
    //       phoneNumber: '+923178095928',
    //       street: '82356 Timmy Coves',
    //       city: 'South Liana',
    //       state: 'Maine',
    //       postalCode: '87665',
    //       country: 'USA',
    //     ),
    //     AddressModel(
    //       id: '6',
    //       name: 'John Doe',
    //       phoneNumber: '+923165496531',
    //       street: '1234 John Street',
    //       city: 'Sample City',
    //       state: 'Sample State',
    //       postalCode: '12345',
    //       country: 'USA',
    //     ),
    //   ],
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
      image: CImages.shoeIcon,
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
        image: CImages.jeweleryIcon,
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

// ------------ all brand category ------------
  static List<BrandCategoryModel> brandCategory = [
    BrandCategoryModel(brandId: '1', categoryId: '1'),
    BrandCategoryModel(brandId: '1', categoryId: '8'),
    BrandCategoryModel(brandId: '1', categoryId: '9'),
    BrandCategoryModel(brandId: '1', categoryId: '10'),
    BrandCategoryModel(brandId: '2', categoryId: '1'),
    BrandCategoryModel(brandId: '2', categoryId: '8'),
    BrandCategoryModel(brandId: '2', categoryId: '9'),
    BrandCategoryModel(brandId: '2', categoryId: '10'),
    BrandCategoryModel(brandId: '3', categoryId: '1'),
    BrandCategoryModel(brandId: '3', categoryId: '8'),
    BrandCategoryModel(brandId: '3', categoryId: '9'),
    BrandCategoryModel(brandId: '3', categoryId: '10'),
    BrandCategoryModel(brandId: '4', categoryId: '1'),
    BrandCategoryModel(brandId: '4', categoryId: '8'),
    BrandCategoryModel(brandId: '4', categoryId: '9'),
    BrandCategoryModel(brandId: '4', categoryId: '10'),
    BrandCategoryModel(brandId: '5', categoryId: '15'),
    BrandCategoryModel(brandId: '5', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '14'),
    BrandCategoryModel(brandId: '6', categoryId: '3'),
    BrandCategoryModel(brandId: '6', categoryId: '16'),
    BrandCategoryModel(brandId: '7', categoryId: '2'),
    BrandCategoryModel(brandId: '8', categoryId: '5'),
    BrandCategoryModel(brandId: '8', categoryId: '11'),
    BrandCategoryModel(brandId: '8', categoryId: '12'),
    BrandCategoryModel(brandId: '8', categoryId: '13'),
    BrandCategoryModel(brandId: '9', categoryId: '5'),
    BrandCategoryModel(brandId: '9', categoryId: '11'),
    BrandCategoryModel(brandId: '9', categoryId: '12'),
    BrandCategoryModel(brandId: '9', categoryId: '13'),
  ];

// ------------------- list of products categories relationship -------------------
  static List<ProductCategoryModel> productCategories = [
    ProductCategoryModel(productId: '001', categoryId: '1'),
    ProductCategoryModel(productId: '001', categoryId: '8'),
    ProductCategoryModel(productId: '004', categoryId: '3'),
    ProductCategoryModel(productId: '002', categoryId: '3'),
    ProductCategoryModel(productId: '002', categoryId: '16'),
    ProductCategoryModel(productId: '003', categoryId: '3'),
    ProductCategoryModel(productId: '005', categoryId: '1'),
    ProductCategoryModel(productId: '005', categoryId: '8'),
    ProductCategoryModel(productId: '040', categoryId: '2'),
    ProductCategoryModel(productId: '040', categoryId: '15'),
    ProductCategoryModel(productId: '006', categoryId: '2'),
    ProductCategoryModel(productId: '007', categoryId: '4'),
    ProductCategoryModel(productId: '009', categoryId: '1'),
    ProductCategoryModel(productId: '009', categoryId: '8'),
    ProductCategoryModel(productId: '010', categoryId: '1'),
    ProductCategoryModel(productId: '010', categoryId: '8'),
    ProductCategoryModel(productId: '011', categoryId: '1'),
    ProductCategoryModel(productId: '011', categoryId: '8'),
    ProductCategoryModel(productId: '012', categoryId: '1'),
    ProductCategoryModel(productId: '012', categoryId: '8'),
    ProductCategoryModel(productId: '013', categoryId: '1'),
    ProductCategoryModel(productId: '013', categoryId: '8'),
    ProductCategoryModel(productId: '014', categoryId: '1'),
    ProductCategoryModel(productId: '014', categoryId: '9'),
    ProductCategoryModel(productId: '015', categoryId: '1'),
    ProductCategoryModel(productId: '015', categoryId: '9'),
    ProductCategoryModel(productId: '016', categoryId: '1'),
    ProductCategoryModel(productId: '016', categoryId: '9'),
    ProductCategoryModel(productId: '017', categoryId: '1'),
    ProductCategoryModel(productId: '017', categoryId: '9'),
    ProductCategoryModel(productId: '018', categoryId: '1'),
    ProductCategoryModel(productId: '018', categoryId: '10'),
    ProductCategoryModel(productId: '019', categoryId: '1'),
    ProductCategoryModel(productId: '019', categoryId: '10'),
    ProductCategoryModel(productId: '020', categoryId: '1'),
    ProductCategoryModel(productId: '020', categoryId: '10'),
    ProductCategoryModel(productId: '021', categoryId: '1'),
    ProductCategoryModel(productId: '021', categoryId: '10'),
    ProductCategoryModel(productId: '022', categoryId: '5'),
    ProductCategoryModel(productId: '022', categoryId: '11'),
    ProductCategoryModel(productId: '023', categoryId: '5'),
    ProductCategoryModel(productId: '023', categoryId: '11'),
    ProductCategoryModel(productId: '024', categoryId: '5'),
    ProductCategoryModel(productId: '024', categoryId: '11'),
    ProductCategoryModel(productId: '025', categoryId: '5'),
    ProductCategoryModel(productId: '025', categoryId: '11'),
    ProductCategoryModel(productId: '026', categoryId: '5'),
    ProductCategoryModel(productId: '026', categoryId: '12'),
    ProductCategoryModel(productId: '027', categoryId: '5'),
    ProductCategoryModel(productId: '027', categoryId: '12'),
    ProductCategoryModel(productId: '028', categoryId: '5'),
    ProductCategoryModel(productId: '028', categoryId: '12'),
    ProductCategoryModel(productId: '029', categoryId: '5'),
    ProductCategoryModel(productId: '029', categoryId: '13'),
    ProductCategoryModel(productId: '030', categoryId: '5'),
    ProductCategoryModel(productId: '030', categoryId: '13'),
    ProductCategoryModel(productId: '031', categoryId: '5'),
    ProductCategoryModel(productId: '031', categoryId: '13'),
    ProductCategoryModel(productId: '032', categoryId: '5'),
    ProductCategoryModel(productId: '032', categoryId: '13'),
    ProductCategoryModel(productId: '033', categoryId: '2'),
    ProductCategoryModel(productId: '033', categoryId: '14'),
    ProductCategoryModel(productId: '034', categoryId: '2'),
    ProductCategoryModel(productId: '034', categoryId: '14'),
    ProductCategoryModel(productId: '035', categoryId: '2'),
    ProductCategoryModel(productId: '035', categoryId: '14'),
    ProductCategoryModel(productId: '036', categoryId: '2'),
    ProductCategoryModel(productId: '036', categoryId: '14'),
    ProductCategoryModel(productId: '037', categoryId: '2'),
    ProductCategoryModel(productId: '037', categoryId: '15'),
    ProductCategoryModel(productId: '038', categoryId: '2'),
    ProductCategoryModel(productId: '038', categoryId: '15'),
    ProductCategoryModel(productId: '039', categoryId: '2'),
    ProductCategoryModel(productId: '039', categoryId: '15'),
  ];

// --- list of All Products in the store ------

  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'Green Nike sports shoe',
      stock: 15,
      price: 135,
      salePrice: 30,
      thumbnail: CImages.productImage1,
      productType: 'shoes',
      sku: 'ABR4568',
      categoryId: '1',
      isFeatured: true,
      description: 'Green Nike sports shoe',
      brand: BrandModel(
        id: '1',
        image: CImages.nikeLogo,
        name: 'Nike',
        productsCount: 265,
        isFeatured: true,
      ),
      images: [
        CImages.productImage1,
        CImages.productImage23,
        CImages.productImage21,
        CImages.productImage9,
      ],
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Green', 'Black', 'Red'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['EU 30', 'EU 32', 'EU 34'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: CImages.productImage1,
          description:
              'This is a product description for Green Nike sports shoe.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 132,
          salePrice: 120,
          image: CImages.productImage23,
          description:
              'This is a product description for Black Nike sports shoe.',
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: CImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 222,
          price: 232,
          salePrice: 120,
          image: CImages.productImage1,
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 334,
          image: CImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 332,
          image: CImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
        ),
      ],
    ),
    ProductModel(
      id: '002',
      title: 'Blue T-shirt for all ages',
      stock: 15,
      price: 35,
      isFeatured: true,
      thumbnail: CImages.productImage69,
      description:
          'This is a Product description for Blue Nike Sleeve Less vest. There are more things that can be added but i am just practicing and nothing else..',
      brand: BrandModel(id: '6', image: CImages.zaraLogo, name: 'ZARA'),
      images: [
        CImages.productImage68,
        CImages.productImage69,
        CImages.productImage5
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
     productType:  'shirt',
    ),
    ProductModel(
      id: '003',
      title: 'Leather brown Jacket',
      stock: 15,
      price: 38000,
      isFeatured: false,
      thumbnail: CImages.productImage64,
      description:
          'This is a Product description for Leather brown Jacket. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '6', image: CImages.zaraLogo, name: 'ZARA'),
      images: [
        CImages.productImage64,
        CImages.productImage65,
        CImages.productImage66,
        CImages.productImage67
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'size', values: ['EU 34', 'EU 32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
    productType: 'Jacket',
    ),
    ProductModel(
      id: '004',
      title: '4 Color collar t-shirt dry fit',
      stock: 15,
      price: 135,
      isFeatured: false,
      thumbnail: CImages.productImage60,
      description:
          'This is a Product description for 4 Color collar t-shirt dry fit. There are more things that can be added but its just a demo and nothing else.',
      brand: BrandModel(id: '6', image: CImages.zaraLogo, name: 'ZARA'),
      images: [
        CImages.productImage60,
        CImages.productImage61,
        CImages.productImage62,
        CImages.productImage63
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(
            name: 'size', values: ['EU 30', 'EU 32', 'EU 34']),
        ProductAttributeModel(
            name: 'Color', values: ['Red', 'Yellow', 'Green', 'Blue']),
      ],
      productType: 'shirt',
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          image: CImages.productImage60,
          attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
          description:
              'This is a product description for 4 color collar t-shirt dry fit',
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 132,
          image: CImages.productImage60,
          attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: CImages.productImage61,
          attributeValues: {'Color': 'Yellow', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 222,
          price: 232,
          image: CImages.productImage61,
          attributeValues: {'Color': 'Yellow', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 334,
          image: CImages.productImage62,
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 332,
          image: CImages.productImage62,
          attributeValues: {'Color': 'Green', 'Size': 'EU 30'},
        ),
        ProductVariationModel(
          id: '7',
          stock: 0,
          price: 334,
          image: CImages.productImage63,
          attributeValues: {'Color': 'Blue', 'Size': 'EU 30'},
        ),
        ProductVariationModel(
          id: '8',
          stock: 11,
          price: 332,
          image: CImages.productImage63,
          attributeValues: {'Color': 'Blue', 'Size': 'EU 34'},
        ),
      ],
    ),
 
 ProductModel(
  id: '005',
  title: 'Nike Air Jordan Shoes',
  stock: 15,
  price: 35,
  isFeatured: false,
  thumbnail: CImages.productImage10,
  description: 'Nike Air Jordan Shoes for running. Quality product, Long Lasting',
  brand: BrandModel(id: '1', image: CImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
  images: [CImages.productImage7, CImages.productImage8, CImages.productImage9, CImages.productImage10],
  salePrice: 50,
  sku: 'ABR4568',
  categoryId: '8',
  productType: 'shoes',
  productAttributes: [
    ProductAttributeModel(name: 'Color', values: ['Orange', 'Black', 'Brown']),
    ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
  ],
  productVariations: [
    ProductVariationModel(
      id: '1',
      stock: 16,
      price: 36,
      salePrice: 12,
      image: CImages.productImage5,
      attributeValues: {'Color': 'Orange', 'Size': 'EU 34'},
    ),
    ProductVariationModel(
      id: '2',
      stock: 15,
      price: 35,
      image: CImages.productImage7,
      attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
    ),
    ProductVariationModel(
      id: '3',
      stock: 14,
      price: 34,
      image: CImages.productImage8,
      attributeValues: {'Color': 'Brown', 'Size': 'EU 34'},
    ),
    ProductVariationModel(
      id: '4',
      stock: 15,
      price: 35,
      image: CImages.productImage7,
      attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
    ),
    ProductVariationModel(
      id: '5',
      stock: 12,
      price: 32,
      image: CImages.productImage5,
      attributeValues: {'Color': 'Brown', 'Size': 'EU 32'},
    ),
     ProductVariationModel(
          id: '6',
          stock: 11,
          price: 31,
          image: CImages.productImage8,
          attributeValues: {'Color': 'Orange', 'Size': 'EU 32'},
        ),
  ],
),
ProductModel(
      id: '006',
      title: 'SAMSUNG Galaxy S9 (Pink, 64 GB) (4 GB RAM)',
      stock: 15,
      price: 750,
      isFeatured: false,
      thumbnail: CImages.productImage11,
      description:
          'SAMSUNG Galaxy S9 (Pink, 64 GB) (4 GB RAM), Long Battery timing',
      brand: BrandModel(id: '7', image: CImages.appleLogo, name: 'Samsung'),
      images: [
        CImages.productImage11,
        CImages.productImage12,
        CImages.productImage13,
        CImages.productImage12
      ],
      salePrice: 650,
      sku: 'ABR45681',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'mobile',
    ),
    ProductModel(
      id: '007',
      title: 'TOMI Dog food',
      stock: 15,
      price: 20,
      isFeatured: false,
      thumbnail: CImages.productImage18,
      description:
          'This is a Product description for TOMI Dog food. There are more things that can be added but i as just practicing and nothing else..',
      brand: BrandModel(id: '7', image: CImages.appleLogo, name: 'Toni'),
      salePrice: 10,
      sku: 'ABR4568',
      categoryId: '4',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
     productType: 'food',
    ),

    ProductModel(
      id: '009',
      title: 'Nike Air Jordan 19 Blue',
      stock: 15,
      price: 468,
      isFeatured: false,
      thumbnail: CImages.productImage19,
      description:
          'This is a Product description for Nike Air Jordon. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '1', image: CImages.nikeLogo, name: 'Nike'),
      images: [
        CImages.productImage19,
        CImages.productImage20,
        CImages.productImage21,
        CImages.productImage22
      ],
      salePrice: 200,
      productType: 'shoe',
      sku: 'ABR4568',
      categoryId: '3',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      
    ),


 
  ];
}

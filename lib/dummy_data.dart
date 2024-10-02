import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store/features/personalization/models/user_model.dart';
import 'package:store/features/shop/models/brand_model.dart';
import 'package:store/features/shop/models/category_model.dart';
import 'package:store/features/shop/models/product_category_model.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/core/routes/routes.dart';
import 'package:store/core/utils/constants/enums.dart';
import 'package:store/core/utils/constants/image_strings.dart';

import 'features/shop/models/banner_model.dart';
import 'features/shop/models/brand_category_model.dart';

class DummyData {
  // Banners ---

  static final List<BannerModel> banners = [
    BannerModel(
      imageUrl: AppImages.banner1,
      targetScreen: Routes.store,
      active: true,
    ),
    BannerModel(
      imageUrl: AppImages.banner2,
      targetScreen: Routes.cart,
      active: true,
    ),
    // BannerModel(
    //   imageUrl: CImages.banner3,
    //   targetScreen: Routes.settings,
    //   active: true,
    // ),
    // BannerModel(
    //   imageUrl: CImages.banner4,
    //   targetScreen: Routes.userProfile,
    //   active: true,
    // ),
    // BannerModel(
    //   imageUrl: CImages.banner5,
    //   targetScreen: Routes.allProducts,
    //   active: true,
    // ),
    // BannerModel(
    //   imageUrl: CImages.banner6,
    //   targetScreen: Routes.productReview,
    //   active: true,
    // ),
    // BannerModel(
    //   imageUrl: CImages.banner7,
    //   targetScreen: Routes.wishlist,
    //   active: true,
    // ),
    // BannerModel(
    //   imageUrl: CImages.banner8,
    //   targetScreen: Routes.forgetPassword,
    //   active: true,
    // ),
  ];

// single user --

  static final UserModel user = UserModel(
    id: '1',
    firstName: 'Coding',
    lastName: 'with T',
    username: 'tprogramming',
    email: 'support@codingwitht.com',
    phoneNumber: '+14155552671',
    profilePicture: AppImages.userProfileImage1,
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

  //* Cart ---
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

  //* orders ---

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

  //* all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      image: AppImages.sportIcon,
      name: 'Sports',
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      image: AppImages.electronicsIcon,
      name: 'Electronics',
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      image: AppImages.clothIcon,
      name: 'Clothes',
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      image: AppImages.animalIcon,
      name: 'Animals',
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      image: AppImages.furnitureIcon,
      name: 'Furniture',
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      image: AppImages.shoeIcon,
      name: 'Shoes',
      isFeatured: true,
    ),
    CategoryModel(
      id: '7',
      image: AppImages.cosmeticsIcon,
      name: 'Cosmetics',
      isFeatured: true,
    ),
    CategoryModel(
      id: '14',
      image: AppImages.jeweleryIcon,
      name: 'Jewelry',
      isFeatured: true,
    ),
  ];

// list of all sub categories ---

  static final List<CategoryModel> subCategories = [
    ///subcategories
    CategoryModel(
        id: '8',
        image: AppImages.sportIcon,
        name: 'Sport Shoes',
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '9',
        image: AppImages.sportIcon,
        name: 'Track suits',
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '10',
        image: AppImages.sportIcon,
        name: 'Sports Equipments',
        parentId: '1',
        isFeatured: false),

    //furniture
    CategoryModel(
        id: '11',
        image: AppImages.furnitureIcon,
        name: 'Bedroom furniture',
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '12',
        image: AppImages.furnitureIcon,
        name: 'Kitchen furniture',
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '13',
        image: AppImages.furnitureIcon,
        name: 'Office furniture',
        parentId: '5',
        isFeatured: false),

    //electronics
    CategoryModel(
        id: '14',
        image: AppImages.electronicsIcon,
        name: 'Laptop',
        parentId: '2',
        isFeatured: false),
    CategoryModel(
        id: '15',
        image: AppImages.electronicsIcon,
        name: 'Mobile',
        parentId: '2',
        isFeatured: false),
  ];

// --------------- all brands --------------
  static final List<BrandModel> brands = [
    // BrandModel(
    //     id: '1',
    //     image: CImages.nikeLogo,
    //     name: 'Nike',
    //     productsCount: 265,
    //     isFeatured: true),
    // BrandModel(
    //     id: '2',
    //     image: CImages.adidasLogo,
    //     name: 'Adidas',
    //     productsCount: 95,
    //     isFeatured: true),
    // BrandModel(
    //     id: '8',
    //     image: CImages.kenwoodLogo,
    //     name: 'Kenwood',
    //     productsCount: 36,
    //     isFeatured: false),
    // BrandModel(
    //     id: '9',
    //     image: CImages.ikeaLogo,
    //     name: 'IKEA',
    //     productsCount: 36,
    //     isFeatured: false),
    // BrandModel(
    //     id: '5',
    //     image: CImages.appleLogo,
    //     name: 'Apple',
    //     productsCount: 16,
    //     isFeatured: true),
    // BrandModel(
    //     id: '10',
    //     image: CImages.acerLogo,
    //     name: 'Acer',
    //     productsCount: 36,
    //     isFeatured: false),
    // BrandModel(
    //     id: '3',
    //     image: CImages.jordanLogo,
    //     name: 'Jordan',
    //     productsCount: 36,
    //     isFeatured: true),
    // BrandModel(
    //     id: '4',
    //     image: CImages.pumaLogo,
    //     name: 'Puma',
    //     productsCount: 65,
    //     isFeatured: true),
    // BrandModel(
    //     id: '6',
    //     image: CImages.zaraLogo,
    //     name: 'ZARA',
    //     productsCount: 36,
    //     isFeatured: true),
    // BrandModel(
    //     id: '7',
    //     image: CImages.electronicsIcon,
    //     name: 'Samsung',
    //     productsCount: 36,
    //     isFeatured: false),

    BrandModel(
      id: '11',
      image: AppImages.hermanMillerLogo,
      name: 'Herman Miller',
      productsCount: 36,
      isFeatured: true,
    ),
  ];

// ------------ all brand category ------------
  static List<BrandCategoryModel> brandCategory = [
    BrandCategoryModel(brandId: '1', categoryId: '1'),
    BrandCategoryModel(brandId: '1', categoryId: '8'),
    BrandCategoryModel(brandId: '1', categoryId: '9'),
    BrandCategoryModel(brandId: '1', categoryId: '10'),

    ///
    BrandCategoryModel(brandId: '2', categoryId: '1'),
    BrandCategoryModel(brandId: '2', categoryId: '8'),
    BrandCategoryModel(brandId: '2', categoryId: '9'),
    BrandCategoryModel(brandId: '2', categoryId: '10'),

    ///
    BrandCategoryModel(brandId: '3', categoryId: '1'),
    BrandCategoryModel(brandId: '3', categoryId: '8'),
    BrandCategoryModel(brandId: '3', categoryId: '9'),
    BrandCategoryModel(brandId: '3', categoryId: '10'),

    ///
    BrandCategoryModel(brandId: '4', categoryId: '1'),
    BrandCategoryModel(brandId: '4', categoryId: '8'),
    BrandCategoryModel(brandId: '4', categoryId: '9'),
    BrandCategoryModel(brandId: '4', categoryId: '10'),

    ///
    BrandCategoryModel(brandId: '5', categoryId: '15'),
    BrandCategoryModel(brandId: '5', categoryId: '2'),

    //
    BrandCategoryModel(brandId: '6', categoryId: '3'),
    BrandCategoryModel(brandId: '6', categoryId: '16'),
    //
    BrandCategoryModel(brandId: '7', categoryId: '2'),
    //
    BrandCategoryModel(brandId: '8', categoryId: '5'),
    BrandCategoryModel(brandId: '8', categoryId: '11'),
    BrandCategoryModel(brandId: '8', categoryId: '12'),
    BrandCategoryModel(brandId: '8', categoryId: '13'),
    //
    BrandCategoryModel(brandId: '9', categoryId: '5'),
    BrandCategoryModel(brandId: '9', categoryId: '11'),
    BrandCategoryModel(brandId: '9', categoryId: '12'),
    BrandCategoryModel(brandId: '9', categoryId: '13'),

    ///
    BrandCategoryModel(brandId: '10', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '14'),
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

// ****-------------------- All Products --------------------****

  static List<ProductModel> products = [
// ! track suits
    // ProductModel(
    //   productType: ProductType.single.name,
    //   id: '029',
    //   title: 'Black Tracksuit',
    //   stock: 25,
    //   price: 90,
    //   thumbnail: CImages.tracksuit_black,
    //   categoryId: '9',
    //   brand: BrandModel(
    //     id: '2',
    //     image: CImages.nikeLogo,
    //     name: 'Nike',
    //     productsCount: 180,
    //     isFeatured: false,
    //   ),
    //   images: [CImages.tracksuit_black],
    // ),
    // ProductModel(
    //   productType: ProductType.single.name,
    //   id: '030',
    //   title: 'Blue Tracksuit',
    //   stock: 30,
    //   price: 95,
    //   thumbnail: CImages.tracksuit_blue,
    //   categoryId: '9',
    //   brand: BrandModel(
    //     id: '2',
    //     image: CImages.nikeLogo,
    //     name: 'Nike',
    //     productsCount: 180,
    //     isFeatured: false,
    //   ),
    //   images: [CImages.tracksuit_blue],
    // ),
    // ProductModel(
    //   id: '031',
    //   productType: ProductType.single.name,
    //   title: 'Red Tracksuit',
    //   stock: 20,
    //   price: 100,
    //   thumbnail: CImages.tracksuit_red,
    //   categoryId: '9',
    //   brand: BrandModel(
    //     id: '2',
    //     image: CImages.nikeLogo,
    //     name: 'Nike',
    //     productsCount: 180,
    //     isFeatured: false,
    //   ),
    //   images: [CImages.tracksuit_red],
    // ),
    // ProductModel(
    //   id: '032',
    //   title: 'Parrot Green Tracksuit',
    //   productType: ProductType.single.name,
    //   stock: 15,
    //   price: 110,
    //   thumbnail: CImages.tracksuit_parrotgreen,
    //   categoryId: '9',
    //   brand: BrandModel(
    //     id: '2',
    //     image: CImages.nikeLogo,
    //     name: 'Nike',
    //     productsCount: 180,
    //     isFeatured: false,
    //   ),
    //   images: [CImages.tracksuit_parrotgreen],
    // ),

//! laptops
// Acer Laptop 1
    ProductModel(
      id: '033',
      title: 'Acer Swift 3',
      stock: 12,
      price: 600,
      salePrice: 550,
      thumbnail: AppImages.acer_laptop_1,
      productType: ProductType.single.name,
      sku: 'ASWIFT32024',
      categoryId: '10',
      isFeatured: true,
      description:
          'Acer Swift 3 with an ultra-lightweight design, long battery life, and fast processing power.',
      brand: BrandModel(
        id: '10',
        image: AppImages.acerLogo,
        name: 'Acer',
        productsCount: 150,
        isFeatured: true,
      ),
      images: [
        AppImages.acer_laptop_1,
      ],
    ),

// Acer Laptop 2
    ProductModel(
      id: '034',
      title: 'Acer Aspire 5',
      stock: 10,
      price: 700,
      salePrice: 650,
      thumbnail: AppImages.acer_laptop_2,
      productType: ProductType.single.name,
      sku: 'AASP52024',
      categoryId: '10',
      isFeatured: true,
      description:
          'Acer Aspire 5 offers premium performance with a stunning full HD display, perfect for work and entertainment.',
      brand: BrandModel(
        id: '10',
        image: AppImages.acerLogo,
        name: 'Acer',
        productsCount: 150,
        isFeatured: true,
      ),
      images: [
        AppImages.acer_laptop_2,
      ],
    ),

// Acer Laptop 3
    ProductModel(
      id: '035',
      title: 'Acer Predator Helios',
      stock: 5,
      price: 1500,
      salePrice: 1400,
      thumbnail: AppImages.acer_laptop_3,
      productType: ProductType.single.name,
      sku: 'APRED2024',
      categoryId: '10',
      isFeatured: true,
      description:
          'Acer Predator Helios, engineered for gamers, comes with superior graphics and cooling technology for the ultimate gaming experience.',
      brand: BrandModel(
        id: '10',
        image: AppImages.acerLogo,
        name: 'Acer',
        productsCount: 150,
        isFeatured: true,
      ),
      images: [
        AppImages.acer_laptop_3,
      ],
    ),

// Acer Laptop 4
    ProductModel(
      id: '036',
      title: 'Acer Nitro 5',
      stock: 7,
      price: 1200,
      salePrice: 1150,
      thumbnail: AppImages.acer_laptop_4,
      productType: ProductType.single.name,
      sku: 'ANITRO52024',
      categoryId: '10',
      isFeatured: true,
      description:
          'Acer Nitro 5 offers smooth gameplay with high performance, immersive audio, and fast refresh rates for competitive gaming.',
      brand: BrandModel(
        id: '10',
        image: AppImages.acerLogo,
        name: 'Acer',
        productsCount: 150,
        isFeatured: true,
      ),
      images: [
        AppImages.acer_laptop_4,
      ],
    ),
// iPhone 12 Black
    ProductModel(
      id: '037',
      title: 'iPhone 12 Black',
      stock: 15,
      price: 850,
      salePrice: 800,
      thumbnail: AppImages.iphone12_black,
      productType: ProductType.single.name,
      sku: 'IPH12BLK2024',
      categoryId: '11',
      isFeatured: true,
      description:
          'iPhone 12 Black with powerful A14 Bionic chip, 5G capabilities, and stunning Super Retina XDR display.',
      brand: BrandModel(
        id: '11',
        image: AppImages.appleLogo,
        name: 'Apple',
        productsCount: 200,
        isFeatured: true,
      ),
      images: [
        AppImages.iphone12_black,
      ],
    ),

// iPhone 12 Blue
    ProductModel(
      id: '038',
      title: 'iPhone 12 Blue',
      stock: 12,
      price: 850,
      salePrice: 800,
      thumbnail: AppImages.iphone12_blue,
      productType: ProductType.single.name,
      sku: 'IPH12BLU2024',
      categoryId: '11',
      isFeatured: true,
      description:
          'iPhone 12 Blue, featuring a sleek design, dual-camera system, and 5G support for faster browsing and streaming.',
      brand: BrandModel(
        id: '11',
        image: AppImages.appleLogo,
        name: 'Apple',
        productsCount: 200,
        isFeatured: true,
      ),
      images: [
        AppImages.iphone12_blue,
      ],
    ),

// iPhone 13 Pro
    ProductModel(
      id: '039',
      title: 'iPhone 13 Pro',
      stock: 10,
      price: 1000,
      salePrice: 950,
      thumbnail: AppImages.iphone13_pro,
      productType: ProductType.single.name,
      sku: 'IPH13PRO2024',
      categoryId: '11',
      isFeatured: true,
      description:
          'iPhone 13 Pro delivers advanced camera systems, 120Hz ProMotion display, and exceptional battery life for a premium experience.',
      brand: BrandModel(
        id: '11',
        image: AppImages.appleLogo,
        name: 'Apple',
        productsCount: 200,
        isFeatured: true,
      ),
      images: [
        AppImages.iphone13_pro,
      ],
    ),

// iPhone 14 Pro
    ProductModel(
      id: '040',
      title: 'iPhone 14 Pro',
      stock: 8,
      price: 1200,
      salePrice: 1150,
      thumbnail: AppImages.iphone14_pro,
      productType: ProductType.single.name,
      sku: 'IPH14PRO2024',
      categoryId: '11',
      isFeatured: true,
      description:
          'iPhone 14 Pro with a new Dynamic Island, enhanced Night mode, and cutting-edge safety features for the ultimate smartphone experience.',
      brand: BrandModel(
        id: '11',
        image: AppImages.appleLogo,
        name: 'Apple',
        productsCount: 200,
        isFeatured: true,
      ),
      images: [
        AppImages.iphone14_pro,
      ],
    ),

// iPhone 8
    ProductModel(
      id: '041',
      title: 'iPhone 8',
      stock: 20,
      price: 400,
      salePrice: 350,
      thumbnail: AppImages.iphone8_mobile,
      productType: ProductType.single.name,
      sku: 'IPH82024',
      categoryId: '11',
      isFeatured: true,
      description:
          'iPhone 8 brings a familiar design with a powerful A11 chip and wireless charging capability, all at an affordable price.',
      brand: BrandModel(
        id: '11',
        image: AppImages.appleLogo,
        name: 'Apple',
        productsCount: 200,
        isFeatured: true,
      ),
      images: [
        AppImages.iphone8_mobile,
      ],
    ),
  ];
}

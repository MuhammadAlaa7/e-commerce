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
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/image_strings.dart';

import 'features/shop/models/banner_model.dart';
import 'features/shop/models/brand_category_model.dart';
import 'features/shop/models/product_variation_model.dart';

class DummyData {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Banners ---

  static final List<BannerModel> banners = [
    BannerModel(
      imageUrl: CImages.banner1,
      targetScreen: Routes.store,
      active: true,
    ),
    BannerModel(
      imageUrl: CImages.banner2,
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
      image: CImages.hermanMillerLogo,
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

// ****-------------------- All Products --------------------****

  static List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'Green Nike Sports Shoe',
      stock: 15,
      price: 135,
      salePrice: 30,
      thumbnail: CImages.nikeBasketballShoeGreenBlack,
      productType: ProductType.variable.name,
      sku: 'ABR4568',
      categoryId: '6',
      isFeatured: true,
      description:
          'Comfortable and stylish green Nike sports shoe, perfect for running.',
      brand: BrandModel(
        id: '1',
        image: CImages.nikeLogo,
        name: 'Nike',
        productsCount: 265,
        isFeatured: true,
      ),
      images: [
        CImages.nikeBasketballShoeGreenBlack,
        CImages.nikeAirJOrdonBlackRed,
        CImages.nikeAirJOrdonOrange,
        CImages.nikeAirJOrdonSingleBlue,
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
          image: CImages.nikeBasketballShoeGreenBlack,
          description:
              'This is a product description for Green Nike sports shoe.',
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 132,
          salePrice: 120,
          image: CImages.nikeAirJOrdonBlackRed,
          description:
              'This is a product description for Black Nike sports shoe.',
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: CImages.nikeAirJOrdonWhiteRed,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 222,
          price: 232,
          salePrice: 120,
          image: CImages.nikeAirJOrdonOrange,
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 334,
          image: CImages.nikeAirJOrdonSingleBlue,
          attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 332,
          image: CImages.nikeAirMax,
          attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
        ),
      ],
    ),
    ProductModel(
      id: '002',
      title: 'Casual Black Jacket',
      stock: 20,
      price: 80,
      salePrice: 50,
      thumbnail: CImages.leather_jacket_1,
      productType: ProductType.single.name,
      sku: 'ABJ7890',
      categoryId: '3',
      isFeatured: false,
      description: 'Stylish black jacket, perfect for casual wear.',
      brand: BrandModel(
        id: '2',
        image: CImages.adidasLogo,
        name: 'Adidas',
        productsCount: 150,
        isFeatured: true,
      ),
      images: [
        CImages.leather_jacket_1,
        CImages.leather_jacket_3,
        CImages.leather_jacket_4,
      ],
      productAttributes: [
        ProductAttributeModel(
          name: 'Size',
          values: ['M', 'L', 'XL'],
        ),
        ProductAttributeModel(
          name: 'Color',
          values: ['Black', 'Grey'],
        ),
      ],
      // productVariations: [
      //   ProductVariationModel(
      //     id: '1',
      //     stock: 10,
      //     price: 75,
      //     image: CImages.leather_jacket_2,
      //     attributeValues: {'Color': 'Black', 'Size': 'M'},
      //     description: 'Casual Black Jacket - Medium Size.',
      //   ),
      // ],
    ),
    ProductModel(
      id: '003',
      title: 'Blue Jeans',
      stock: 50,
      price: 45,
      salePrice: 40,
      thumbnail: CImages.product_jeans,
      productType: ProductType.single.name,
      sku: 'ABJ1234',
      categoryId: '3',
      isFeatured: false,
      description: 'Comfortable and durable blue jeans.',
      brand: BrandModel(
        id: '6',
        image: CImages.zaraLogo,
        name: 'Zara',
        productsCount: 200,
        isFeatured: true,
      ),
      images: [
        CImages.product_jeans,
      ],
      productAttributes: [
        ProductAttributeModel(
          name: 'Size',
          values: ['30', '32', '34', '36'],
        ),
        ProductAttributeModel(
          name: 'Color',
          values: ['Blue', 'Black'],
        ),
      ],
    ),
    ProductModel(
      id: '004',
      title: 'Casual White T-Shirt',
      stock: 30,
      price: 20,
      salePrice: 18,
      thumbnail: CImages.tshirt_blue_collar,
      productType: ProductType.variable.name,
      sku: 'TSS001',
      categoryId: '3',
      isFeatured: true,
      description: 'Comfortable white t-shirt for everyday use.',
      brand: BrandModel(
        id: '6',
        image: CImages.zaraLogo,
        name: 'Zara',
        productsCount: 300,
        isFeatured: false,
      ),
      images: [
        CImages.tshirt_blue_without_collar_front,
        CImages.tshirt_blue_without_collar_back,
        CImages.tshirt_green_collar,
      ],
      productAttributes: [
        ProductAttributeModel(
          name: 'Size',
          values: ['S', 'M', 'L', 'XL'],
        ),
        ProductAttributeModel(
          name: 'Color',
          values: ['White', 'Grey'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 10,
          price: 18,
          image: CImages.tshirt_blue_collar,
          attributeValues: {'Color': 'White', 'Size': 'M'},
          description: 'Casual White T-Shirt - Medium Size.',
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 132,
          image: CImages.tshirt_red_collar,
          attributeValues: {'Color': 'Red', 'Size': 'L'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: CImages.tshirt_green_collar,
          attributeValues: {'Color': 'Green', 'Size': 'XL'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 222,
          price: 232,
          image: CImages.tshirt_blue_without_collar_front,
          attributeValues: {'Color': 'Blue', 'Size': 'S'},
        ),
      ],
    ),
    ProductModel(
      id: '005',
      title: 'Acer Laptop',
      stock: 8,
      price: 550,
      salePrice: 500,
      thumbnail: CImages.acer_laptop_1,
      productType: ProductType.variable.name,
      sku: 'ALP2024',
      categoryId: '2',
      isFeatured: true,
      description: 'Acer laptop with powerful performance and sleek design.',
      brand: BrandModel(
        id: '10',
        image: CImages.acerLogo,
        name: 'Acer',
        productsCount: 100,
        isFeatured: true,
      ),
      images: [
        CImages.acer_laptop_1,
        CImages.acer_laptop_3,
        CImages.acer_laptop_4,
      ],
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Black', 'Grey'],
        ),
        ProductAttributeModel(
          name: 'RAM',
          values: ['8GB', '16GB'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 4,
          price: 550,
          image: CImages.acer_laptop_3,
          attributeValues: {'Color': 'Black', 'RAM': '8GB'},
          description: 'Acer Laptop - 8GB RAM - Black.',
        ),
        ProductVariationModel(
          id: '2',
          stock: 4,
          price: 600,
          image: CImages.acer_laptop_4,
          attributeValues: {'Color': 'Grey', 'RAM': '16GB'},
          description: 'Acer Laptop - 16GB RAM - Grey.',
        ),
      ],
    ),

    ProductModel(
      id: '006',
      title: 'iPhone 14 Pro',
      stock: 25,
      price: 999,
      salePrice: 950,
      thumbnail: CImages.iphone14_white,
      productType: ProductType.variable.name,
      sku: 'IPH2024',
      categoryId: '2',
      isFeatured: true,
      description:
          'Latest iPhone 14 Pro with advanced features and sleek design.',
      brand: BrandModel(
        id: '5',
        image: CImages.appleLogo,
        name: 'Apple',
        productsCount: 150,
        isFeatured: true,
      ),
      images: [
        CImages.iphone14_white,
        CImages.iphone14_pro,
        CImages.iphone13_pro,
      ],
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Silver', 'Space Grey', 'Gold'],
        ),
        ProductAttributeModel(
          name: 'Storage',
          values: ['128GB', '256GB', '512GB'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 10,
          price: 999,
          image: CImages.iphone14_pro,
          attributeValues: {'Color': 'Silver', 'Storage': '128GB'},
          description: 'iPhone 14 Pro - Silver - 128GB Storage.',
        ),
        ProductVariationModel(
          id: '2',
          stock: 8,
          price: 1099,
          image: CImages.iphone14_white,
          attributeValues: {'Color': 'Space Grey', 'Storage': '256GB'},
          description: 'iPhone 14 Pro - Space Grey - 256GB Storage.',
        ),
        ProductVariationModel(
          id: '3',
          stock: 7,
          price: 1199,
          image: CImages.iphone13_pro,
          attributeValues: {'Color': 'Gold', 'Storage': '512GB'},
          description: 'iPhone 14 Pro - Gold - 512GB Storage.',
        ),
      ],
    ),

    ProductModel(
      id: '007',
      title: 'Bedroom Bed',
      stock: 5,
      price: 250,
      salePrice: 230,
      thumbnail: CImages.bedroom_bed,
      productType: ProductType.variable.name,
      sku: 'BRB001',
      categoryId: '5',
      isFeatured: false,
      description: 'Comfortable bedroom bed with modern design.',
      brand: BrandModel(
        id: '9',
        image: CImages.ikeaLogo,
        name: 'Ikea',
        productsCount: 300,
        isFeatured: true,
      ),
      images: [
        CImages.bedroom_bed,
        CImages.bedroom_bed_black,
        CImages.bedroom_bed_grey,
      ],
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Brown', 'Black', 'Grey'],
        ),
        ProductAttributeModel(
          name: 'Size',
          values: ['Queen', 'King'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 2,
          price: 250,
          image: CImages.bedroom_bed_grey,
          attributeValues: {'Color': 'Grey', 'Size': 'Queen'},
          description: 'Bedroom Bed - Grey - Queen Size.',
        ),
        ProductVariationModel(
          id: '2',
          stock: 3,
          price: 280,
          image: CImages.bedroom_bed_with_comforter,
          attributeValues: {'Color': 'Brown', 'Size': 'King'},
          description: 'Bedroom Bed - Brown - King Size.',
        ),
      ],
    ),
    ProductModel(
      id: '008',
      title: 'Office Chair',
      stock: 10,
      price: 80,
      salePrice: 70,
      thumbnail: CImages.office_chair_1,
      productType: ProductType.variable.name,
      sku: 'OFC001',
      categoryId: '5',
      isFeatured: true,
      description: 'Ergonomic office chair for comfortable seating.',
      brand: BrandModel(
        id: '11',
        image: CImages.hermanMillerLogo,
        name: 'Herman Miller',
        productsCount: 100,
        isFeatured: true,
      ),
      images: [
        CImages.office_chair_1,
        CImages.office_chair_2,
      ],
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Black', 'Grey'],
        ),
        ProductAttributeModel(
          name: 'Material',
          values: ['Mesh', 'Leather'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 5,
          price: 80,
          image: CImages.office_chair_2,
          attributeValues: {'Color': 'Black', 'Material': 'Mesh'},
          description: 'Office Chair - Black - Mesh Material.',
        ),
        ProductVariationModel(
          id: '2',
          stock: 5,
          price: 90,
          image: CImages.office_chair_2,
          attributeValues: {'Color': 'Grey', 'Material': 'Leather'},
          description: 'Office Chair - Grey - Leather Material.',
        ),
      ],
    ),
    ProductModel(
      id: '009',
      title: 'Tennis Racket',
      stock: 15,
      price: 120,
      salePrice: 100,
      thumbnail: CImages.tennis_racket,
      productType: ProductType.single.name,
      sku: 'TRK001',
      categoryId: '1',
      isFeatured: true,
      description: 'High-quality tennis racket for professional players.',
      brand: BrandModel(
        id: '2',
        image: CImages.adidasLogo,
        name: 'Adidas',
        productsCount: 50,
        isFeatured: false,
      ),
      images: [
        CImages.tennis_racket,
      ],
      productAttributes: [
        ProductAttributeModel(
          name: 'Grip Size',
          values: ['G2', 'G3'],
        ),
        ProductAttributeModel(
          name: 'String Pattern',
          values: ['16x19', '18x20'],
        ),
      ],
      // productVariations: [
      //   ProductVariationModel(
      //     id: '1',
      //     stock: 10,
      //     price: 120,
      //     image: CImages.tennis_racket,
      //     attributeValues: {'Grip Size': 'G2', 'String Pattern': '16x19'},
      //     description: 'Tennis Racket - G2 Grip Size - 16x19 String Pattern.',
      //   ),
      // ],
    ),
    ProductModel(
      id: '010',
      title: 'Leather Slippers',
      stock: 20,
      price: 40,
      salePrice: 35,
      thumbnail: CImages.slipper_product,
      productType: ProductType.variable.name,
      sku: 'SLP001',
      categoryId: '6',
      isFeatured: false,
      description: 'Comfortable leather slippers for everyday use.',
      brand: BrandModel(
        id: '1',
        image: CImages.nikeLogo,
        name: 'Nike',
        productsCount: 100,
        isFeatured: true,
      ),
      images: [
        CImages.slipper_product,
        CImages.slipper_product_1,
        CImages.slipper_product_2,
      ],
      productAttributes: [
        ProductAttributeModel(
          name: 'Size',
          values: ['M', 'L', 'XL'],
        ),
        ProductAttributeModel(
          name: 'Color',
          values: ['Black', 'Brown'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 10,
          price: 40,
          image: CImages.slipper_product_3,
          attributeValues: {'Color': 'Black', 'Size': 'M'},
          description: 'Leather Slippers - Black - Medium Size.',
        ),
        ProductVariationModel(
          id: '2',
          stock: 10,
          price: 45,
          image: CImages.slipper_product_2,
          attributeValues: {'Color': 'Brown', 'Size': 'L'},
          description: 'Leather Slippers - Brown - Large Size.',
        ),
      ],
    ),

    ProductModel(
      id: '011',
      title: 'Modern Kitchen Counter',
      stock: 15,
      price: 500,
      salePrice: 450,
      thumbnail: CImages.kitchen_counter,
      productType: ProductType.single.name,
      sku: 'KCNTR001',
      categoryId: '5',
      isFeatured: true,
      description:
          'Stylish and durable kitchen counter, perfect for modern kitchens.',
      brand: BrandModel(
        id: '9',
        image: CImages.ikeaLogo,
        name: 'Ikea',
        productsCount: 300,
        isFeatured: true,
      ),
      images: [
        CImages.kitchen_counter,
      ],
    ),

    ProductModel(
      id: '012',
      title: 'Stainless Steel Refrigerator',
      stock: 10,
      price: 1200,
      salePrice: 1100,
      thumbnail: CImages.kitchen_refrigerator,
      productType: ProductType.single.name,
      sku: 'RFG0020',
      categoryId: '5',
      isFeatured: false,
      description:
          'High-capacity stainless steel refrigerator with energy-saving technology.',
      brand: BrandModel(
        id: '8',
        image: CImages.kenwoodLogo,
        name: 'Kenwood',
        productsCount: 150,
        isFeatured: false,
      ),
      images: [
        CImages.kitchen_refrigerator,
      ],
    ),

    ProductModel(
      id: '013',
      title: 'Adidas Football',
      stock: 50,
      price: 35,
      salePrice: 30,
      thumbnail: CImages.adidas_football,
      productType: ProductType.single.name,
      sku: 'FBT001',
      categoryId: '1',
      isFeatured: true,
      description: 'Official Adidas football for professional matches.',
      brand: BrandModel(
        id: '2',
        image: CImages.adidasLogo,
        name: 'Adidas',
        productsCount: 250,
        isFeatured: true,
      ),
      images: [
        CImages.adidas_football,
      ],
    ),

    ProductModel(
      id: '014',
      title: 'Baseball Bat',
      stock: 40,
      price: 45,
      salePrice: 40,
      thumbnail: CImages.baseball_bat,
      productType: ProductType.single.name,
      sku: 'BBT001',
      categoryId: '1',
      isFeatured: false,
      description: 'High-quality wooden baseball bat for professional play.',
      brand: BrandModel(
        id: '2',
        image: CImages.adidasLogo,
        name: 'Adidas',
        productsCount: 120,
        isFeatured: false,
      ),
      images: [
        CImages.baseball_bat,
      ],
    ),

    // iPhone 12 Product
    ProductModel(
      id: '015',
      title: 'iPhone 12 Black',
      stock: 30,
      price: 799,
      salePrice: 750,
      thumbnail: CImages.iphone12_black,
      productType: ProductType.variable.name,
      sku: 'IPH12001',
      categoryId: '2',
      isFeatured: true,
      description:
          'iPhone 12 in black color with stunning display and camera quality.',
      brand: BrandModel(
        id: '5',
        image: CImages.appleLogo,
        name: 'Apple',
        productsCount: 200,
        isFeatured: true,
      ),
      images: [
        CImages.iphone12_black,
        CImages.iphone12_blue,
        CImages.iphone12_green,
      ],
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Black', 'Blue', 'Green', 'Red'],
        ),
        ProductAttributeModel(
          name: 'Storage',
          values: ['64GB', '128GB', '256GB'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 15,
          price: 799,
          image: CImages.iphone12_black,
          attributeValues: {'Color': 'Black', 'Storage': '64GB'},
          description: 'iPhone 12 Black - 64GB Storage.',
        ),
        ProductVariationModel(
          id: '2',
          stock: 10,
          price: 850,
          image: CImages.iphone12_blue,
          attributeValues: {'Color': 'Blue', 'Storage': '128GB'},
          description: 'iPhone 12 Blue - 128GB Storage.',
        ),
        ProductVariationModel(
          id: '3',
          stock: 5,
          price: 899,
          image: CImages.iphone12_green,
          attributeValues: {'Color': 'Green', 'Storage': '256GB'},
          description: 'iPhone 12 Green - 256GB Storage.',
        ),
      ],
    ),

    // iPhone 13 Pro Product
    ProductModel(
      id: '016',
      title: 'iPhone 13 Pro',
      stock: 20,
      price: 999,
      salePrice: 950,
      thumbnail: CImages.iphone13_pro,
      productType: ProductType.variable.name,
      sku: 'IPH13001',
      categoryId: '2',
      isFeatured: true,
      description:
          'iPhone 13 Pro with enhanced performance and camera features.',
      brand: BrandModel(
        id: '5',
        image: CImages.appleLogo,
        name: 'Apple',
        productsCount: 300,
        isFeatured: true,
      ),
      images: [
        CImages.iphone13_pro,
        CImages.iphone12_black,
        CImages.iphone14_white,
      ],
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Graphite', 'Gold', 'Silver', 'Sierra Blue'],
        ),
        ProductAttributeModel(
          name: 'Storage',
          values: ['128GB', '256GB', '512GB', '1TB'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 10,
          price: 999,
          image: CImages.iphone13_pro,
          attributeValues: {'Color': 'Graphite', 'Storage': '128GB'},
          description: 'iPhone 13 Pro - Graphite - 128GB Storage.',
        ),
        ProductVariationModel(
          id: '2',
          stock: 7,
          price: 1099,
          image: CImages.iphone13_pro,
          attributeValues: {'Color': 'Sierra Blue', 'Storage': '256GB'},
          description: 'iPhone 13 Pro - Sierra Blue - 256GB Storage.',
        ),
        ProductVariationModel(
          id: '3',
          stock: 3,
          price: 1299,
          image: CImages.iphone12_black,
          attributeValues: {'Color': 'Gold', 'Storage': '512GB'},
          description: 'iPhone 13 Pro - Gold - 512GB Storage.',
        ),
      ],
    ),

    // iPhone 8 Product
    ProductModel(
      id: '017',
      title: 'iPhone 8',
      stock: 50,
      price: 499,
      salePrice: 450,
      thumbnail: CImages.iphone8_mobile,
      productType: ProductType.variable.name,
      sku: 'IPH8001',
      categoryId: '2',
      isFeatured: false,
      description: 'Classic iPhone 8 with reliable performance and design.',
      brand: BrandModel(
        id: '5',
        image: CImages.appleLogo,
        name: 'Apple',
        productsCount: 100,
        isFeatured: true,
      ),
      images: [
        CImages.iphone8_mobile,
        CImages.iphone8_mobile_back,
        CImages.iphone8_mobile_front,
      ],
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Space Grey', 'Silver', 'Gold'],
        ),
        ProductAttributeModel(
          name: 'Storage',
          values: ['64GB', '128GB', '256GB'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 30,
          price: 499,
          image: CImages.iphone8_mobile,
          attributeValues: {'Color': 'Space Grey', 'Storage': '64GB'},
          description: 'iPhone 8 - Space Grey - 64GB Storage.',
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 549,
          image: CImages.iphone8_mobile_back,
          attributeValues: {'Color': 'Silver', 'Storage': '128GB'},
          description: 'iPhone 8 - Silver - 128GB Storage.',
        ),
        ProductVariationModel(
          id: '3',
          stock: 5,
          price: 599,
          image: CImages.iphone8_mobile_front,
          attributeValues: {'Color': 'Gold', 'Storage': '256GB'},
          description: 'iPhone 8 - Gold - 256GB Storage.',
        ),
      ],
    ),

    // iPhone SE Product
    ProductModel(
      id: '018',
      title: 'iPhone SE',
      stock: 60,
      price: 399,
      salePrice: 370,
      thumbnail: CImages
          .iphone8_mobile_dual_side, // Assuming SE image is same as iPhone 8
      productType: ProductType.variable.name,
      sku: 'IPHSE01',
      categoryId: '2',
      isFeatured: true,
      description: 'Affordable iPhone SE with modern performance.',
      brand: BrandModel(
        id: '5',
        image: CImages.appleLogo, // Assuming SE image is same as iPhone 8
        name: 'Apple',
        productsCount: 250,
        isFeatured: true,
      ),
      images: [
        CImages
            .iphone8_mobile_dual_side, // Assuming SE image is same as iPhone 8
        CImages.iphone8_mobile,
      ],
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['White', 'Black', 'Red'],
        ),
        ProductAttributeModel(
          name: 'Storage',
          values: ['64GB', '128GB', '256GB'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 40,
          price: 399,
          image: CImages
              .iphone8_mobile_dual_side, // Assuming SE image is same as iPhone 8
          attributeValues: {'Color': 'White', 'Storage': '64GB'},
          description: 'iPhone SE - White - 64GB Storage.',
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 450,
          image:
              CImages.iphone8_mobile, // Assuming SE image is same as iPhone 8
          attributeValues: {'Color': 'Black', 'Storage': '128GB'},
          description: 'iPhone SE - Black - 128GB Storage.',
        ),
        ProductVariationModel(
          id: '3',
          stock: 5,
          price: 470,
          image: CImages
              .iphone8_mobile_front, // Assuming SE image is same as iPhone 8
          attributeValues: {'Color': 'Red', 'Storage': '256GB'},
          description: 'iPhone SE - Red - 256GB Storage.',
        ),
      ],
    ),
  ];

// List<ProductModel> products = [
//     ProductModel(
//       id: '001',
//       title: 'Green Nike Sports Shoe',
//       stock: 15,
//       price: 135,
//       salePrice: 30,
//       thumbnail: CImages.,
//       productType: 'shoes',
//       sku: 'ABR4568',
//       categoryId: '1',
//       isFeatured: true,
//       description:
//           'Comfortable and stylish green Nike sports shoe, perfect for running.',
//       brand: BrandModel(
//         id: '1',
//         image: CImages.nikeLogo,
//         name: 'Nike',
//         productsCount: 265,
//         isFeatured: true,
//       ),
//       images: [
//         CImages.,
//         CImages.,
//         CImages.,
//         CImages.,
//       ],
//       productAttributes: [
//         ProductAttributeModel(
//           name: 'Color',
//           values: ['Green', 'Black', 'Red'],
//         ),
//         ProductAttributeModel(
//           name: 'Size',
//           values: ['EU 30', 'EU 32', 'EU 34'],
//         ),
//       ],
//       productVariations: [
//         ProductVariationModel(
//           id: '1',
//           stock: 34,
//           price: 134,
//           salePrice: 122.6,
//           image: CImages.productImage1,
//           description:
//               'This is a product description for Green Nike sports shoe.',
//           attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
//         ),

//         // Other variations...
//         ProductVariationModel(
//           id: '2',
//           stock: 15,
//           price: 132,
//           salePrice: 120,
//           image: CImages.,
//           description:
//               'This is a product description for Black Nike sports shoe.',
//           attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
//         ),
//         ProductVariationModel(
//           id: '3',
//           stock: 0,
//           price: 234,
//           image: CImages.,
//           attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
//         ),
//         ProductVariationModel(
//           id: '4',
//           stock: 222,
//           price: 232,
//           salePrice: 120,
//           image: CImages.,
//           attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
//         ),
//         ProductVariationModel(
//           id: '5',
//           stock: 0,
//           price: 334,
//           image: CImages.,
//           attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
//         ),
//         ProductVariationModel(
//           id: '6',
//           stock: 11,
//           price: 332,
//           image: CImages.,
//           attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
//         ),

//       ],
//     ),
//     ProductModel(
//       id: '002',
//       title: 'Casual Black Jacket',
//       stock: 20,
//       price: 80,
//       salePrice: 50,
//       thumbnail: CImages.,
//       productType: 'jacket',
//       sku: 'ABJ7890',
//       categoryId: '2',
//       isFeatured: false,
//       description: 'Stylish black jacket, perfect for casual wear.',
//       brand: BrandModel(
//         id: '2',
//         image: CImages.adidasLogo,
//         name: 'Adidas',
//         productsCount: 150,
//         isFeatured: true,
//       ),
//       images: [
//         CImages.,
//         CImages.,
//         CImages.,
//       ],
//       productAttributes: [
//         ProductAttributeModel(
//           name: 'Size',
//           values: ['M', 'L', 'XL'],
//         ),
//         ProductAttributeModel(
//           name: 'Color',
//           values: ['Black', 'Grey'],
//         ),
//       ],
//       productVariations: [
//         ProductVariationModel(
//           id: '1',
//           stock: 10,
//           price: 75,
//           image: CImages.,
//           attributeValues: {'Color': 'Black', 'Size': 'M'},
//           description: 'Casual Black Jacket - Medium Size.',
//         ),
//         // Other variations...
//       ],
//     ),
//     ProductModel(
//       id: '003',
//       title: 'Blue Jeans',
//       stock: 50,
//       price: 45,
//       salePrice: 40,
//       thumbnail: CImages.,
//       productType: 'jeans',
//       sku: 'ABJ1234',
//       categoryId: '3',
//       isFeatured: false,
//       description: 'Comfortable and durable blue jeans.',
//       brand: BrandModel(
//         id: '3',
//         image: CImages.zaraLogo,
//         name: 'Zara',
//         productsCount: 200,
//         isFeatured: true,
//       ),
//       images: [
//         CImages.,

//       ],
//       productAttributes: [
//         ProductAttributeModel(
//           name: 'Size',
//           values: ['30', '32', '34', '36'],
//         ),
//         ProductAttributeModel(
//           name: 'Color',
//           values: ['Blue', 'Black'],
//         ),
//       ],

//         // Other variations...

//     ),
//     ProductModel(
//       id: '004',
//       title: 'Casual White T-Shirt',
//       stock: 30,
//       price: 20,
//       salePrice: 18,
//       thumbnail: CImages.,
//       productType: 'shirt',
//       sku: 'TSS001',
//       categoryId: '4',
//       isFeatured: true,
//       description: 'Comfortable white t-shirt for everyday use.',
//       brand: BrandModel(
//         id: '4',
//         image: CImages.zaraLogo,
//         name: 'Zara',
//         productsCount: 300,
//         isFeatured: false,
//       ),
//       images: [
//         CImages.,
//         CImages.,
//         CImages.,
//       ],
//       productAttributes: [
//         ProductAttributeModel(
//           name: 'Size',
//           values: ['S', 'M', 'L', 'XL'],
//         ),
//         ProductAttributeModel(
//           name: 'Color',
//           values: ['White', 'Grey'],
//         ),
//       ],
//       productVariations: [
//         ProductVariationModel(
//           id: '1',
//           stock: 10,
//           price: 18,
//           image: CImages.,
//           attributeValues: {'Color': 'White', 'Size': 'M'},
//           description: 'Casual White T-Shirt - Medium Size.',
//         ),
//           ProductVariationModel(
//           id: '2',
//           stock: 15,
//           price: 132,
//           image: CImages.,
//           attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
//         ),
//         ProductVariationModel(
//           id: '3',
//           stock: 0,
//           price: 234,
//           image: CImages.,
//           attributeValues: {'Color': 'Yellow', 'Size': 'EU 34'},
//         ),
//         ProductVariationModel(
//           id: '4',
//           stock: 222,
//           price: 232,
//           image: CImages.,
//           attributeValues: {'Color': 'Yellow', 'Size': 'EU 32'},
//         ),
//         ProductVariationModel(
//           id: '5',
//           stock: 0,
//           price: 334,
//           image: CImages.,
//           attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
//         ),
//         ProductVariationModel(
//           id: '6',
//           stock: 11,
//           price: 332,
//           image: CImages.,
//           attributeValues: {'Color': 'Green', 'Size': 'EU 30'},
//         ),
//         ProductVariationModel(
//           id: '7',
//           stock: 0,
//           price: 334,
//           image: CImages.,
//           attributeValues: {'Color': 'Blue', 'Size': 'EU 30'},
//         ),
//         ProductVariationModel(
//           id: '8',
//           stock: 11,
//           price: 332,
//           image: CImages.,
//           attributeValues: {'Color': 'Blue', 'Size': 'EU 34'},
//         ),
//         // Other variations...
//       ],
//     ),
//     ProductModel(
//       id: '005',
//       title: 'Comfortable Slippers',
//       stock: 25,
//       price: 15,
//       salePrice: 12,
//       thumbnail: CImages.productImage6,
//       productType: 'slippers',
//       sku: 'SLP123',
//       categoryId: '5',
//       isFeatured: true,
//       description: 'Soft and comfortable slippers for indoor use.',
//       brand: BrandModel(
//         id: '5',
//         image: CImages.pumaLogo,
//         name: 'Puma',
//         productsCount: 100,
//         isFeatured: false,
//       ),
//       images: [
//         CImages.productImage6,
//         CImages.productImage7,
//         CImages.productImage8,
//       ],
//       productAttributes: [
//         ProductAttributeModel(
//           name: 'Size',
//           values: ['S', 'M', 'L'],
//         ),
//         ProductAttributeModel(
//           name: 'Color',
//           values: ['Black', 'Brown'],
//         ),
//       ],
//       productVariations: [
//         ProductVariationModel(
//           id: '1',
//           stock: 5,
//           price: 14,
//           image: CImages.productImage6,
//           attributeValues: {'Color': 'Black', 'Size': 'M'},
//           description: 'Comfortable Black Slippers - Medium Size.',
//         ),
//         // Other variations...
//       ],
//     ),
//     ProductModel(
//       id: '006',
//       title: 'Samsung Galaxy S9',
//       stock: 10,
//       price: 700,
//       salePrice: 650,
//       thumbnail: CImages.productImage11,
//       productType: 'mobile',
//       sku: 'SMG1234',
//       categoryId: '6',
//       isFeatured: true,
//       description: 'Samsung Galaxy S9 with 64 GB storage, available in black.',
//       brand: BrandModel(
//         id: '6',
//         image: CImages.appleLogo,
//         name: 'Apple',
//         productsCount: 150,
//         isFeatured: true,
//       ),
//       images: [
//         CImages.productImage11,
//         CImages.productImage12,
//         CImages.productImage13,
//       ],
//       productAttributes: [
//         ProductAttributeModel(
//           name: 'Storage',
//           values: ['64 GB', '128 GB'],
//         ),
//         ProductAttributeModel(
//           name: 'Color',
//           values: ['Black', 'Blue', 'Pink'],
//         ),
//       ],
//       productVariations: [
//         ProductVariationModel(
//           id: '1',
//           stock: 3,
//           price: 650,
//           image: CImages.productImage11,
//           attributeValues: {'Color': 'Black', 'Storage': '64 GB'},
//           description: 'Samsung Galaxy S9 - 64 GB, Black.',
//         ),
//         ProductVariationModel(
//           id: '2',
//           stock: 3,
//           price: 650,
//           image: CImages.productImage11,
//           attributeValues: {'Color': 'Blue', 'Storage': '64 GB'},
//           description: 'Samsung Galaxy S9 - 64 GB, Blue.',
//         ),
//         ProductVariationModel(
//           id: '3',
//           stock: 3,
//           price: 650,
//           image: CImages.productImage11,
//           attributeValues: {'Color': 'Pink', 'Storage': '64 GB'},
//           description: 'Samsung Galaxy S9 - 64 GB, Pink.',
//         ),
//         // Other variations...
//       ],
//     ),
//     ProductModel(
//       id: '007',
//       title: 'TOMI Dog Food - Chicken Flavor',
//       stock: 20,
//       price: 25,
//       salePrice: 20,
//       thumbnail: CImages.productImage18,
//       productType: 'food',
//       sku: 'DOG123',
//       categoryId: '7',
//       isFeatured: true,
//       description: 'TOMI Dog Food - Chicken flavor, rich in nutrients.',
//       brand: BrandModel(
//         id: '7',
//         image: CImages.kenwoodLogo,
//         name: 'TOMI',
//         productsCount: 50,
//         isFeatured: false,
//       ),
//       images: [
//         CImages.productImage18,
//         CImages.productImage19,
//         CImages.productImage20,
//       ],
//       productAttributes: [
//         ProductAttributeModel(
//           name: 'Flavor',
//           values: ['Chicken', 'Beef', 'Lamb'],
//         ),
//         ProductAttributeModel(
//           name: 'Size',
//           values: ['1kg', '3kg', '5kg'],
//         ),
//       ],
//       productVariations: [
//         ProductVariationModel(
//           id: '1',
//           stock: 8,
//           price: 20,
//           image: CImages.productImage18,
//           attributeValues: {'Flavor': 'Chicken', 'Size': '1kg'},
//           description: 'TOMI Dog Food - Chicken Flavor, 1kg.',
//         ),

//       ],
//     ),
//     // Additional products would continue here, following the same pattern.

//       ProductModel(
//       id: '008',
//       title: 'Apple MacBook Pro 13"',
//       stock: 5,
//       price: 1200,
//       salePrice: 1150,
//       thumbnail: CImages.productImage14,
//       productType: 'laptop',
//       sku: 'MBP13',
//       categoryId: '8',
//       isFeatured: true,
//       description:
//           'Apple MacBook Pro with 13" Retina display, 256GB SSD, and M1 chip.',
//       brand: BrandModel(
//         id: '8',
//         image: CImages.appleLogo,
//         name: 'Apple',
//         productsCount: 80,
//         isFeatured: true,
//       ),
//       images: [
//         CImages.productImage14,
//         CImages.productImage15,
//         CImages.productImage16,
//       ],
//       productAttributes: [
//         ProductAttributeModel(
//           name: 'Storage',
//           values: ['256GB', '512GB'],
//         ),
//         ProductAttributeModel(
//           name: 'Color',
//           values: ['Silver', 'Space Gray'],
//         ),
//       ],
//       productVariations: [
//         ProductVariationModel(
//           id: '1',
//           stock: 2,
//           price: 1150,
//           image: CImages.productImage14,
//           attributeValues: {'Color': 'Silver', 'Storage': '256GB'},
//           description: 'Apple MacBook Pro 13" - 256GB, Silver.',
//         ),
//         ProductVariationModel(
//           id: '2',
//           stock: 2,
//           price: 1150,
//           image: CImages.productImage14,
//           attributeValues: {'Color': 'Space Gray', 'Storage': '256GB'},
//           description: 'Apple MacBook Pro 13" - 256GB, Space Gray.',
//         ),
//         // Other variations...

//       ],
//     ),

//     ProductModel(
//       id: '009',
//       title: 'Adidas Running Shorts',
//       stock: 30,
//       price: 25,
//       salePrice: 20,
//       thumbnail: CImages.productImage23,
//       productType: 'shorts',
//       sku: 'ADRSHRT123',
//       categoryId: '11',
//       isFeatured: false,
//       description:
//           'Lightweight and breathable running shorts for optimal performance.',
//       brand: BrandModel(
//         id: '2',
//         image: CImages.adidasLogo,
//         name: 'Adidas',
//         productsCount: 150,
//         isFeatured: true,
//       ),
//       images: [
//         CImages.productImage23,
//         CImages.productImage24,
//         CImages.productImage25,
//       ],
//       productAttributes: [
//         ProductAttributeModel(
//           name: 'Size',
//           values: ['S', 'M', 'L', 'XL'],
//         ),
//         ProductAttributeModel(
//           name: 'Color',
//           values: ['Black', 'Blue'],
//         ),
//       ],
//       productVariations: [
//         ProductVariationModel(
//           id: '1',
//           stock: 10,
//           price: 20,
//           image: CImages.productImage23,
//           attributeValues: {'Color': 'Black', 'Size': 'M'},
//           description: 'Adidas Running Shorts - Medium Size, Black.',
//         ),
//         ProductVariationModel(
//           id: '2',
//           stock: 10,
//           price: 20,
//           image: CImages.productImage23,
//           attributeValues: {'Color': 'Blue', 'Size': 'M'},
//           description: 'Adidas Running Shorts - Medium Size, Blue.',
//         ),

//       ],
//     ),

//     ProductModel(
//       id: '010',
//       title: 'Nike Air Max 270',
//       stock: 25,
//       price: 150,
//       salePrice: 140,
//       thumbnail: CImages.productImage8,
//       productType: 'footwear',
//       sku: 'NKM270',
//       categoryId: '15',
//       isFeatured: true,
//       description:
//           'Popular running shoes with lightweight design and Air Max cushioning.',
//       brand: BrandModel(
//         id: '14',
//         image: CImages.nikeLogo,
//         name: 'Nike',
//         productsCount: 200,
//         isFeatured: true,
//       ),
//       images: [
//         CImages.productImage8,
//         CImages.productImage9,
//         CImages.productImage10,
//       ],
//       productAttributes: [
//         ProductAttributeModel(
//           name: 'Size',
//           values: ['7', '8', '9', '10', '11'],
//         ),
//         ProductAttributeModel(
//           name: 'Color',
//           values: ['White', 'Black', 'Red'],
//         ),
//       ],
//       productVariations: [
//         ProductVariationModel(
//           id: '1',
//           stock: 5,
//           price: 140,
//           image: CImages.productImage35,
//           attributeValues: {'Size': '9', 'Color': 'White'},
//           description: 'Nike Air Max 270 - Size 9, White.',
//         ),
//         ProductVariationModel(
//           id: '2',
//           stock: 5,
//           price: 140,
//           image: CImages.productImage35,
//           attributeValues: {'Size': '9', 'Color': 'Black'},
//           description: 'Nike Air Max 270 - Size 9, Black.',
//         ),
//         // Other variations...
//       ],
//     ),
//     ProductModel(
//       id: '011',
//       title: 'Samsung Galaxy S22',
//       stock: 20,
//       price: 900,
//       salePrice: 850,
//       thumbnail: CImages.productImage38,
//       productType: 'mobile',
//       sku: 'SGS22',
//       categoryId: '16',
//       isFeatured: true,
//       description:
//           'Latest smartphone with 5G connectivity, 128GB storage, and a powerful camera system.',
//       brand: BrandModel(
//         id: '15',
//         image: CImages.appleLogo,
//         name: 'Samsung',
//         productsCount: 150,
//         isFeatured: true,
//       ),
//       images: [
//         CImages.productImage1,
//         CImages.productImage12,
//         CImages.productImage13,
//       ],
//       productAttributes: [
//         ProductAttributeModel(
//           name: 'Storage',
//           values: ['128GB', '256GB'],
//         ),
//         ProductAttributeModel(
//           name: 'Color',
//           values: ['Phantom Black', 'Phantom White'],
//         ),
//       ],
//       productVariations: [
//         ProductVariationModel(
//           id: '1',
//           stock: 8,
//           price: 850,
//           image: CImages.productImage38,
//           attributeValues: {'Storage': '128GB', 'Color': 'Phantom Black'},
//           description: 'Samsung Galaxy S22 - 128GB, Phantom Black.',
//         ),
//         ProductVariationModel(
//           id: '2',
//           stock: 8,
//           price: 850,
//           image: CImages.productImage38,
//           attributeValues: {'Storage': '128GB', 'Color': 'Phantom White'},
//           description: 'Samsung Galaxy S22 - 128GB, Phantom White.',
//         ),

//         // Other variations...
//       ],
//     ),
//     ProductModel(
//       id: '018',
//       title: 'Levi\'s 501 Original Fit Jeans',
//       stock: 40,
//       price: 60,
//       salePrice: 55,
//       thumbnail: CImages.productImage44,
//       productType: 'clothing',
//       sku: 'LEVI501',
//       categoryId: '18',
//       isFeatured: true,
//       description:
//           'Classic straight leg jeans with a button fly and iconic fit.',
//       brand: BrandModel(
//         id: '17',
//         image: CImages.productImage1,
//         name: 'Levi\'s',
//         productsCount: 120,
//         isFeatured: true,
//       ),
//       images: [
//         CImages.productImage44,
//         CImages.productImage45,
//         CImages.productImage46,
//       ],
//       productAttributes: [
//         ProductAttributeModel(
//           name: 'Size',
//           values: ['28', '30', '32', '34', '36'],
//         ),
//         ProductAttributeModel(
//           name: 'Color',
//           values: ['Blue', 'Black'],
//         ),
//       ],
//       productVariations: [
//         ProductVariationModel(
//           id: '1',
//           stock: 10,
//           price: 55,
//           image: CImages.productImage44,
//           attributeValues: {'Size': '32', 'Color': 'Blue'},
//           description: 'Levi\'s 501 Original Fit Jeans - Size 32, Blue.',
//         ),
//         // Other variations...
//       ],
//     ),
//     ProductModel(
//       id: '019',
//       title: 'Apple iPad Air (4th Gen)',
//       stock: 10,
//       price: 600,
//       salePrice: 580,
//       thumbnail: CImages.productImage47,
//       productType: 'tablet',
//       sku: 'IPADAIR4',
//       categoryId: '19',
//       isFeatured: true,
//       description:
//           '10.9-inch iPad Air with A14 Bionic chip, Wi-Fi, and 64GB storage.',
//       brand: BrandModel(
//         id: '8',
//         image: CImages.appleLogo,
//         name: 'Apple',
//         productsCount: 80,
//         isFeatured: true,
//       ),
//       images: [
//         CImages.productImage47,
//         CImages.productImage48,
//         CImages.productImage49,
//       ],
//       productAttributes: [
//         ProductAttributeModel(
//           name: 'Storage',
//           values: ['64GB', '256GB'],
//         ),
//         ProductAttributeModel(
//           name: 'Color',
//           values: ['Sky Blue', 'Green', 'Rose Gold'],
//         ),
//       ],
//       productVariations: [
//         ProductVariationModel(
//           id: '1',
//           stock: 4,
//           price: 580,
//           image: CImages.productImage47,
//           attributeValues: {'Storage': '64GB', 'Color': 'Sky Blue'},
//           description: 'Apple iPad Air (4th Gen) - 64GB, Sky Blue.',
//         ),
//         // Other variations...
//       ],
//     ),
//     ProductModel(
//       id: '020',
//       title: 'Bose QuietComfort 35 II',
//       stock: 15,
//       price: 300,
//       salePrice: 280,
//       thumbnail: CImages.productImage50,
//       productType: 'electronics',
//       sku: 'BQC35II',
//       categoryId: '20',
//       isFeatured: true,
//       description:
//           'Wireless noise-cancelling headphones with Alexa voice control.',
//       brand: BrandModel(
//         id: '18',
//         image: CImages.productImage1,
//         name: 'Bose',
//         productsCount: 60,
//         isFeatured: true,
//       ),
//       images: [
//         CImages.productImage50,
//         CImages.productImage51,
//         CImages.productImage52,
//       ],
//       productAttributes: [
//         ProductAttributeModel(
//           name: 'Color',
//           values: ['Black', 'Silver'],
//         ),
//       ],
//       productVariations: [
//         ProductVariationModel(
//           id: '1',
//           stock: 6,
//           price: 280,
//           image: CImages.productImage50,
//           attributeValues: {'Color': 'Black'},
//           description: 'Bose QuietComfort 35 II - Black.',
//         ),
//         // Other variations...
//       ],
  // ),
  // ProductModel(
  //   id: '021',
  //   title: 'Samsung 55" QLED Smart TV',
  //   stock: 8,
  //   price: 1200,
  //   salePrice: 1100,
  //   thumbnail: CImages.productImage53,
  //   productType: 'television',
  //   sku: 'SMQ55',
  //   categoryId: '21',
  //   isFeatured: true,
  //   description:
  //       '4K UHD Smart TV with Quantum Dot technology and built-in Alexa.',
  //   brand: BrandModel(
  //     id: '15',
  //     image: CImages.samsungLogo,
  //     name: 'Samsung',
  //     productsCount: 150,
  //     isFeatured: true,
  //   ),
  //   images: [
  //     CImages.productImage53,
  //     CImages.productImage54,
  //     CImages.productImage55,
  //   ],
  //   productAttributes: [
  //     ProductAttributeModel(
  //       name: 'Size',
  //       values: ['55"', '65"'],
  //     ),
  //   ],
  //   productVariations: [
  //     ProductVariationModel(
  //       id: '1',
  //       stock: 4,
  //       price: 1100,
  //       image: CImages.productImage53,
  //       attributeValues: {'Size': '55"'},
  //       description: 'Samsung 55" QLED Smart TV.',
  //     ),
  //     // Other variations...
  //   ],
  // ),
  // ProductModel(
  //   id: '022',
  //   title: 'Herman Miller Aeron Chair',
  //   stock: 5,
  //   price: 1400,
  //   salePrice: 1350,
  //   thumbnail: CImages.productImage56,
  //   productType: 'furniture',
  //   sku: 'HMAERON',
  //   categoryId: '22',
  //   isFeatured: true,
  //   description:
  //       'Ergonomic office chair with adjustable lumbar support and breathable mesh.',
  //   brand: BrandModel(
  //     id: '19',
  //     image: CImages.hermanmillerLogo,
  //     name: 'Herman Miller',
  //     productsCount: 30,
  //     isFeatured: true,
  //   ),
  //   images: [
  //     CImages.productImage56,
  //     CImages.productImage57,
  //     CImages.productImage58,
  //   ],
  //   productAttributes: [
  //     ProductAttributeModel(
  //       name: 'Size',
  //       values: ['A', 'B', 'C'],
  //     ),
  //     ProductAttributeModel(
  //       name: 'Color',
  //       values: ['Graphite', 'Mineral'],
  //     ),
  //   ],
  //   productVariations: [
  //     ProductVariationModel(
  //       id: '1',
  //       stock: 2,
  //       price: 1350,
  //       image: CImages.productImage56,
  //       attributeValues: {'Size': 'B', 'Color': 'Graphite'},
  //       description: 'Herman Miller Aeron Chair - Size B, Graphite.',
  //     ),
  //     // Other variations...
  //   ],
  // ),
  // ProductModel(
  //   id: '023',
  //   title: 'Nintendo Switch',
  //   stock: 25,
  //   price: 300,
  //   salePrice: 280,
  //   thumbnail: CImages.productImage59,
  //   productType: 'gaming',
  //   sku: 'NINSWITCH',
  //   categoryId: '23',
  //   isFeatured: true,
  //   description:
  //       'Versatile gaming console with detachable Joy-Con controllers and a 6.2" display.',
  //   brand: BrandModel(
  //     id: '20',
  //     image: CImages.nintendoLogo,
  //     name: 'Nintendo',
  //     productsCount: 70,
  //     isFeatured: true,
  //   ),
  //   images: [
  //     CImages.productImage59,
  //     CImages.productImage60,
  //     CImages.productImage61,
  //   ],
  //   productAttributes: [
  //     ProductAttributeModel(
  //       name: 'Color',
  //       values: ['Neon Red/Blue', 'Gray'],
  //     ),
  //   ],
  //   productVariations: [
  //     ProductVariationModel(
  //       id: '1',
  //       stock: 12,
  //       price: 280,
  //       image: CImages.productImage59,
  //       attributeValues: {'Color': 'Neon Red/Blue'},
  //       description: 'Nintendo Switch - Neon Red/Blue.',
  //     ),
  //     // Other variations...
  //   ],
  // ),
  // ProductModel(
  //   id: '024',
  //   title: 'Logitech MX Master 3 Mouse',
  //   stock: 20,
  //   price: 100,
  //   salePrice: 90,
  //   thumbnail: CImages.productImage62,
  //   productType: 'accessories',
  //   sku: 'LGMX3',
  //   categoryId: '24',
  //   isFeatured: true,
  //   description:
  //       'Advanced wireless mouse with ergonomic design and customizable buttons.',
  //   brand: BrandModel(
  //     id: '21',
  //     image: CImages.logitechLogo,
  //     name: 'Logitech',
  //     productsCount: 90,
  //     isFeatured: true,
  //   ),
  //   images: [
  //     CImages.productImage62,
  //     CImages.productImage63,
  //     CImages.productImage64,
  //   ],
  //   productAttributes: [
  //     ProductAttributeModel(
  //       name: 'Color',
  //       values: ['Graphite', 'Midnight Teal'],
  //     ),
  //   ],
  //   productVariations: [
  //     ProductVariationModel(
  //       id: '1',
  //       stock: 10,
  //       price: 90,
  //       image: CImages.productImage62,
  //       attributeValues: {'Color': 'Graphite'},
  //       description: 'Logitech MX Master 3 Mouse - Graphite.',
  //     ),
  //     // Other variations...
  //   ],
  // ),
  // ProductModel(
  //   id: '025',
  //   title: 'Dell UltraSharp 27" Monitor',
  //   stock: 10,
  //   price: 500,
  //   salePrice: 480,
  //   thumbnail: CImages.productImage65,
  //   productType: 'electronics',
  //   sku: 'DULTR27',
  //   categoryId: '25',
  //   isFeatured: true,
  //   description:
  //       '27-inch 4K UHD monitor with IPS panel and wide color gamut.',
  //   brand: BrandModel(
  //     id: '22',
  //     image: CImages.dellLogo,
  //     name: 'Dell',
  //     productsCount: 95,
  //     isFeatured: true,
  //   ),
  //   images: [
  //     CImages.productImage65,
  //     CImages.productImage66,
  //     CImages.productImage67,
  //   ],
  //   productAttributes: [
  //     ProductAttributeModel(
  //       name: 'Resolution',
  //       values: ['3840 x 2160'],
  //     ),
  //   ],
  //   productVariations: [
  //     ProductVariationModel(
  //       id: '1',
  //       stock: 5,
  //       price: 480,
  //       image: CImages.productImage65,
  //       attributeValues: {'Resolution': '3840 x 2160'},
  //       description: 'Dell UltraSharp 27" Monitor - 4K UHD.',
  //     ),
  //     // Other variations...
  //   ],
  // ),
  // ProductModel(
  //   id: '026',
  //   title: 'Samsung Galaxy Watch 4',
  //   stock: 15,
  //   price: 250,
  //   salePrice: 230,
  //   thumbnail: CImages.productImage68,
  //   productType: 'wearable',
  //   sku: 'SGWATCH4',
  //   categoryId: '26',
  //   isFeatured: true,
  //   description:
  //       'Smartwatch with fitness tracking, ECG, and body composition analysis.',
  //   brand: BrandModel(
  //     id: '15',
  //     image: CImages.samsungLogo,
  //     name: 'Samsung',
  //     productsCount: 150,
  //     isFeatured: true,
  //   ),
  //   images: [
  //     CImages.productImage68,
  //     CImages.productImage69,
  //     CImages.productImage70,
  //   ],
  //   productAttributes: [
  //     ProductAttributeModel(
  //       name: 'Size',
  //       values: ['40mm', '44mm'],
  //     ),
  //     ProductAttributeModel(
  //       name: 'Color',
  //       values: ['Black', 'Silver'],
  //     ),
  //   ],
  //   productVariations: [
  //     ProductVariationModel(
  //       id: '1',
  //       stock: 6,
  //       price: 230,
  //       image: CImages.productImage68,
  //       attributeValues: {'Size': '44mm', 'Color': 'Black'},
  //       description: 'Samsung Galaxy Watch 4 - 44mm, Black.',
  //     ),
  //     // Other variations...
  //   ],
  // ),
  // ProductModel(
  //   id: '027',
  //   title: 'Sonos One Smart Speaker',
  //   stock: 20,
  //   price: 200,
  //   salePrice: 180,
  //   thumbnail: CImages.productImage71,
  //   productType: 'home audio',
  //   sku: 'SNSONE',
  //   categoryId: '27',
  //   isFeatured: true,
  //   description:
  //       'Smart speaker with Alexa and Google Assistant integration, rich sound, and compact design.',
  //   brand: BrandModel(
  //     id: '23',
  //     image: CImages.sonosLogo,
  //     name: 'Sonos',
  //     productsCount: 55,
  //     isFeatured: true,
  //   ),
  //   images: [
  //     CImages.productImage71,
  //     CImages.productImage72,
  //     CImages.productImage73,
  //   ],
  //   productAttributes: [
  //     ProductAttributeModel(
  //       name: 'Color',
  //       values: ['Black', 'White'],
  //     ),
  //   ],
  //   productVariations: [
  //     ProductVariationModel(
  //       id: '1',
  //       stock: 10,
  //       price: 180,
  //       image: CImages.productImage71,
  //       attributeValues: {'Color': 'Black'},
  //       description: 'Sonos One Smart Speaker - Black.',
  //     ),
  //     // Other variations...
  //   ],
  // ),
  // ProductModel(
  //   id: '028',
  //   title: 'Microsoft Surface Laptop 4',
  //   stock: 10,
  //   price: 1000,
  //   salePrice: 950,
  //   thumbnail: CImages.productImage74,
  //   productType: 'laptop',
  //   sku: 'MSLPT4',
  //   categoryId: '28',
  //   isFeatured: true,
  //   description:
  //       'Lightweight laptop with 13.5-inch touchscreen, Intel Core i5, and 8GB RAM.',
  //   brand: BrandModel(
  //     id: '24',
  //     image: CImages.microsoftLogo,
  //     name: 'Microsoft',
  //     productsCount: 85,
  //     isFeatured: true,
  //   ),
  //   images: [
  //     CImages.productImage74,
  //     CImages.productImage75,
  //     CImages.productImage76,
  //   ],
  //   productAttributes: [
  //     ProductAttributeModel(
  //       name: 'Storage',
  //       values: ['256GB', '512GB'],
  //     ),
  //     ProductAttributeModel(
  //       name: 'Color',
  //       values: ['Platinum', 'Matte Black'],
  //     ),
  //   ],
  //   productVariations: [
  //     ProductVariationModel(
  //       id: '1',
  //       stock: 4,
  //       price: 950,
  //       image: CImages.productImage74,
  //       attributeValues: {'Storage': '256GB', 'Color': 'Platinum'},
  //       description: 'Microsoft Surface Laptop 4 - 256GB, Platinum.',
  //     ),
  //     // Other variations...
  //   ],
  // ),

  //];
}

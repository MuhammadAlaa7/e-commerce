// import 'package:store/features/shop/models/brand_model.dart';
// import 'package:store/features/shop/models/product_attributes_model.dart';
// import 'package:store/features/shop/models/product_model.dart';
// import 'package:store/features/shop/models/product_variation_model.dart';
// import 'package:store/utils/constants/image_strings.dart';

// class DM{


// // *********************************************************



// // --- list of All Products in the store ------

//   static final List<ProductModel> products = [
//     ProductModel(
//       id: '001',
//       title: 'Green Nike sports shoe',
//       stock: 15,
//       price: 135,
//       salePrice: 30,
//       thumbnail: CImages.productImage1,
//       productType: 'shoes',
//       sku: 'ABR4568',
//       categoryId: '1',
//       isFeatured: true,
//       description: 'Green Nike sports shoe',
//       brand: BrandModel(
//         id: '1',
//         image: CImages.nikeLogo,
//         name: 'Nike',
//         productsCount: 265,
//         isFeatured: true,
//       ),
//       images: [
//         CImages.productImage1,
//         CImages.productImage23,
//         CImages.productImage21,
//         CImages.productImage9,
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
//         ProductVariationModel(
//           id: '2',
//           stock: 15,
//           price: 132,
//           salePrice: 120,
//           image: CImages.productImage23,
//           description:
//               'This is a product description for Black Nike sports shoe.',
//           attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
//         ),
//         ProductVariationModel(
//           id: '3',
//           stock: 0,
//           price: 234,
//           image: CImages.productImage23,
//           attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
//         ),
//         ProductVariationModel(
//           id: '4',
//           stock: 222,
//           price: 232,
//           salePrice: 120,
//           image: CImages.productImage1,
//           attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
//         ),
//         ProductVariationModel(
//           id: '5',
//           stock: 0,
//           price: 334,
//           image: CImages.productImage21,
//           attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
//         ),
//         ProductVariationModel(
//           id: '6',
//           stock: 11,
//           price: 332,
//           image: CImages.productImage21,
//           attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
//         ),
//       ],
//     ),
//     ProductModel(
//       id: '002',
//       title: 'Blue T-shirt for all ages',
//       stock: 15,
//       price: 35,
//       isFeatured: true,
//       thumbnail: CImages.productImage69,
//       description:
//           'This is a Product description for Blue Nike Sleeve Less vest. There are more things that can be added but i am just practicing and nothing else..',
//       brand: BrandModel(id: '6', image: CImages.zaraLogo, name: 'ZARA'),
//       images: [
//         CImages.productImage68,
//         CImages.productImage69,
//         CImages.productImage5
//       ],
//       salePrice: 30,
//       sku: 'ABR4568',
//       categoryId: '16',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
//         ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
//       ],
//       productType: 'shirt',
//     ),
//     ProductModel(
//       id: '003',
//       title: 'Leather brown Jacket',
//       stock: 15,
//       price: 38000,
//       isFeatured: false,
//       thumbnail: CImages.productImage64,
//       description:
//           'This is a Product description for Leather brown Jacket. There are more things that can be added but i am just practicing and nothing else.',
//       brand: BrandModel(id: '6', image: CImages.zaraLogo, name: 'ZARA'),
//       images: [
//         CImages.productImage64,
//         CImages.productImage65,
//         CImages.productImage66,
//         CImages.productImage67
//       ],
//       salePrice: 30,
//       sku: 'ABR4568',
//       categoryId: '16',
//       productAttributes: [
//         ProductAttributeModel(name: 'size', values: ['EU 34', 'EU 32']),
//         ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
//       ],
//       productType: 'Jacket',
//     ),
//     ProductModel(
//       id: '004',
//       title: '4 Color collar t-shirt dry fit',
//       stock: 15,
//       price: 135,
//       isFeatured: false,
//       thumbnail: CImages.productImage60,
//       description:
//           'This is a Product description for 4 Color collar t-shirt dry fit. There are more things that can be added but its just a demo and nothing else.',
//       brand: BrandModel(id: '6', image: CImages.zaraLogo, name: 'ZARA'),
//       images: [
//         CImages.productImage60,
//         CImages.productImage61,
//         CImages.productImage62,
//         CImages.productImage63
//       ],
//       salePrice: 30,
//       sku: 'ABR4568',
//       categoryId: '16',
//       productAttributes: [
//         ProductAttributeModel(
//             name: 'size', values: ['EU 30', 'EU 32', 'EU 34']),
//         ProductAttributeModel(
//             name: 'Color', values: ['Red', 'Yellow', 'Green', 'Blue']),
//       ],
//       productType: 'shirt',
//       productVariations: [
//         ProductVariationModel(
//           id: '1',
//           stock: 34,
//           price: 134,
//           image: CImages.productImage60,
//           attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
//           description:
//               'This is a product description for 4 color collar t-shirt dry fit',
//         ),
//         ProductVariationModel(
//           id: '2',
//           stock: 15,
//           price: 132,
//           image: CImages.productImage60,
//           attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
//         ),
//         ProductVariationModel(
//           id: '3',
//           stock: 0,
//           price: 234,
//           image: CImages.productImage61,
//           attributeValues: {'Color': 'Yellow', 'Size': 'EU 34'},
//         ),
//         ProductVariationModel(
//           id: '4',
//           stock: 222,
//           price: 232,
//           image: CImages.productImage61,
//           attributeValues: {'Color': 'Yellow', 'Size': 'EU 32'},
//         ),
//         ProductVariationModel(
//           id: '5',
//           stock: 0,
//           price: 334,
//           image: CImages.productImage62,
//           attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
//         ),
//         ProductVariationModel(
//           id: '6',
//           stock: 11,
//           price: 332,
//           image: CImages.productImage62,
//           attributeValues: {'Color': 'Green', 'Size': 'EU 30'},
//         ),
//         ProductVariationModel(
//           id: '7',
//           stock: 0,
//           price: 334,
//           image: CImages.productImage63,
//           attributeValues: {'Color': 'Blue', 'Size': 'EU 30'},
//         ),
//         ProductVariationModel(
//           id: '8',
//           stock: 11,
//           price: 332,
//           image: CImages.productImage63,
//           attributeValues: {'Color': 'Blue', 'Size': 'EU 34'},
//         ),
//       ],
//     ),

//     ProductModel(
//       id: '005',
//       title: 'Nike Air Jordan Shoes',
//       stock: 15,
//       price: 35,
//       isFeatured: false,
//       thumbnail: CImages.productImage10,
//       description:
//           'Nike Air Jordan Shoes for running. Quality product, Long Lasting',
//       brand: BrandModel(
//           id: '1',
//           image: CImages.nikeLogo,
//           name: 'Nike',
//           productsCount: 265,
//           isFeatured: true),
//       images: [
//         CImages.productImage7,
//         CImages.productImage8,
//         CImages.productImage9,
//         CImages.productImage10
//       ],
//       salePrice: 50,
//       sku: 'ABR4568',
//       categoryId: '8',
//       productType: 'shoes',
//       productAttributes: [
//         ProductAttributeModel(
//             name: 'Color', values: ['Orange', 'Black', 'Brown']),
//         ProductAttributeModel(
//             name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
//       ],
//       productVariations: [
//         ProductVariationModel(
//           id: '1',
//           stock: 16,
//           price: 36,
//           salePrice: 12,
//           image: CImages.productImage5,
//           attributeValues: {'Color': 'Orange', 'Size': 'EU 34'},
//         ),
//         ProductVariationModel(
//           id: '2',
//           stock: 15,
//           price: 35,
//           image: CImages.productImage7,
//           attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
//         ),
//         ProductVariationModel(
//           id: '3',
//           stock: 14,
//           price: 34,
//           image: CImages.productImage8,
//           attributeValues: {'Color': 'Brown', 'Size': 'EU 34'},
//         ),
//         ProductVariationModel(
//           id: '4',
//           stock: 15,
//           price: 35,
//           image: CImages.productImage7,
//           attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
//         ),
//         ProductVariationModel(
//           id: '5',
//           stock: 12,
//           price: 32,
//           image: CImages.productImage5,
//           attributeValues: {'Color': 'Brown', 'Size': 'EU 32'},
//         ),
//         ProductVariationModel(
//           id: '6',
//           stock: 11,
//           price: 31,
//           image: CImages.productImage8,
//           attributeValues: {'Color': 'Orange', 'Size': 'EU 32'},
//         ),
//       ],
//     ),
//     ProductModel(
//       id: '006',
//       title: 'SAMSUNG Galaxy S9 (Pink, 64 GB) (4 GB RAM)',
//       stock: 15,
//       price: 750,
//       isFeatured: false,
//       thumbnail: CImages.productImage11,
//       description:
//           'SAMSUNG Galaxy S9 (Pink, 64 GB) (4 GB RAM), Long Battery timing',
//       brand: BrandModel(id: '7', image: CImages.appleLogo, name: 'Samsung'),
//       images: [
//         CImages.productImage11,
//         CImages.productImage12,
//         CImages.productImage13,
//         CImages.productImage12
//       ],
//       salePrice: 650,
//       sku: 'ABR45681',
//       categoryId: '2',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
//         ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
//       ],
//       productType: 'mobile',
//     ),
//     ProductModel(
//       id: '007',
//       title: 'TOMI Dog food',
//       stock: 15,
//       price: 20,
//       isFeatured: false,
//       thumbnail: CImages.productImage18,
//       description:
//           'This is a Product description for TOMI Dog food. There are more things that can be added but i as just practicing and nothing else..',
//       brand: BrandModel(id: '7', image: CImages.appleLogo, name: 'Toni'),
//       salePrice: 10,
//       sku: 'ABR4568',
//       categoryId: '4',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
//         ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
//       ],
//       productType: 'food',
//     ),

//     ProductModel(
//       id: '008',
//       title: 'Nike Air Jordan 19 Blue',
//       stock: 15,
//       price: 468,
//       isFeatured: false,
//       thumbnail: CImages.productImage19,
//       description:
//           'This is a Product description for Nike Air Jordon. There are more things that can be added but i am just practicing and nothing else.',
//       brand: BrandModel(id: '1', image: CImages.nikeLogo, name: 'Nike'),
//       images: [
//         CImages.productImage19,
//         CImages.productImage20,
//         CImages.productImage21,
//         CImages.productImage22
//       ],
//       salePrice: 200,
//       productType: 'shoe',
//       sku: 'ABR4568',
//       categoryId: '3',
//       productAttributes: [
//         ProductAttributeModel(name: 'Size', values: ['EU 34', 'EU 32']),
//         ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
//       ],
//     ),

//     ProductModel(
//       id: '010',
//       title: 'Adidas Football',
//       stock: 20,
//       price: 50,
//       salePrice: 45,
//       thumbnail: CImages.productImage28,
//       productType: 'sports',
//       sku: 'AFB1234',
//       categoryId: '5',
//       isFeatured: true,
//       description: 'High-quality Adidas football, perfect for all terrains.',
//       brand: BrandModel(
//         id: '2',
//         image: CImages.adidasLogo,
//         name: 'Adidas',
//         productsCount: 120,
//         isFeatured: true,
//       ),
//       images: [
//         CImages.productImage28,
//         CImages.productImage29,
//         CImages.productImage30,
//       ],
//       productAttributes: [
//         ProductAttributeModel(name: 'Color', values: ['White', 'Black']),
//         ProductAttributeModel(name: 'Size', values: ['Standard']),
//       ],
//       productVariations: [
//         ProductVariationModel(
//           id: '1',
//           stock: 10,
//           price: 50,
//           salePrice: 45,
//           image: CImages.productImage28,
//           attributeValues: {'Color': 'White', 'Size': 'Standard'},
//           description: 'Adidas football, white variant.',
//         ),
//         ProductVariationModel(
//           id: '2',
//           stock: 10,
//           price: 50,
//           salePrice: 45,
//           image: CImages.productImage28,
//           attributeValues: {'Color': 'Black', 'Size': 'Standard'},
//           description: 'Adidas football, black variant.',
//         ),
//       ],
//     ),
//     ProductModel(
//       id: '011',
//       title: 'Acer Laptop - Model 1',
//       stock: 5,
//       price: 1200,
//       salePrice: 1150,
//       thumbnail: CImages.productImage47,
//       productType: 'electronics',
//       sku: 'ALP1234',
//       categoryId: '6',
//       isFeatured: true,
//       description: 'Acer Laptop, powerful and portable with latest specs.',
//       brand: BrandModel(
//         id: '3',
//         image: CImages.acerLogo,
//         name: 'Acer',
//         productsCount: 80,
//         isFeatured: true,
//       ),
//       images: [
//         CImages.productImage47,
//         CImages.productImage48,
//         CImages.productImage49,
//         CImages.productImage50,
//       ],
//       productAttributes: [
//         ProductAttributeModel(name: 'Color', values: ['Black']),
//         ProductAttributeModel(name: 'RAM', values: ['8GB', '16GB']),
//       ],
//       productVariations: [
//         ProductVariationModel(
//           id: '1',
//           stock: 2,
//           price: 1200,
//           salePrice: 1150,
//           image: CImages.productImage47,
//           attributeValues: {'Color': 'Black', 'RAM': '8GB'},
//           description: 'Acer Laptop with 8GB RAM, black color.',
//         ),
//         ProductVariationModel(
//           id: '2',
//           stock: 3,
//           price: 1300,
//           salePrice: 1250,
//           image: CImages.productImage48,
//           attributeValues: {'Color': 'Black', 'RAM': '16GB'},
//           description: 'Acer Laptop with 16GB RAM, black color.',
//         ),
//       ],
//     ),
//     ProductModel(
//       id: '012',
//       title: 'Bedroom Bed with Comforter',
//       stock: 7,
//       price: 950,
//       salePrice: 900,
//       thumbnail: CImages.productImage46,
//       productType: 'furniture',
//       sku: 'BB1234',
//       categoryId: '7',
//       isFeatured: false,
//       description:
//           'Elegant bedroom bed with a comforter, made from high-quality materials.',
//       brand: BrandModel(
//         id: '4',
//         image: CImages.ikeaLogo,
//         name: 'IKEA',
//         productsCount: 40,
//         isFeatured: false,
//       ),
//       images: [
//         CImages.productImage43,
//         CImages.productImage44,
//         CImages.productImage45,
//         CImages.productImage46,
//       ],
//       productAttributes: [
//         ProductAttributeModel(
//             name: 'Color', values: ['Black', 'Grey', 'Brown']),
//         ProductAttributeModel(name: 'Size', values: ['King', 'Queen']),
//       ],
//       productVariations: [
//         ProductVariationModel(
//           id: '1',
//           stock: 3,
//           price: 950,
//           salePrice: 900,
//           image: CImages.productImage43,
//           attributeValues: {'Color': 'Black', 'Size': 'King'},
//           description: 'Black king-size bed with comforter.',
//         ),
//         ProductVariationModel(
//           id: '2',
//           stock: 4,
//           price: 950,
//           salePrice: 900,
//           image: CImages.productImage44,
//           attributeValues: {'Color': 'Grey', 'Size': 'Queen'},
//           description: 'Grey queen-size bed with comforter.',
//         ),
//       ],
//     ),
//     ProductModel(
//       id: '013',
//       title: 'Leather Jacket - Black',
//       stock: 20,
//       price: 250,
//       salePrice: 230,
//       thumbnail: CImages.productImage65,
//       productType: 'jacket',
//       sku: 'LJ1234',
//       categoryId: '9',
//       isFeatured: true,
//       description: 'Stylish black leather jacket, perfect for winter.',
//       brand: BrandModel(
//         id: '5',
//         image: CImages.zaraLogo,
//         name: 'ZARA',
//         productsCount: 150,
//         isFeatured: true,
//       ),
//       images: [
//         CImages.productImage64,
//         CImages.productImage65,
//         CImages.productImage66,
//         CImages.productImage67,
//       ],
//       productAttributes: [
//         ProductAttributeModel(name: 'Color', values: ['Black', 'Brown']),
//         ProductAttributeModel(name: 'Size', values: ['M', 'L', 'XL']),
//       ],
//       productVariations: [
//         ProductVariationModel(
//           id: '1',
//           stock: 10,
//           price: 250,
//           salePrice: 230,
//           image: CImages.productImage65,
//           attributeValues: {'Color': 'Black', 'Size': 'M'},
//           description: 'Black leather jacket, medium size.',
//         ),
//         ProductVariationModel(
//           id: '2',
//           stock: 10,
//           price: 250,
//           salePrice: 230,
//           image: CImages.productImage66,
//           attributeValues: {'Color': 'Brown', 'Size': 'L'},
//           description: 'Brown leather jacket, large size.',
//         ),
//       ],
//     ),
//     ProductModel(
//       id: '014',
//       title: 'Office Desk - Modern Style',
//       stock: 12,
//       price: 300,
//       salePrice: 280,
//       thumbnail: CImages.productImage41,
//       productType: 'furniture',
//       sku: 'OD1234',
//       categoryId: '10',
//       isFeatured: false,
//       description:
//           'Modern office desk with sleek design, suitable for all workspaces.',
//       brand: BrandModel(
//         id: '6',
//         image: CImages.ikeaLogo,
//         name: 'IKEA',
//         productsCount: 75,
//         isFeatured: false,
//       ),
//       images: [
//         CImages.productImage41,
//         CImages.productImage42,
//         CImages.productImage40,
//       ],
//       productAttributes: [
//         ProductAttributeModel(name: 'Color', values: ['White', 'Black']),
//         ProductAttributeModel(name: 'Material', values: ['Wood', 'Metal']),
//       ],
//       productVariations: [
//         ProductVariationModel(
//           id: '1',
//           stock: 6,
//           price: 300,
//           salePrice: 280,
//           image: CImages.productImage41,
//           attributeValues: {'Color': 'White', 'Material': 'Wood'},
//           description: 'White wooden office desk.',
//         ),
//         ProductVariationModel(
//           id: '2',
//           stock: 6,
//           price: 300,
//           salePrice: 280,
//           image: CImages.productImage42,
//           attributeValues: {'Color': 'Black', 'Material': 'Metal'},
//           description: 'Black metal office desk.',
//         ),
//       ],
//     ),
//     // Product 15
//     ProductModel(
//       id: '015',
//       title: 'Apple iPhone 14 Pro',
//       stock: 50,
//       price: 1200,
//       salePrice: 1100,
//       thumbnail: CImages.productImage52,
//       productType: 'mobile',
//       sku: 'APLIP0014P',
//       categoryId: '14',
//       isFeatured: true,
//       description:
//           'Apple iPhone 14 Pro with advanced features, high performance, and sleek design.',
//       brand: BrandModel(
//         id: '7',
//         image: CImages.appleLogo,
//         name: 'Apple',
//         productsCount: 100,
//         isFeatured: true,
//       ),
//       images: [
//         CImages.productImage52,
//         CImages.productImage53,
//         CImages.productImage51,
//       ],
//       productAttributes: [
//         ProductAttributeModel(name: 'Storage', values: ['128GB', '256GB']),
//         ProductAttributeModel(name: 'Color', values: ['Silver', 'Black']),
//       ],
//       productVariations: [
//         ProductVariationModel(
//           id: '1',
//           stock: 30,
//           price: 1200,
//           salePrice: 1100,
//           image: CImages.productImage52,
//           attributeValues: {'Storage': '128GB', 'Color': 'Silver'},
//         ),
//         ProductVariationModel(
//           id: '2',
//           stock: 20,
//           price: 1200,
//           salePrice: 1100,
//           image: CImages.productImage51,
//           attributeValues: {'Storage': '256GB', 'Color': 'Black'},
//         ),
//       ],
//     ),

//     // Product 16
//     ProductModel(
//       id: '016',
//       title: 'Acer Laptop',
//       stock: 30,
//       price: 850,
//       salePrice: 800,
//       thumbnail: CImages.productImage30,
//       productType: 'electronics',
//       sku: 'ACLPT001',
//       categoryId: '15',
//       isFeatured: false,
//       description:
//           'High-performance Acer laptop with latest specifications for professional use.',
//       brand: BrandModel(
//         id: '8',
//         image: CImages.acerLogo,
//         name: 'Acer',
//         productsCount: 150,
//         isFeatured: true,
//       ),
//       images: [
//         CImages.productImage29,
//         CImages.productImage30,
//       ],
//       productAttributes: [
//         ProductAttributeModel(name: 'RAM', values: ['8GB', '16GB']),
//         ProductAttributeModel(name: 'Color', values: ['Silver', 'Black']),
//       ],
//       productVariations: [
//         ProductVariationModel(
//           id: '1',
//           stock: 20,
//           price: 850,
//           salePrice: 800,
//           image: CImages.productImage29,
//           attributeValues: {'RAM': '8GB', 'Color': 'Silver'},
//         ),
//         ProductVariationModel(
//           id: '2',
//           stock: 10,
//           price: 950,
//           salePrice: 900,
//           image: CImages.productImage30,
//           attributeValues: {'RAM': '16GB', 'Color': 'Black'},
//         ),
//       ],
//     ),
// //     // Product 17
// //     ProductModel(
// //       id: '017',
// //       title: 'Sony 4K Ultra HD TV',
// //       stock: 20,
// //       price: 1000,
// //       salePrice: 900,
// //       thumbnail: CImages.productImage48,
// //       productType: 'electronics',
// //       sku: 'SN4KTV001',
// //       categoryId: '16',
// //       isFeatured: true,
// //       description:
// //           'Sony 4K Ultra HD TV with HDR support, delivering crystal clear picture quality.',
// //       brand: BrandModel(
// //         id: '9',
// //         image: CImages.sonyLogo,
// //         name: 'Sony',
// //         productsCount: 120,
// //         isFeatured: true,
// //       ),
// //       images: [
// //         CImages.productImage48,
// //         CImages.productImage49,
// //       ],
// //       productAttributes: [
// //         ProductAttributeModel(name: 'Size', values: ['55 inch', '65 inch']),
// //         ProductAttributeModel(name: 'Resolution', values: ['4K']),
// //       ],
// //       productVariations: [
// //         ProductVariationModel(
// //           id: '1',
// //           stock: 10,
// //           price: 1000,
// //           salePrice: 900,
// //           image: CImages.productImage48,
// //           attributeValues: {'Size': '55 inch', 'Resolution': '4K'},
// //         ),
// //         ProductVariationModel(
// //           id: '2',
// //           stock: 10,
// //           price: 1200,
// //           salePrice: 1100,
// //           image: CImages.productImage49,
// //           attributeValues: {'Size': '65 inch', 'Resolution': '4K'},
// //         ),
// //       ],
// //     ),

// // // Product 18
// //     ProductModel(
// //       id: '018',
// //       title: 'Canon EOS 5D Camera',
// //       stock: 15,
// //       price: 2500,
// //       salePrice: 2300,
// //       thumbnail: CImages.productImage45,
// //       productType: 'electronics',
// //       sku: 'CANEOS5D001',
// //       categoryId: '17',
// //       isFeatured: true,
// //       description:
// //           'Professional-grade Canon EOS 5D DSLR camera with full-frame sensor.',
// //       brand: BrandModel(
// //         id: '10',
// //         image: CImages.canonLogo,
// //         name: 'Canon',
// //         productsCount: 80,
// //         isFeatured: true,
// //       ),
// //       images: [
// //         CImages.productImage45,
// //         CImages.productImage46,
// //         CImages.productImage47,
// //       ],
// //       productAttributes: [
// //         ProductAttributeModel(name: 'Lens', values: ['24-70mm', '50mm']),
// //         ProductAttributeModel(name: 'Resolution', values: ['30.4MP']),
// //       ],
// //       productVariations: [
// //         ProductVariationModel(
// //           id: '1',
// //           stock: 10,
// //           price: 2500,
// //           salePrice: 2300,
// //           image: CImages.productImage45,
// //           attributeValues: {'Lens': '24-70mm', 'Resolution': '30.4MP'},
// //         ),
// //         ProductVariationModel(
// //           id: '2',
// //           stock: 5,
// //           price: 2000,
// //           salePrice: 1800,
// //           image: CImages.productImage46,
// //           attributeValues: {'Lens': '50mm', 'Resolution': '30.4MP'},
// //         ),
// //       ],
// //     ),

// // // Product 19
// //     ProductModel(
// //       id: '019',
// //       title: 'Dell XPS 15 Laptop',
// //       stock: 25,
// //       price: 1500,
// //       salePrice: 1400,
// //       thumbnail: CImages.productImage50,
// //       productType: 'electronics',
// //       sku: 'DLXPS15001',
// //       categoryId: '18',
// //       isFeatured: true,
// //       description:
// //           'Dell XPS 15 laptop with 10th Gen Intel Core i7, 16GB RAM, and 512GB SSD.',
// //       brand: BrandModel(
// //         id: '11',
// //         image: CImages.dellLogo,
// //         name: 'Dell',
// //         productsCount: 130,
// //         isFeatured: true,
// //       ),
// //       images: [
// //         CImages.productImage50,
// //         CImages.productImage51,
// //       ],
// //       productAttributes: [
// //         ProductAttributeModel(name: 'RAM', values: ['16GB']),
// //         ProductAttributeModel(name: 'Storage', values: ['512GB SSD']),
// //         ProductAttributeModel(name: 'Color', values: ['Silver', 'Black']),
// //       ],
// //       productVariations: [
// //         ProductVariationModel(
// //           id: '1',
// //           stock: 15,
// //           price: 1500,
// //           salePrice: 1400,
// //           image: CImages.productImage50,
// //           attributeValues: {
// //             'RAM': '16GB',
// //             'Storage': '512GB SSD',
// //             'Color': 'Silver'
// //           },
// //         ),
// //         ProductVariationModel(
// //           id: '2',
// //           stock: 10,
// //           price: 1500,
// //           salePrice: 1400,
// //           image: CImages.productImage51,
// //           attributeValues: {
// //             'RAM': '16GB',
// //             'Storage': '512GB SSD',
// //             'Color': 'Black'
// //           },
// //         ),
// //       ],
// //     ),

// // // Product 20
// //     ProductModel(
// //       id: '020',
// //       title: 'Samsung Galaxy Watch 6',
// //       stock: 40,
// //       price: 300,
// //       salePrice: 280,
// //       thumbnail: CImages.productImage54,
// //       productType: 'wearable',
// //       sku: 'SGW6001',
// //       categoryId: '19',
// //       isFeatured: true,
// //       description:
// //           'Samsung Galaxy Watch 6 with advanced health tracking and AMOLED display.',
// //       brand: BrandModel(
// //         id: '3',
// //         image: CImages.samsungLogo,
// //         name: 'Samsung',
// //         productsCount: 50,
// //         isFeatured: true,
// //       ),
// //       images: [
// //         CImages.productImage54,
// //         CImages.productImage55,
// //       ],
// //       productAttributes: [
// //         ProductAttributeModel(name: 'Size', values: ['40mm', '44mm']),
// //         ProductAttributeModel(name: 'Color', values: ['Black', 'Silver']),
// //       ],
// //       productVariations: [
// //         ProductVariationModel(
// //           id: '1',
// //           stock: 20,
// //           price: 300,
// //           salePrice: 280,
// //           image: CImages.productImage54,
// //           attributeValues: {'Size': '40mm', 'Color': 'Black'},
// //         ),
// //         ProductVariationModel(
// //           id: '2',
// //           stock: 20,
// //           price: 300,
// //           salePrice: 280,
// //           image: CImages.productImage55,
// //           attributeValues: {'Size': '44mm', 'Color': 'Silver'},
// //         ),
// //       ],
// //     ),

// // // Product 21
// //     ProductModel(
// //       id: '021',
// //       title: 'Bose Noise Cancelling Headphones 700',
// //       stock: 35,
// //       price: 400,
// //       salePrice: 350,
// //       thumbnail: CImages.productImage56,
// //       productType: 'audio',
// //       sku: 'BNC7001',
// //       categoryId: '20',
// //       isFeatured: true,
// //       description:
// //           'Bose Noise Cancelling Headphones 700 with 11 levels of noise cancellation.',
// //       brand: BrandModel(
// //         id: '12',
// //         image: CImages.boseLogo,
// //         name: 'Bose',
// //         productsCount: 70,
// //         isFeatured: true,
// //       ),
// //       images: [
// //         CImages.productImage56,
// //         CImages.productImage57,
// //       ],
// //       productAttributes: [
// //         ProductAttributeModel(name: 'Color', values: ['Black', 'Silver']),
// //       ],
// //       productVariations: [
// //         ProductVariationModel(
// //           id: '1',
// //           stock: 20,
// //           price: 400,
// //           salePrice: 350,
// //           image: CImages.productImage56,
// //           attributeValues: {'Color': 'Black'},
// //         ),
// //         ProductVariationModel(
// //           id: '2',
// //           stock: 15,
// //           price: 400,
// //           salePrice: 350,
// //           image: CImages.productImage57,
// //           attributeValues: {'Color': 'Silver'},
// //         ),
// //       ],
// //     ),

// // // Product 22
// //     ProductModel(
// //       id: '022',
// //       title: 'GoPro HERO10 Black',
// //       stock: 50,
// //       price: 500,
// //       salePrice: 450,
// //       thumbnail: CImages.productImage58,
// //       productType: 'camera',
// //       sku: 'GPHEROB001',
// //       categoryId: '21',
// //       isFeatured: true,
// //       description:
// //           'GoPro HERO10 Black with 5.3K video resolution and 23MP photos.',
// //       brand: BrandModel(
// //         id: '13',
// //         image: CImages.goproLogo,
// //         name: 'GoPro',
// //         productsCount: 40,
// //         isFeatured: true,
// //       ),
// //       images: [
// //         CImages.productImage58,
// //         CImages.productImage59,
// //       ],
// //       productAttributes: [
// //         ProductAttributeModel(name: 'Resolution', values: ['5.3K']),
// //         ProductAttributeModel(name: 'Color', values: ['Black']),
// //       ],
// //       productVariations: [
// //         ProductVariationModel(
// //           id: '1',
// //           stock: 50,
// //           price: 500,
// //           salePrice: 450,
// //           image: CImages.productImage58,
// //           attributeValues: {'Resolution': '5.3K', 'Color': 'Black'},
// //         ),
// //       ],
// //     ),

// // // Product 23
// //     ProductModel(
// //       id: '023',
// //       title: 'Apple MacBook Air M2',
// //       stock: 30,
// //       price: 1100,
// //       salePrice: 1050,
// //       thumbnail: CImages.productImage60,
// //       productType: 'laptop',
// //       sku: 'AMACBM2001',
// //       categoryId: '22',
// //       isFeatured: true,
// //       description: 'Apple MacBook Air with M2 chip, 8GB RAM, and 256GB SSD.',
// //       brand: BrandModel(
// //         id: '1',
// //         image: CImages.appleLogo,
// //         name: 'Apple',
// //         productsCount: 90,
// //         isFeatured: true,
// //       ),
// //       images: [
// //         CImages.productImage60,
// //         CImages.productImage61,
// //       ],
// //       productAttributes: [
// //         ProductAttributeModel(name: 'RAM', values: ['8GB']),
// //         ProductAttributeModel(name: 'Storage', values: ['256GB SSD']),
// //         ProductAttributeModel(name: 'Color', values: ['Space Gray', 'Silver']),
// //       ],
// //       productVariations: [
// //         ProductVariationModel(
// //           id: '1',
// //           stock: 15,
// //           price: 1100,
// //           salePrice: 1050,
// //           image: CImages.productImage60,
// //           attributeValues: {
// //             'RAM': '8GB',
// //             'Storage': '256GB SSD',
// //             'Color': 'Space Gray'
// //           },
// //         ),
// //         ProductVariationModel(
// //           id: '2',
// //           stock: 15,
// //           price: 1100,
// //           salePrice: 1050,
// //           image: CImages.productImage61,
// //           attributeValues: {
// //             'RAM': '8GB',
// //             'Storage': '256GB SSD',
// //             'Color': 'Silver'
// //           },
// //         ),
// //       ],
// //     ),
// // // Product 24
// //     ProductModel(
// //       id: '024',
// //       title: 'Samsung QLED 8K TV',
// //       stock: 10,
// //       price: 3000,
// //       salePrice: 2800,
// //       thumbnail: CImages.productImage62,
// //       productType: 'electronics',
// //       sku: 'S8KTV001',
// //       categoryId: '23',
// //       isFeatured: true,
// //       description:
// //           'Samsung QLED 8K TV with Quantum Processor 8K and Infinity Screen.',
// //       brand: BrandModel(
// //         id: '3',
// //         image: CImages.samsungLogo,
// //         name: 'Samsung',
// //         productsCount: 50,
// //         isFeatured: true,
// //       ),
// //       images: [
// //         CImages.productImage62,
// //         CImages.productImage63,
// //       ],
// //       productAttributes: [
// //         ProductAttributeModel(name: 'Size', values: ['65 inch', '75 inch']),
// //         ProductAttributeModel(name: 'Resolution', values: ['8K']),
// //       ],
// //       productVariations: [
// //         ProductVariationModel(
// //           id: '1',
// //           stock: 5,
// //           price: 3000,
// //           salePrice: 2800,
// //           image: CImages.productImage62,
// //           attributeValues: {'Size': '65 inch', 'Resolution': '8K'},
// //         ),
// //         ProductVariationModel(
// //           id: '2',
// //           stock: 5,
// //           price: 3500,
// //           salePrice: 3300,
// //           image: CImages.productImage63,
// //           attributeValues: {'Size': '75 inch', 'Resolution': '8K'},
// //         ),
// //       ],
// //     ),

// // // Product 25
// //     ProductModel(
// //       id: '025',
// //       title: 'Microsoft Surface Pro 9',
// //       stock: 20,
// //       price: 1300,
// //       salePrice: 1200,
// //       thumbnail: CImages.productImage64,
// //       productType: 'tablet',
// //       sku: 'MSP9001',
// //       categoryId: '24',
// //       isFeatured: true,
// //       description:
// //           'Microsoft Surface Pro 9 with 11th Gen Intel Core i5, 8GB RAM, and 256GB SSD.',
// //       brand: BrandModel(
// //         id: '14',
// //         image: CImages.microsoftLogo,
// //         name: 'Microsoft',
// //         productsCount: 60,
// //         isFeatured: true,
// //       ),
// //       images: [
// //         CImages.productImage64,
// //         CImages.productImage65,
// //       ],
// //       productAttributes: [
// //         ProductAttributeModel(name: 'RAM', values: ['8GB']),
// //         ProductAttributeModel(name: 'Storage', values: ['256GB SSD']),
// //         ProductAttributeModel(name: 'Color', values: ['Platinum', 'Black']),
// //       ],
// //       productVariations: [
// //         ProductVariationModel(
// //           id: '1',
// //           stock: 10,
// //           price: 1300,
// //           salePrice: 1200,
// //           image: CImages.productImage64,
// //           attributeValues: {
// //             'RAM': '8GB',
// //             'Storage': '256GB SSD',
// //             'Color': 'Platinum'
// //           },
// //         ),
// //         ProductVariationModel(
// //           id: '2',
// //           stock: 10,
// //           price: 1300,
// //           salePrice: 1200,
// //           image: CImages.productImage65,
// //           attributeValues: {
// //             'RAM': '8GB',
// //             'Storage': '256GB SSD',
// //             'Color': 'Black'
// //           },
// //         ),
// //       ],
// //     ),

// // // Product 26
// //     ProductModel(
// //       id: '026',
// //       title: 'Sony PlayStation 5',
// //       stock: 50,
// //       price: 500,
// //       salePrice: 480,
// //       thumbnail: CImages.productImage66,
// //       productType: 'gaming',
// //       sku: 'PS5001',
// //       categoryId: '25',
// //       isFeatured: true,
// //       description:
// //           'Sony PlayStation 5 with ultra-high-speed SSD and ray tracing support.',
// //       brand: BrandModel(
// //         id: '9',
// //         image: CImages.sonyLogo,
// //         name: 'Sony',
// //         productsCount: 120,
// //         isFeatured: true,
// //       ),
// //       images: [
// //         CImages.productImage66,
// //         CImages.productImage67,
// //       ],
// //       productAttributes: [
// //         ProductAttributeModel(name: 'Storage', values: ['825GB']),
// //         ProductAttributeModel(name: 'Color', values: ['White']),
// //       ],
// //       productVariations: [
// //         ProductVariationModel(
// //           id: '1',
// //           stock: 50,
// //           price: 500,
// //           salePrice: 480,
// //           image: CImages.productImage66,
// //           attributeValues: {'Storage': '825GB', 'Color': 'White'},
// //         ),
// //       ],
// //     ),

// // // Product 27
// //     ProductModel(
// //       id: '027',
// //       title: 'Amazon Echo Dot 5th Gen',
// //       stock: 100,
// //       price: 50,
// //       salePrice: 45,
// //       thumbnail: CImages.productImage68,
// //       productType: 'smart_home',
// //       sku: 'AED5001',
// //       categoryId: '26',
// //       isFeatured: true,
// //       description:
// //           'Amazon Echo Dot 5th Gen with Alexa voice assistant and improved sound.',
// //       brand: BrandModel(
// //         id: '15',
// //         image: CImages.amazonLogo,
// //         name: 'Amazon',
// //         productsCount: 40,
// //         isFeatured: true,
// //       ),
// //       images: [
// //         CImages.productImage68,
// //         CImages.productImage69,
// //       ],
// //       productAttributes: [
// //         ProductAttributeModel(
// //             name: 'Color', values: ['Charcoal', 'Glacier White']),
// //       ],
// //       productVariations: [
// //         ProductVariationModel(
// //           id: '1',
// //           stock: 50,
// //           price: 50,
// //           salePrice: 45,
// //           image: CImages.productImage68,
// //           attributeValues: {'Color': 'Charcoal'},
// //         ),
// //         ProductVariationModel(
// //           id: '2',
// //           stock: 50,
// //           price: 50,
// //           salePrice: 45,
// //           image: CImages.productImage69,
// //           attributeValues: {'Color': 'Glacier White'},
// //         ),
// //       ],
// //     ),

// // // Product 28
// //     ProductModel(
// //       id: '028',
// //       title: 'DJI Mini 3 Pro Drone',
// //       stock: 30,
// //       price: 1000,
// //       salePrice: 950,
// //       thumbnail: CImages.productImage70,
// //       productType: 'drone',
// //       sku: 'DJM3P001',
// //       categoryId: '27',
// //       isFeatured: true,
// //       description:
// //           'DJI Mini 3 Pro Drone with 4K camera, obstacle sensing, and extended battery life.',
// //       brand: BrandModel(
// //         id: '16',
// //         image: CImages.djiLogo,
// //         name: 'DJI',
// //         productsCount: 20,
// //         isFeatured: true,
// //       ),
// //       images: [
// //         CImages.productImage70,
// //         CImages.productImage71,
// //       ],
// //       productAttributes: [
// //         ProductAttributeModel(name: 'Camera', values: ['4K']),
// //         ProductAttributeModel(name: 'Color', values: ['Gray']),
// //       ],
// //       productVariations: [
// //         ProductVariationModel(
// //           id: '1',
// //           stock: 30,
// //           price: 1000,
// //           salePrice: 950,
// //           image: CImages.productImage70,
// //           attributeValues: {'Camera': '4K', 'Color': 'Gray'},
// //         ),
// //       ],
// //     ),

// // // Product 29
// //     ProductModel(
// //       id: '029',
// //       title: 'Fitbit Charge 5',
// //       stock: 60,
// //       price: 180,
// //       salePrice: 170,
// //       thumbnail: CImages.productImage72,
// //       productType: 'wearable',
// //       sku: 'FBCH5001',
// //       categoryId: '28',
// //       isFeatured: true,
// //       description:
// //           'Fitbit Charge 5 with built-in GPS, heart rate monitor, and stress management tools.',
// //       brand: BrandModel(
// //         id: '17',
// //         image: CImages.fitbitLogo,
// //         name: 'Fitbit',
// //         productsCount: 30,
// //         isFeatured: true,
// //       ),
// //       images: [
// //         CImages.productImage72,
// //         CImages.productImage73,
// //       ],
// //       productAttributes: [
// //         ProductAttributeModel(name: 'Color', values: ['Black', 'Steel Blue']),
// //       ],
// //       productVariations: [
// //         ProductVariationModel(
// //           id: '1',
// //           stock: 30,
// //           price: 180,
// //           salePrice: 170,
// //           image: CImages.productImage72,
// //           attributeValues: {'Color': 'Black'},
// //         ),
// //         ProductVariationModel(
// //           id: '2',
// //           stock: 30,
// //           price: 180,
// //           salePrice: 170,
// //           image: CImages.productImage73,
// //           attributeValues: {'Color': 'Steel Blue'},
// //         ),
// //       ],
// //     ),

// // // Product 30
// //     ProductModel(
// //       id: '030',
// //       title: 'Nikon Z6 II Camera',
// //       stock: 20,
// //       price: 2000,
// //       salePrice: 1900,
// //       thumbnail: CImages.productImage74,
// //       productType: 'camera',
// //       sku: 'NKZ6II001',
// //       categoryId: '29',
// //       isFeatured: true,
// //       description:
// //           'Nikon Z6 II mirrorless camera with 24.5MP sensor and dual EXPEED 6 processors.',
// //       brand: BrandModel(
// //         id: '18',
// //         image: CImages.nikonLogo,
// //         name: 'Nikon',
// //         productsCount: 50,
// //         isFeatured: true,
// //       ),
// //       images: [
// //         CImages.productImage74,
// //         CImages.productImage75,
// //       ],
// //       productAttributes: [
// //         ProductAttributeModel(name: 'Resolution', values: ['24.5MP']),
// //         ProductAttributeModel(name: 'Color', values: ['Black']),
// //       ],
// //       productVariations: [
// //         ProductVariationModel(
// //           id: '1',
// //           stock: 20,
// //           price: 2000,
// //           salePrice: 1900,
// //           image: CImages.productImage74,
// //           attributeValues: {'Resolution': '24.5MP', 'Color': 'Black'},
// //         ),
// //       ],
// //     ),
//   ];




// }
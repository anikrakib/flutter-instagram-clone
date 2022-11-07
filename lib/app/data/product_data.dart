import 'dart:math';
import 'package:faker/faker.dart';
import '../model/product_model.dart';

final List<Product> products = [
  Product(
    productTitle: 'Android Smartwatch',
    productPrice: 2500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.2,
    productUrl:
        'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1099&q=80',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Editorial, Technology, Arts & Culture',
    productPrice: 1500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.1,
    productUrl:
        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Black Fujifilm Dslr Camera',
    productPrice: 180000,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.15,
    productUrl:
        'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Red Lighter',
    productPrice: 1500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.5,
    productUrl:
        'https://images.pexels.com/photos/335257/pexels-photo-335257.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Colorful Cable Wires',
    productPrice: 350,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.0,
    productUrl:
        'https://images.pexels.com/photos/2332885/pexels-photo-2332885.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Nike Shoes on Black Backround',
    productPrice: 3800,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.15,
    productUrl:
        'https://images.pexels.com/photos/1598505/pexels-photo-1598505.jpeg?auto=compress&cs=tinysrgb&w=300',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Sneakers on White Background',
    productPrice: 4500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.25,
    productUrl:
        'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=300',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'An Air Jordan Shoe on a Flat Surface',
    productPrice: 8000,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.5,
    productUrl:
        'https://images.pexels.com/photos/9214286/pexels-photo-9214286.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Black and White Nike High Top Sneaker on Red Satin Textile',
    productPrice: 8000,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.4,
    productUrl:
        'https://images.pexels.com/photos/6540927/pexels-photo-6540927.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle:
        'Nike Orange Shoes',
    productPrice: 11000,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.3,
    productUrl:
        'https://images.pexels.com/photos/10046272/pexels-photo-10046272.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'A Close-Up Shot of a Pair of Nike Shoes',
    productPrice: 4500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.2,
    productUrl:
        'https://images.pexels.com/photos/6692038/pexels-photo-6692038.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Close-up of Nike SB Dunk High Strawberry Cough',
    productPrice: 7500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.4,
    productUrl:
        'https://images.pexels.com/photos/6692038/pexels-photo-6692038.jpeg',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Nike Sneakers',
    productPrice: 7500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.3,
    productUrl:
        'https://images.pexels.com/photos/10154937/pexels-photo-10154937.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Orange and Black Leather Satchel Bag',
    productPrice: 4500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.5,
    productUrl:
        'https://images.pexels.com/photos/1152077/pexels-photo-1152077.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Black Leather Handbag with Black Background',
    productPrice: 1500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.15,
    productUrl:
        'https://images.pexels.com/photos/12105084/pexels-photo-12105084.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Gray and Black Wolf Graphic Handbag',
    productPrice: 7500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.5,
    productUrl:
        'https://images.pexels.com/photos/45981/pexels-photo-45981.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Black Organizer Bag Set',
    productPrice: 1500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.0,
    productUrl:
        'https://images.pexels.com/photos/842959/pexels-photo-842959.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Leather Brown Shoes',
    productPrice: 3800,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.0,
    productUrl: 'https://images.pexels.com/photos/10961742/pexels-photo-10961742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Photo of a Brown Leather Bag on Black Surface',
    productPrice: 1750,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.10,
    productUrl:
        'https://images.pexels.com/photos/8502484/pexels-photo-8502484.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Still Life with Purse and Rowanberries',
    productPrice: 9500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.5,
    productUrl:
        'https://images.pexels.com/photos/11031117/pexels-photo-11031117.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Brown Leather Backpack On A Grassfield',
    productPrice: 3850,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.35,
    productUrl:
        'https://images.pexels.com/photos/3155047/pexels-photo-3155047.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Photo Of Pink Cosmetics',
    productPrice: 1750,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.25,
    productUrl:
        'https://images.pexels.com/photos/2587370/pexels-photo-2587370.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Photo Of Red Lipstick',
    productPrice: 1850,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.35,
    productUrl:
        'https://images.pexels.com/photos/3060258/pexels-photo-3060258.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Black Camera Lens on Brown Wooden Table',
    productPrice: 150000,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.25,
    productUrl:
        'https://images.pexels.com/photos/3602258/pexels-photo-3602258.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Black Action Camera',
    productPrice: 75000,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.2,
    productUrl:
        'https://images.pexels.com/photos/2378079/pexels-photo-2378079.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Close-up Photography of Camera',
    productPrice: 24500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.0,
    productUrl:
        'https://images.pexels.com/photos/1034096/pexels-photo-1034096.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'White and Gray Bluetooth Speaker on Brown Wooden Surface',
    productPrice: 11500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.27,
    productUrl:
        'https://images.pexels.com/photos/1279107/pexels-photo-1279107.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Green Earphones on Wooden Table',
    productPrice: 7500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.12,
    productUrl:
        'https://images.pexels.com/photos/9005092/pexels-photo-9005092.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Close-Up Photo of Apple Airpods',
    productPrice: 21500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.15,
    productUrl:
        'https://images.pexels.com/photos/3921847/pexels-photo-3921847.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Black Earphones over Black Bock',
    productPrice: 17500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.25,
    productUrl:
        'https://images.pexels.com/photos/9610815/pexels-photo-9610815.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Two Silver Bottles',
    productPrice: 3780,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.18,
    productUrl:
        'https://images.pexels.com/photos/279480/pexels-photo-279480.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Close-Up Shot of a Serum Bottle',
    productPrice: 4560,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.32,
    productUrl:
        'https://images.pexels.com/photos/10819536/pexels-photo-10819536.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Coca Cola Can on Black Surface',
    productPrice: 80,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.0,
    productUrl:
        'https://images.pexels.com/photos/3819969/pexels-photo-3819969.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Women\'s Yellow Long-sleeved Dress',
    productPrice: 5750,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.40,
    productUrl:
        'https://images.pexels.com/photos/1055691/pexels-photo-1055691.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Photo Of Woman Wearing White Sweater',
    productPrice: 3500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.35,
    productUrl:
        'https://images.pexels.com/photos/3336537/pexels-photo-3336537.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Photo Of Woman Wearing Red Tank Top',
    productPrice: 2750,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.2,
    productUrl:
        'https://images.pexels.com/photos/3124851/pexels-photo-3124851.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Photo Of Woman Wearing Sunglasses',
    productPrice: 1950,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.15,
    productUrl:
        'https://images.pexels.com/photos/2907763/pexels-photo-2907763.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Photo Of Woman Looking Up With Arms Wide Open',
    productPrice: 2780,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.25,
    productUrl:
        'https://images.pexels.com/photos/2835567/pexels-photo-2835567.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Man Wearing Black Hat and Black Coat',
    productPrice: 9500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.4,
    productUrl:
        'https://images.pexels.com/photos/157675/fashion-men-s-individuality-black-and-white-157675.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Man in Black Leather Jacket',
    productPrice: 11500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.45,
    productUrl:
        'https://images.pexels.com/photos/4058571/pexels-photo-4058571.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Grayscale Photography of Man Wearing Hooded Jacket',
    productPrice: 3750,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.25,
    productUrl:
        'https://images.pexels.com/photos/2015207/pexels-photo-2015207.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Man in Floral Suit Jacket',
    productPrice: 8500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.25,
    productUrl:
        'https://images.pexels.com/photos/6855090/pexels-photo-6855090.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Man in Black Suit Jacket',
    productPrice: 8500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.25,
    productUrl:
        'https://images.pexels.com/photos/5367643/pexels-photo-5367643.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Woman Standing Indoor',
    productPrice: 4500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.15,
    productUrl:
        'https://images.pexels.com/photos/1926769/pexels-photo-1926769.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Woman in Blue and White Striped Top Raising Her Left Hand',
    productPrice: 4500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.35,
    productUrl:
        'https://images.pexels.com/photos/1462637/pexels-photo-1462637.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle:
        'Woman Wearing Red See Through Long-sleeved Dress Smiling While Glancing Her Left Side',
    productPrice: 4750,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.0,
    productUrl:
        'https://images.pexels.com/photos/2695483/pexels-photo-2695483.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Woman Wearing Red Dress Standing on Staircase',
    productPrice: 3750,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.0,
    productUrl:
        'https://images.pexels.com/photos/1755428/pexels-photo-1755428.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Low-angle Photography of Woman Standing Under Calm Blue Sky',
    productPrice: 3450,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.0,
    productUrl:
        'https://images.pexels.com/photos/2323140/pexels-photo-2323140.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Photography of Guy Wearing Yellow Hoodie',
    productPrice: 2950,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.0,
    productUrl:
        'https://images.pexels.com/photos/1183266/pexels-photo-1183266.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Women\'s Black Long-sleeved Shirt With White Polka Dots',
    productPrice: 3580,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.45,
    productUrl:
        'https://images.pexels.com/photos/1021693/pexels-photo-1021693.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Photo of Woman in Sleeveless Dress',
    productPrice: 3750,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.25,
    productUrl:
        'https://images.pexels.com/photos/1007020/pexels-photo-1007020.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Woman in White Dress Leaning on Brick Wall Posing for Photo',
    productPrice: 3250,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.0,
    productUrl:
        'https://images.pexels.com/photos/938181/pexels-photo-938181.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle:
        'Low-angle Photography of Two Women Standing Under White and Blue Sky',
    productPrice: 3580,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.2,
    productUrl:
        'https://images.pexels.com/photos/1721558/pexels-photo-1721558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle:
        'Woman in Black Spaghetti Strap Dress Leaning on Brown Wooden Railing',
    productPrice: 2450,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.1,
    productUrl:
        'https://images.pexels.com/photos/7453205/pexels-photo-7453205.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Woman Wearing Black Coat Holding Brown Jacket',
    productPrice: 3950,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.25,
    productUrl:
        'https://images.pexels.com/photos/1457983/pexels-photo-1457983.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Woman in Pink Dress',
    productPrice: 3650,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.15,
    productUrl:
        'https://images.pexels.com/photos/902030/pexels-photo-902030.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Woman Wearing Blue Fur Coat And Dress',
    productPrice: 7500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.1,
    productUrl:
        'https://images.pexels.com/photos/1375736/pexels-photo-1375736.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle:
        'Silver Imac, Apple Magic Keyboard, and Magic Mouse on Wooden Table',
    productPrice: 11250,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.25,
    productUrl:
        'https://images.pexels.com/photos/38568/apple-imac-ipad-workplace-38568.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Black Ipad Beside Green Iphone 5c',
    productPrice: 27500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.1,
    productUrl:
        'https://images.pexels.com/photos/159643/laptop-ipad-organic-natural-159643.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle:
        'Silver Linked Bracelet Silver and Black Round Chronograph Watch',
    productPrice: 9500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.15,
    productUrl:
        'https://images.pexels.com/photos/190819/pexels-photo-190819.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Gold and Black Chronograph Watch',
    productPrice: 1150000,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.15,
    productUrl:
        'https://images.pexels.com/photos/13703305/pexels-photo-13703305.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Gold and Silver Round Chronograph Watch',
    productPrice: 999999,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.33,
    productUrl:
        'https://images.pexels.com/photos/9982602/pexels-photo-9982602.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Black Apple Watch With Black Sports Band',
    productPrice: 29500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.22,
    productUrl:
        'https://images.pexels.com/photos/437037/pexels-photo-437037.jpeg',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Gold and Silver Watch on Gray Surface',
    productPrice: 375000,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.11,
    productUrl:
        'https://images.pexels.com/photos/9982541/pexels-photo-9982541.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Close-up of a Diesel Wristwatch',
    productPrice: 22750,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.15,
    productUrl:
        'https://images.pexels.com/photos/9979675/pexels-photo-9979675.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Close-up of a Seven Friday Wristwatch',
    productPrice: 11950,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.0,
    productUrl:
        'https://images.pexels.com/photos/9979251/pexels-photo-9979251.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Close-up of a Longines Wristwatch',
    productPrice: 11950,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.0,
    productUrl:
        'https://images.pexels.com/photos/9979675/pexels-photo-9979675.jpeg',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Woman Standing',
    productPrice: 2580,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.0,
    productUrl:
        'https://images.pexels.com/photos/2006726/pexels-photo-2006726.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Photo of Woman Wearing Long sleeved Top and Long Skirt',
    productPrice: 4500,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.25,
    productUrl:
        'https://images.pexels.com/photos/1007017/pexels-photo-1007017.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Pair of Brown Leather Casual Shoes on Table',
    productPrice: 17850,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.35,
    productUrl:
        'https://images.pexels.com/photos/298863/pexels-photo-298863.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Red Shoes on White Chair',
    productPrice: 4850,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.15,
    productUrl:
        'https://images.pexels.com/photos/3467165/pexels-photo-3467165.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
  Product(
    productTitle: 'Brown Leather Brogue Shoes Beside Eyeglasses and Watch',
    productPrice: 3590,
    productDescription:
        'Esports has a new apex predator. As successor to the award-winning Razer Viper Ultimate, our latest evolution is nearly 22% lighter and armed with all-round upgrades for enhanced performance. As one of the lightest wireless gaming mice ever, there’s now nothing holding you back with the Razer Viper V2 Pro.',
    productDiscount: 0.1,
    productUrl:
        'https://images.pexels.com/photos/1619655/pexels-photo-1619655.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    productDetails: Faker().lorem.sentence(),
    productBrand: ProductBrand(
      brandName: Faker().company.name(),
      brandWebSite: Faker().internet.domainName(),
      follower: '${Random().nextInt(20)}k',
    ),
  ),
];

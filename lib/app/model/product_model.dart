class Product {
  final String productTitle;
  final int productPrice;
  final String productDescription;
  final double productDiscount;
  final String productUrl;
  final String productDetails;
  final ProductBrand productBrand;

  Product({
    required this.productTitle,
    required this.productPrice,
    required this.productDescription,
    required this.productDiscount,
    required this.productUrl,
    required this.productDetails,
    required this.productBrand,
  });
}

class ProductBrand {
  final String brandName;
  final String brandWebSite;
  final String follower;

  ProductBrand({
    required this.brandName,
    required this.brandWebSite,
    required this.follower,
  });
}

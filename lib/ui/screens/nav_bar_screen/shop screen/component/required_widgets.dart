import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/generated/assets.dart';
import 'package:instagram_clone/ui/app_widgets/app_image.dart';
import 'package:instagram_clone/ui/app_widgets/button.dart';
import 'package:instagram_clone/ui/app_widgets/widgets.dart';
import 'package:instagram_clone/ui/screens/nav_bar_screen/shop%20screen/screen/product_details.dart';
import 'package:instagram_clone/utils/constants.dart';
import '../../../../../app/controller/shop_controller.dart';
import '../../../../../app/model/product_model.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../theme.dart';

Widget productsStaggeredGridView(List<Product> productList) {
  return StaggeredGridView.countBuilder(
    crossAxisCount: 4,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: productList.length,
    itemBuilder: (context, index) {
      var product = productList[index];
      return GestureDetector(
        onTap: () {
          Get.to(ProductDetails(product: productList[index]));
        },
        child: Hero(
          tag: product.productUrl,
          transitionOnUserGestures: true,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Get.isDarkMode
                ? const Color(0xff272627)
                : const Color(0xffeeefee),
            child: CachedNetworkImage(
              imageUrl: product.productUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    },
    staggeredTileBuilder: (index) => const StaggeredTile.count(2, 1.8),
    mainAxisSpacing: 2.0,
    crossAxisSpacing: 2.0,
  );
}

Widget videoBox() {
  return customButton(
    widget: const Align(
      alignment: Alignment.center,
      child: Text(
        'Videos',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

Widget searchBox() {
  return customButton(
    widget: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: defaultPadding),
          child: svgImageWithColor(
              18, 18, Assets.bottomNavbarIconSearch, AppColors.faded),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: defaultPadding),
            child: Text(
              'Search shops',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.faded,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

AppBar shopAppBar(ShopController shopController, BuildContext context) {
  return AppBar(
    title: Obx(
      () => Row(
        children: [
          Visibility(
              visible: !(shopController.visibleTitle.value),
              child: const Text('Shop')),
          Visibility(
            visible: shopController.visibleTitle.value,
            child: Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.searchProduct);
                },
                child: Container(
                  height: 35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Get.isDarkMode
                        ? const Color(0xff272627)
                        : const Color(0xffeeefee),
                  ),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: defaultPadding),
                      child: Text(
                        'Search shops',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
    actions: [
      svgImageWithColor(
          22, 22, Assets.iconsIconWishlist, Theme.of(context).primaryColor),
      sizeBox(20),
      svgImageWithColor(
          20, 20, Assets.iconsIconMenu, Theme.of(context).primaryColor),
      sizeBox(10),
    ],
  );
}

Widget productDetailsBottomPart(
    {required BuildContext context, required Product product}) {
  return Padding(
    padding: const EdgeInsets.only(left: defaultPadding, right: defaultPadding),
    child: Row(
      children: [
        shopLogo(size: 60, product: product),
        sizeBox(20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Continue Shopping',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              sizeBox(5),
              Text(
                product.productBrand.brandName,
                style: const TextStyle(
                  color: AppColors.faded,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        RotatedBox(
          quarterTurns: 2,
          child: svgImageWithColor(
              15, 15, Assets.iconsIconBack, Theme.of(context).primaryColor),
        ),
      ],
    ),
  );
}

Widget shopLogo({required double size, required Product product}) {
  return SizedBox(
    height: size,
    width: size,
    child: CircleAvatar(
      backgroundColor: Get.isDarkMode
          ? AppColors.lightBlackGrey
          : AppColors.postImagePreviewBackgroundLightMode,
      child: Text(
        companyIconFromName(product.productBrand.brandName),
        style: TextStyle(
          color: Get.isDarkMode ? AppColors.light : AppColors.dark,
          fontSize: 12,
        ),
      ),
    ),
  );
}

Widget shopDetails({required Product product}) {
  return Padding(
    padding: const EdgeInsets.only(left: defaultPadding, right: defaultPadding),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            shopLogo(size: 60, product: product),
            sizeBox(20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productBrand.brandName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  sizeBox(5),
                  Text(
                    product.productBrand.brandWebSite,
                    style: const TextStyle(
                      color: AppColors.faded,
                      fontSize: 14,
                    ),
                  ),
                  sizeBox(5),
                  Text(
                    'Followed by ${Faker().internet.userName()}, ${Faker().internet.userName()} and ${product.productBrand.follower} others',
                    style: const TextStyle(
                      color: AppColors.faded,
                      fontSize: 13,
                    ),
                  ),
                  const Text(
                    'View business information',
                    style: TextStyle(
                      color: AppColors.secondary,
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        sizeBox(20),
        SizedBox(
          width: double.infinity,
          height: 35,
          child: ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
                Get.isDarkMode ? AppColors.light : AppColors.dark,
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Get.isDarkMode
                    ? AppColors.postImagePreviewBackgroundDarkMode
                    : AppColors.postImagePreviewBackgroundLightMode,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            onPressed: () => {},
            child: const Text(
              "View shop",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ),
        sizeBox(10),
      ],
    ),
  );
}

Widget productTitleAndPrice(
    {required BuildContext context, required Product product}) {
  return Padding(
    padding: const EdgeInsets.only(left: defaultPadding, right: defaultPadding),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productTitle,
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  sizeBox(10),
                  productPrice(
                    discountPrice(
                        product.productPrice, product.productDiscount),
                    product.productPrice,
                    product.productDiscount,
                  )
                ],
              ),
            ),
            sizeBox(10),
            Row(
              children: [
                navigationSVGImage(context, Assets.iconsIconMessage),
                sizeBox(10),
                navigationSVGImage(context, Assets.iconsIconBookmark),
              ],
            )
          ],
        ),
        sizeBox(10),
        SizedBox(
          width: double.infinity,
          height: 45,
          child: ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
                AppColors.light,
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                AppColors.secondary,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            onPressed: () => {},
            child: const Text(
              "View on website",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget productImage({required BuildContext context, required Product product}) {
  return Center(
    child: Hero(
      tag: product.productUrl,
      transitionOnUserGestures: true,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        color:
            Get.isDarkMode ? const Color(0xff272627) : const Color(0xffeeefee),
        child: CachedNetworkImage(
          imageUrl: product.productUrl,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

AppBar productDetailsAppBar(
    {required BuildContext context, required Product product}) {
  return AppBar(
    title: Row(
      children: [
        shopLogo(size: 35, product: product),
        sizeBox(10),
        Expanded(
          child: Text(
            product.productBrand.brandName,
            style: TextStyle(
              color: Get.isDarkMode ? AppColors.light : AppColors.dark,
              fontSize: 15,
            ),
          ),
        ),
      ],
    ),
    actions: [
      svgImageWithColor(15, 15, Assets.iconsIconOptionVertical,
          Theme.of(context).primaryColor),
      sizeBox(20),
    ],
  );
}

Widget buildDivider() {
  return const Divider(
    thickness: 0.5,
    color: AppColors.faded,
  );
}

Widget buildColumn(String sectionName,
    [String details = '', bool isIconVisibleOrNot = false]) {
  return Column(
    children: [
      buildDivider(),
      Padding(
        padding:
            const EdgeInsets.only(left: defaultPadding, right: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizeBox(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sectionName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Visibility(
                  visible: isIconVisibleOrNot,
                  child: svgImageWithColor(
                      8, 8, Assets.iconsIconArrowDown, AppColors.faded),
                ),
              ],
            ),
            sizeBox(10),
            details.isNotEmpty
                ? Text(
                    details,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.faded,
                      letterSpacing: 0.5,
                      wordSpacing: 3,
                    ),
                  )
                : sizeBox(10),
            sizeBox(10),
          ],
        ),
      )
    ],
  );
}

Widget productPrice(int newPrice, int oldPrice, double discount) {
  int discountValue = (discount * 100).toInt();
  return RichText(
    textAlign: TextAlign.start,
    maxLines: 2,
    text: TextSpan(
      text: '৳$newPrice ',
      style: const TextStyle(
        color: AppColors.secondary,
        fontSize: 16,
      ),
      children: [
        TextSpan(
          text: (discountValue != 0) ? '৳$oldPrice' : '',
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.faded,
            decoration: TextDecoration.lineThrough,
          ),
        ),
        TextSpan(
          text: (discountValue != 0) ? ' ($discountValue% off)' : '',
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.faded,
          ),
        )
      ],
    ),
  );
}

int discountPrice(int price, double discount) {
  var finalPrice = price - (price * discount);
  return finalPrice.toInt();
}

String companyIconFromName(String name) {
  var words = name.split(RegExp(r'[,-. ]'));
  var codeName = StringBuffer();
  for (var s in words) {
    if (s.isNotEmpty) {
      if (s[0].codeUnits[0] >= 65 && s[0].codeUnits[0] <= 90) {
        codeName.write(s[0]);
      }
    }
  }
  return codeName.toString();
}

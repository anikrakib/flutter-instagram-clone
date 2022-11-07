import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/data/product_data.dart';
import 'package:instagram_clone/ui/app_widgets/widgets.dart';
import '../../../../app/controller/shop_controller.dart';
import '../../../../app/model/product_model.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/constants.dart';
import 'component/required_widgets.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  ScrollController scrollController = ScrollController();
  final shopController = Get.put(ShopController());
  List<Product> productList = [];

  @override
  void initState() {
    productList.addAll(products);
    productList.shuffle();
    scrollController.addListener(() {
      shopController.updateTitleVisibility(scrollController.offset > 40);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: shopAppBar(shopController, context),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            controller: scrollController,
            child: Material(
              color: Theme.of(context).backgroundColor,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.searchProduct);
                    },
                    child:  Padding(
                      padding: const EdgeInsets.only(left: defaultPadding, right: defaultPadding),
                      child: searchBox(),
                    ),
                  ),
                  sizeBox(10),
                  Padding(
                    padding: const EdgeInsets.only(left: defaultPadding, right: defaultPadding),
                    child: videoBox(),
                  ),
                  sizeBox(10),
                  productsStaggeredGridView(productList),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

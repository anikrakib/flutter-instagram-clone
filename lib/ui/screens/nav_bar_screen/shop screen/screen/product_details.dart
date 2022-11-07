import 'package:flutter/material.dart';
import 'package:instagram_clone/app/model/product_model.dart';
import 'package:instagram_clone/ui/app_widgets/widgets.dart';
import '../component/required_widgets.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productDetailsAppBar(context:context,product: product),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                productImage(context:context,product: product),
                sizeBox(20),
                productTitleAndPrice(context:context,product: product),
                buildColumn('Description', product.productDescription, true),
                buildColumn('Product Details', product.productDetails, true),
                buildColumn('About this Shop'),
                shopDetails(product: product),
                buildDivider(),
                sizeBox(10),
                productDetailsBottomPart(context: context,product: product),
                sizeBox(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:souq_mazad/core/router/routes.dart';
import 'package:souq_mazad/features/home/data/models/product_model.dart';
import 'package:souq_mazad/features/home/widgets/product_item.dart';

class ProductsGridView extends StatelessWidget {
  final List<Products> productList;
  const ProductsGridView({super.key, required this.productList});

  @override
 
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: .9),
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.productDetailsScreen,
                  arguments: productList[index],
                );
              },
              child: ProductItem(
                products: productList[index],
              ));
        });
  }
}

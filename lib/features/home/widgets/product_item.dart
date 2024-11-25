import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_mazad/core/helper/spacing.dart';
import 'package:souq_mazad/features/home/data/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final Products products;
  const ProductItem({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
         
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Image.network(
            products.thumbnail ?? '',
            height: 125.h,
          )),
          verticalSpace(5),
          Flexible(
            child: Text(
              overflow: TextOverflow.ellipsis,
              products.title ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          verticalSpace(3),
          Flexible(
            child: Text(
              '\$${products.price}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.orange),
            ),
          )
        ],
      ),
    );
  }
}


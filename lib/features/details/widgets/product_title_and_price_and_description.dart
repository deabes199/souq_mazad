import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_mazad/core/helper/spacing.dart';
import 'package:souq_mazad/features/home/data/models/product_model.dart';

class ProductTitleAndPriceAndDescription extends StatelessWidget {
  final Products products;
  const ProductTitleAndPriceAndDescription({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           products.title ?? 'none',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
          ),
          verticalSpace(10),
          Text(
            '\$${products.price}',
            style: TextStyle(
                fontSize: 18.sp,
                color: Colors.orange,
                fontWeight: FontWeight.bold),
          ),
          verticalSpace(10),
          Text(
            'Description',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
          ),
          Text(
            products.description ?? 'none',
           
            style: TextStyle(color: Colors.grey.shade800),
          ),
          verticalSpace(20),
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.orange,
            ),
            child:const Align(
                alignment: Alignment.center,
                child: Text('Buy Now',
                    style: TextStyle(
                      color: Colors.white,
                    ))),
          )
        ],
      ),
    );
  }
}

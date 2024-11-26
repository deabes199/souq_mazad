import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:souq_mazad/core/helper/spacing.dart';

class ProductDetailsShimmerLoading extends StatelessWidget {
  const ProductDetailsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 400,
                  width: double.infinity,
                  color: Colors.white,
                ),
              ),
           
            ],
          ),
          verticalSpace(10),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
         
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 20,
                    width: 200,
                    color: Colors.white,
                  ),
                ),
                verticalSpace(10),

                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 20,
                    width: 100,
                    color: Colors.white,
                  ),
                ),
                verticalSpace(20),

                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 20,
                    width: 120,
                    color: Colors.white,
                  ),
                ),
                verticalSpace(10),

                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Column(
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Container(
                          height: 15,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                verticalSpace(20),

                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

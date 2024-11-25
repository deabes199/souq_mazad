import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq_mazad/core/helper/spacing.dart';
import 'package:souq_mazad/features/details/widgets/product_details_shimmer_loading.dart';
import 'package:souq_mazad/features/details/widgets/product_image.dart';
import 'package:souq_mazad/features/details/widgets/product_title_and_price_and_description.dart';
import 'package:souq_mazad/features/home/data/models/product_model.dart';
import 'package:souq_mazad/features/home/logic/cubit/products_cubit.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Products products;
  const ProductDetailsScreen({super.key, required this.products});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.read<ProductsCubit>().toggleProductDetailsLoading(value: false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (context.read<ProductsCubit>().isProductDetailsLoading) {
              return const Center(
                child: ProductDetailsShimmerLoading(),
              );
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImage(
                    products: widget.products,
                  ),
                  verticalSpace(10),
                  ProductTitleAndPriceAndDescription(
                    products: widget.products,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

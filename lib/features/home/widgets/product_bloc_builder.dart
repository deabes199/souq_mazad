import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq_mazad/core/helper/spacing.dart';
import 'package:souq_mazad/features/home/logic/cubit/products_cubit.dart';
import 'package:souq_mazad/features/home/widgets/product_shimmer_loading.dart';
import 'package:souq_mazad/features/home/widgets/products_grid_view.dart';

class ProductBlocBuilder extends StatefulWidget {
  const ProductBlocBuilder({super.key});

  @override
  State<ProductBlocBuilder> createState() => _ProductBlocBuilderState();
}

class _ProductBlocBuilderState extends State<ProductBlocBuilder> {
  @override
  initState() {
    super.initState();
    context.read<ProductsCubit>().getAllproduct(limit: 10, skip: 0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
      if (state is GetProductsLoadingState) {
        return const ProductShimmerLoading();
      } else if (state is GetProductsSuccessState) {
        return ProductsGridView(
            productList: context.read<ProductsCubit>().productsList);
      } else if (state is GetProductPaginationLoading) {
        return Column(children: [
          ProductsGridView(
              productList: context.read<ProductsCubit>().productsList),
          verticalSpace(20),
          const CircularProgressIndicator(),
          // verticalSpace(20),
          // const ProductShimmerLoading(),
        ]);
      } else if (state is GetProductsFaliureState) {
        return Center(child: Text(state.error));
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}

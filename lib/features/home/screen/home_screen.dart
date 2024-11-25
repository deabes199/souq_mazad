import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq_mazad/features/home/logic/cubit/products_cubit.dart';
import 'package:souq_mazad/features/home/widgets/product_bloc_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getPaginationProducts();
      }
    });
  }

  getPaginationProducts() async {
    if (context.read<ProductsCubit>().isFirstLoading) {
      return;
    } else {
      await context.read<ProductsCubit>().getAllproduct(
            limit: 10,
            skip: context.read<ProductsCubit>().productsList.length,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Screen'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: const ProductBlocBuilder(),
          ),
        ),
      ),
    );
  }
}

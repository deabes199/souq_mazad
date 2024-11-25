import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq_mazad/core/di/dependancy_injection.dart';
import 'package:souq_mazad/core/router/routes.dart';
import 'package:souq_mazad/features/details/screens/product_details_screen.dart';
import 'package:souq_mazad/features/home/data/models/product_model.dart';
import 'package:souq_mazad/features/home/screen/home_screen.dart';
import 'package:souq_mazad/features/home/logic/cubit/products_cubit.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<ProductsCubit>(),
                  child: const HomeScreen(),
                ));
      case Routes.productDetailsScreen:
        final product = settings.arguments as Products;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<ProductsCubit>(),
                  child: ProductDetailsScreen(
                    products: product,
                  ),
                ));

      default:
        const Scaffold(
          body: Center(
            child: Text('Not Route'),
          ),
        );
    }
    return null;
  }
}

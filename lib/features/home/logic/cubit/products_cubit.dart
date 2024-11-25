import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:souq_mazad/features/home/data/models/product_model.dart';
import 'package:souq_mazad/features/home/data/repos/product_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitialState());
  final ProductRepo productRepo;
  bool isFirstLoading = true;
  List<Products> productsList = [];
  getAllproduct({required int limit, required int skip}) async {
    if (isFirstLoading) {
      productsList = [];
      emit(GetProductsLoadingState());
    } else {
      emit(GetProductPaginationLoading());
    }

    final response = await productRepo.getAllProduct(limit: limit, skip: skip);
    response.fold((error) {
      emit(GetProductsFaliureState(error.errorMessage));
    }, (product) {
      if (isFirstLoading) {
        productsList = product.products;
        isFirstLoading = false;
      } else {
        productsList.addAll(product.products);
        productsList.toSet().toList();
      }
      emit(GetProductsSuccessState());
    });
  }

// shimmer product details
  bool isProductDetailsLoading = true;

  void toggleProductDetailsLoading({required bool value}) {
    isProductDetailsLoading = value;
    emit(ToggleProductDetailsLoadingState());
  }
}

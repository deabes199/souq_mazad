part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitialState extends ProductsState {}

final class GetProductsLoadingState extends ProductsState {}

final class GetProductsSuccessState extends ProductsState {}

final class GetProductsFaliureState extends ProductsState {
  final String error;

  GetProductsFaliureState(this.error);
}

class ToggleProductDetailsLoadingState extends ProductsState {}

final class GetProductPaginationLoading extends ProductsState {}

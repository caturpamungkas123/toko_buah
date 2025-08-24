part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductLoad extends ProductState {
  final ListCategoryModel categori;
  ProductLoad(this.categori);
}

final class ProductFail extends ProductState {
  final String message;
  ProductFail(this.message);
}

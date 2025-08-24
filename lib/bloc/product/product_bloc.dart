import 'package:flutter/material.dart';
import 'package:toko_buah/model/product/category.product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toko_buah/service/product/list.categroy.product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<OnFetchCatgortProduct>((event, emit) async {
      emit(ProductLoading());
      ListCategoryModel? result =
          await ListProductCategory.fetchCategoriesProduct();
      if (result == null) {
        emit(ProductFail("some think wrong"));
      } else {
        emit(ProductLoad(result));
      }
    });
  }
}
